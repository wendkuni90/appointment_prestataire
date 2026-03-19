import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/models/models.dart';
import '../../../core/providers/agenda_provider.dart';
import '../../../core/providers/dashboard_provider.dart';
import '../../../core/utils/theme.dart';

class AgendaScreen extends ConsumerStatefulWidget {
  const AgendaScreen({super.key});

  @override
  ConsumerState<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends ConsumerState<AgendaScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pendingAsync  = ref.watch(
        appointmentsByStatusProvider(AppointmentStatus.EN_ATTENTE));
    final confirmedAsync = ref.watch(
        appointmentsByStatusProvider(AppointmentStatus.CONFIRME));
    final historyAsync  = ref.watch(historyAppointmentsProvider);

    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      appBar: AppBar(
        title: const Text('Agenda'),
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabs,
          indicatorColor: AppColors.accent,
          indicatorWeight: 2,
          labelColor: AppColors.accent,
          unselectedLabelColor: AppColors.textMuted,
          labelStyle: AppTextStyles.labelLg,
          unselectedLabelStyle: AppTextStyles.labelLg,
          tabs: [
            // Badge sur "En attente" — Stack pour éviter le débordement
            Tab(
              child: pendingAsync.maybeWhen(
                data: (list) => list.isEmpty
                    ? const Text('En attente')
                    : Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Text('En attente'),
                          Positioned(
                            top: -6,
                            right: -14,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: const BoxDecoration(
                                color: AppColors.warning,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${list.length > 9 ? '9+' : list.length}',
                                  style: const TextStyle(
                                    fontFamily: 'DMSans',
                                    color: AppColors.bgDeep,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                orElse: () => const Text('En attente'),
              ),
            ),
            const Tab(text: 'Confirmés'),
            const Tab(text: 'Historique'),
          ],
        ),
      ),
      body: RefreshIndicator(
        color: AppColors.accent,
        backgroundColor: AppColors.bgPanel,
        onRefresh: () async => ref.invalidate(myAppointmentsProvider),
        child: TabBarView(
          controller: _tabs,
          children: [
            // ── En attente ──────────────────────────────────────────
            _ApptList(
              async: pendingAsync,
              emptyIcon: Icons.check_circle_outline_rounded,
              emptyText: 'Aucune demande en attente',
              emptyColor: AppColors.green,
              cardBuilder: (appt) => _PendingCard(appt: appt),
            ),
            // ── Confirmés ───────────────────────────────────────────
            _ApptList(
              async: confirmedAsync,
              emptyIcon: Icons.event_available_rounded,
              emptyText: 'Aucun rendez-vous confirmé',
              cardBuilder: (appt) => _ConfirmedCard(appt: appt),
            ),
            // ── Historique ──────────────────────────────────────────
            _ApptList(
              async: historyAsync,
              emptyIcon: Icons.history_rounded,
              emptyText: 'Aucun historique',
              cardBuilder: (appt) => _HistoryCard(appt: appt),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// LISTE GÉNÉRIQUE
// ══════════════════════════════════════════════════════════════════════════════

class _ApptList extends StatelessWidget {
  final AsyncValue<List<AppointmentResponse>> async;
  final Widget Function(AppointmentResponse) cardBuilder;
  final IconData emptyIcon;
  final String   emptyText;
  final Color    emptyColor;

  const _ApptList({
    required this.async,
    required this.cardBuilder,
    required this.emptyIcon,
    required this.emptyText,
    this.emptyColor = AppColors.textMuted,
  });

  @override
  Widget build(BuildContext context) {
    return async.when(
      loading: () => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (_, __) => _CardSkeleton(),
      ),
      error: (_, __) => const _ErrorState(),
      data: (list) {
        if (list.isEmpty) {
          return _EmptyState(
            icon: emptyIcon,
            text: emptyText,
            color: emptyColor,
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          itemCount: list.length,
          itemBuilder: (_, i) => cardBuilder(list[i]),
        );
      },
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// CARTE EN ATTENTE — Confirmer / Refuser
// ══════════════════════════════════════════════════════════════════════════════

class _PendingCard extends ConsumerWidget {
  final AppointmentResponse appt;
  const _PendingCard({required this.appt});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actionsState = ref.watch(appointmentActionsProvider);
    final isLoading    = actionsState is AsyncLoading;

    return _BaseCard(
      appt: appt,
      borderColor: AppColors.warning.withOpacity(0.35),
      actions: Row(
        children: [
          // Refuser
          Expanded(
            child: OutlinedButton.icon(
              onPressed: isLoading ? null : () => _showRefuseSheet(context, ref),
              icon: const Icon(Icons.close_rounded, size: 16),
              label: const Text('Refuser'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.error,
                side: BorderSide(color: AppColors.error.withOpacity(0.5)),
                minimumSize: const Size(0, 42),
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Confirmer
          Expanded(
            child: ElevatedButton.icon(
              onPressed: isLoading ? null : () => _confirm(context, ref),
              icon: isLoading
                  ? const SizedBox(width: 14, height: 14,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: AppColors.bgDeep))
                  : const Icon(Icons.check_rounded, size: 16),
              label: const Text('Confirmer'),
              style: ElevatedButton.styleFrom(minimumSize: const Size(0, 42)),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirm(BuildContext context, WidgetRef ref) async {
    final ok = await ref
        .read(appointmentActionsProvider.notifier)
        .confirm(appt.id);
    if (ok && context.mounted) _snack(context, 'Rendez-vous confirmé ✓', AppColors.green);
  }

  void _showRefuseSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bgPanel,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (_) => _RefuseSheet(apptId: appt.id),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// CARTE CONFIRMÉ — Clôturer
// ══════════════════════════════════════════════════════════════════════════════

class _ConfirmedCard extends ConsumerWidget {
  final AppointmentResponse appt;
  const _ConfirmedCard({required this.appt});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actionsState = ref.watch(appointmentActionsProvider);
    final isLoading    = actionsState is AsyncLoading;

    return _BaseCard(
      appt: appt,
      borderColor: AppColors.green.withOpacity(0.25),
      actions: ElevatedButton.icon(
        onPressed: isLoading ? null : () => _showClotureSheet(context, ref),
        icon: const Icon(Icons.done_all_rounded, size: 16),
        label: const Text('Clôturer le rendez-vous'),
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 42)),
      ),
    );
  }

  void _showClotureSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bgPanel,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (_) => _ClotureSheet(apptId: appt.id),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// CARTE HISTORIQUE — lecture seule
// ══════════════════════════════════════════════════════════════════════════════

class _HistoryCard extends StatelessWidget {
  final AppointmentResponse appt;
  const _HistoryCard({required this.appt});

  @override
  Widget build(BuildContext context) => _BaseCard(appt: appt);
}

// ══════════════════════════════════════════════════════════════════════════════
// BASE CARD — structure commune
// ══════════════════════════════════════════════════════════════════════════════

class _BaseCard extends StatelessWidget {
  final AppointmentResponse appt;
  final Color?  borderColor;
  final Widget? actions;

  const _BaseCard({required this.appt, this.borderColor, this.actions});

  void _showDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bgPanel,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _DetailSheet(appt: appt),
    );
  }

  @override
  Widget build(BuildContext context) {
    final debut = DateTime.parse(appt.dateHeureDebut);
    final fin   = DateTime.parse(appt.dateHeureFin);

    String fmtDate(DateTime d) {
      try { return DateFormat('EEE d MMM yyyy', 'fr_FR').format(d); }
      catch (_) { return DateFormat('dd/MM/yyyy').format(d); }
    }

    return GestureDetector(
      onTap: () => _showDetail(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.bgPanel,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor ?? AppColors.border),
        ),
      child: Column(
        children: [
          // ── En-tête : date + statut ───────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
            decoration: BoxDecoration(
              color: AppColors.bgSurface,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today_rounded,
                    size: 13, color: AppColors.textMuted),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    '${fmtDate(debut)}  ·  ${DateFormat('HH:mm').format(debut)} – ${DateFormat('HH:mm').format(fin)}',
                    style: AppTextStyles.labelMd
                        .copyWith(color: AppColors.textSecondary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                _StatusBadge(status: appt.status),
              ],
            ),
          ),

          // ── Corps ────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  // Avatar client
                  Container(
                    width: 40, height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.bgSurface,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${appt.client.firstName[0]}${appt.client.lastName[0]}'
                            .toUpperCase(),
                        style: AppTextStyles.labelMd
                            .copyWith(color: AppColors.textSecondary),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${appt.client.firstName} ${appt.client.lastName}',
                          style: AppTextStyles.headingSm,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (appt.client.phone != null)
                          Text(appt.client.phone!,
                              style: AppTextStyles.bodySm
                                  .copyWith(color: AppColors.textMuted)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(appt.service.nom,
                          style: AppTextStyles.labelLg,
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                      Text(
                        '${NumberFormat('#,###', 'fr_FR').format(appt.service.prix)} F · ${appt.service.duree} min',
                        style: AppTextStyles.bodySm
                            .copyWith(color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ]),

                // Note client
                if (appt.noteClient != null &&
                    appt.noteClient!.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.bgSurface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.format_quote_rounded,
                            size: 14, color: AppColors.textMuted),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            appt.noteClient!,
                            style: AppTextStyles.bodyMd.copyWith(
                                color: AppColors.textSecondary, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                // Motif refus/annulation
                if ((appt.motifRefus != null && appt.motifRefus!.isNotEmpty) ||
                    (appt.motifAnnulation != null && appt.motifAnnulation!.isNotEmpty)) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.errorDim,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.error.withOpacity(0.2)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.info_outline_rounded,
                            size: 14, color: AppColors.error),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            appt.motifRefus ?? appt.motifAnnulation!,
                            style: AppTextStyles.bodySm
                                .copyWith(color: AppColors.error),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                // Boutons d'action
                if (actions != null) ...[
                  const SizedBox(height: 14),
                  actions!,
                ],
              ],
            ),
          ),
        ],
      ),
    ),  // GestureDetector
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// SHEET : DÉTAIL RDV
// ══════════════════════════════════════════════════════════════════════════════

class _DetailSheet extends StatelessWidget {
  final AppointmentResponse appt;
  const _DetailSheet({required this.appt});

  @override
  Widget build(BuildContext context) {
    final debut = DateTime.parse(appt.dateHeureDebut);
    final fin   = DateTime.parse(appt.dateHeureFin);

    String fmtDateLong(DateTime d) {
      try { return DateFormat('EEEE d MMMM yyyy', 'fr_FR').format(d); }
      catch (_) { return DateFormat('dd/MM/yyyy').format(d); }
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize:     0.4,
      maxChildSize:     0.92,
      expand: false,
      builder: (_, ctrl) => Column(
        children: [
          // Poignée
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 36, height: 4,
            decoration: BoxDecoration(
              color: AppColors.textMuted.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: ListView(
              controller: ctrl,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
              children: [
                // Titre + badge
                Row(children: [
                  Expanded(
                    child: Text('Détail du rendez-vous',
                        style: AppTextStyles.headingMd),
                  ),
                  _StatusBadge(status: appt.status),
                ]),
                const SizedBox(height: 20),

                // Infos principales
                _DetailCard(children: [
                  _DetailRow(
                    icon: Icons.person_outline_rounded,
                    label: 'Client',
                    value: '${appt.client.firstName} ${appt.client.lastName}',
                  ),
                  if (appt.client.phone != null)
                    _DetailRow(
                      icon: Icons.phone_outlined,
                      label: 'Téléphone',
                      value: appt.client.phone!,
                    ),
                  _DetailRow(
                    icon: Icons.design_services_outlined,
                    label: 'Service',
                    value: appt.service.nom,
                  ),
                  _DetailRow(
                    icon: Icons.calendar_today_outlined,
                    label: 'Date',
                    value: fmtDateLong(debut),
                  ),
                  _DetailRow(
                    icon: Icons.access_time_rounded,
                    label: 'Horaire',
                    value: '${DateFormat('HH:mm').format(debut)} → ${DateFormat('HH:mm').format(fin)}',
                  ),
                  _DetailRow(
                    icon: Icons.schedule_outlined,
                    label: 'Durée',
                    value: '${appt.service.duree} min',
                  ),
                  _DetailRow(
                    icon: Icons.payments_outlined,
                    label: 'Prix',
                    value: '${NumberFormat('#,###', 'fr_FR').format(appt.service.prix)} F',
                    valueColor: AppColors.accent,
                  ),
                ]),

                // Note client
                if (appt.noteClient != null && appt.noteClient!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text('Note du client', style: AppTextStyles.headingSm),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.bgSurface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.format_quote_rounded,
                            size: 16, color: AppColors.textMuted),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(appt.noteClient!,
                              style: AppTextStyles.bodyMd
                                  .copyWith(color: AppColors.textSecondary, height: 1.5)),
                        ),
                      ],
                    ),
                  ),
                ],

                // Motif refus / annulation
                if ((appt.motifRefus != null && appt.motifRefus!.isNotEmpty) ||
                    (appt.motifAnnulation != null && appt.motifAnnulation!.isNotEmpty)) ...[
                  const SizedBox(height: 16),
                  Text(appt.motifRefus != null ? 'Motif du refus' : "Motif d'annulation",
                      style: AppTextStyles.headingSm),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.errorDim,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.error.withOpacity(0.2)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.info_outline_rounded,
                            size: 16, color: AppColors.error),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            appt.motifRefus ?? appt.motifAnnulation!,
                            style: AppTextStyles.bodyMd.copyWith(color: AppColors.error, height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  final List<Widget> children;
  const _DetailCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: children.asMap().entries.map((e) => Column(children: [
          e.value,
          if (e.key < children.length - 1)
            const Divider(height: 1, indent: 16, endIndent: 16),
        ])).toList(),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String   label;
  final String   value;
  final Color    valueColor;
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor = AppColors.textPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(children: [
        Icon(icon, size: 16, color: AppColors.textMuted),
        const SizedBox(width: 10),
        Text(label,
            style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary)),
        const Spacer(),
        Flexible(
          child: Text(value,
              style: AppTextStyles.labelLg.copyWith(color: valueColor),
              textAlign: TextAlign.right),
        ),
      ]),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// SHEET : REFUSER
// ══════════════════════════════════════════════════════════════════════════════

class _RefuseSheet extends ConsumerStatefulWidget {
  final int apptId;
  const _RefuseSheet({required this.apptId});

  @override
  ConsumerState<_RefuseSheet> createState() => _RefuseSheetState();
}

class _RefuseSheetState extends ConsumerState<_RefuseSheet> {
  final _motifCtrl = TextEditingController();

  @override
  void dispose() { _motifCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final state     = ref.watch(appointmentActionsProvider);
    final isLoading = state is AsyncLoading;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          20, 20, 20, 20 + MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Container(
            width: 36, height: 4,
            decoration: BoxDecoration(
              color: AppColors.textMuted.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          )),
          const SizedBox(height: 16),

          Text('Refuser ce rendez-vous', style: AppTextStyles.headingMd),
          const SizedBox(height: 6),
          Text('Indiquez un motif pour informer le client.',
              style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 16),

          TextField(
            controller: _motifCtrl,
            maxLines: 3,
            maxLength: 200,
            style: AppTextStyles.bodyMd,
            decoration: const InputDecoration(
              hintText: 'Ex: Créneau indisponible, déjà réservé…',
              counterStyle: TextStyle(fontFamily: 'DMSans', fontSize: 11, color: AppColors.textMuted),
            ),
          ),
          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: isLoading || _motifCtrl.text.trim().isEmpty
                ? null
                : () async {
                    final ok = await ref
                        .read(appointmentActionsProvider.notifier)
                        .refuse(widget.apptId, _motifCtrl.text.trim());
                    if (ok && context.mounted) {
                      Navigator.pop(context);
                      _snack(context, 'Rendez-vous refusé', AppColors.error);
                    }
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
            ),
            child: isLoading
                ? const SizedBox(width: 20, height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Text('Confirmer le refus'),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// SHEET : CLÔTURER
// ══════════════════════════════════════════════════════════════════════════════

class _ClotureSheet extends ConsumerStatefulWidget {
  final int apptId;
  const _ClotureSheet({required this.apptId});

  @override
  ConsumerState<_ClotureSheet> createState() => _ClotureSheetState();
}

class _ClotureSheetState extends ConsumerState<_ClotureSheet> {
  bool? _present; // null = pas encore choisi

  @override
  Widget build(BuildContext context) {
    final state     = ref.watch(appointmentActionsProvider);
    final isLoading = state is AsyncLoading;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          20, 20, 20, 20 + MediaQuery.of(context).padding.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Container(
            width: 36, height: 4,
            decoration: BoxDecoration(
              color: AppColors.textMuted.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          )),
          const SizedBox(height: 20),

          Text('Clôturer le rendez-vous', style: AppTextStyles.headingMd),
          const SizedBox(height: 6),
          Text('Le client s\'est-il présenté ?',
              style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 24),

          Row(children: [
            // Présent
            Expanded(child: GestureDetector(
              onTap: () => setState(() => _present = true),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: _present == true ? AppColors.greenDim : AppColors.bgSurface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: _present == true
                        ? AppColors.green.withOpacity(0.5)
                        : AppColors.border,
                    width: _present == true ? 1.5 : 1,
                  ),
                ),
                child: Column(children: [
                  Icon(Icons.check_circle_rounded,
                      size: 32,
                      color: _present == true ? AppColors.green : AppColors.textMuted),
                  const SizedBox(height: 8),
                  Text('Présent',
                      style: AppTextStyles.headingSm.copyWith(
                          color: _present == true ? AppColors.green : AppColors.textSecondary)),
                ]),
              ),
            )),
            const SizedBox(width: 12),
            // Absent
            Expanded(child: GestureDetector(
              onTap: () => setState(() => _present = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: _present == false ? AppColors.errorDim : AppColors.bgSurface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: _present == false
                        ? AppColors.error.withOpacity(0.5)
                        : AppColors.border,
                    width: _present == false ? 1.5 : 1,
                  ),
                ),
                child: Column(children: [
                  Icon(Icons.cancel_rounded,
                      size: 32,
                      color: _present == false ? AppColors.error : AppColors.textMuted),
                  const SizedBox(height: 8),
                  Text('Absent',
                      style: AppTextStyles.headingSm.copyWith(
                          color: _present == false ? AppColors.error : AppColors.textSecondary)),
                ]),
              ),
            )),
          ]),

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: (_present == null || isLoading)
                ? null
                : () async {
                    final ok = await ref
                        .read(appointmentActionsProvider.notifier)
                        .cloture(widget.apptId, present: _present!);
                    if (ok && context.mounted) {
                      Navigator.pop(context);
                      _snack(
                        context,
                        _present! ? 'RDV clôturé — Honoré ✓' : 'RDV clôturé — Absent',
                        _present! ? AppColors.green : AppColors.textMuted,
                      );
                    }
                  },
            style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 48)),
            child: isLoading
                ? const SizedBox(width: 20, height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.bgDeep))
                : const Text('Valider'),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// WIDGETS COMMUNS
// ══════════════════════════════════════════════════════════════════════════════

class _StatusBadge extends StatelessWidget {
  final AppointmentStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final (label, color, bg) = switch (status) {
      AppointmentStatus.EN_ATTENTE         => ('En attente', AppColors.warning,   AppColors.warningDim),
      AppointmentStatus.CONFIRME           => ('Confirmé',   AppColors.green,     AppColors.greenDim),
      AppointmentStatus.HONORE             => ('Honoré',     AppColors.blue,      AppColors.blueDim),
      AppointmentStatus.ANNULE_CLIENT      => ('Annulé',     AppColors.error,     AppColors.errorDim),
      AppointmentStatus.ANNULE_PRESTATAIRE => ('Refusé',     AppColors.error,     AppColors.errorDim),
      AppointmentStatus.ABSENT             => ('Absent',     AppColors.textMuted, AppColors.bgSurface),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(label,
          style: AppTextStyles.labelSm.copyWith(
              color: color, fontWeight: FontWeight.w600, letterSpacing: 0)),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String   text;
  final Color    color;
  const _EmptyState({required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 52, color: color),
        const SizedBox(height: 14),
        Text(text,
            style: AppTextStyles.headingSm.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center),
      ]),
    ),
  );
}

class _ErrorState extends StatelessWidget {
  const _ErrorState();

  @override
  Widget build(BuildContext context) => Center(
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      const Icon(Icons.wifi_off_rounded, size: 48, color: AppColors.textMuted),
      const SizedBox(height: 12),
      Text('Erreur de chargement',
          style: AppTextStyles.headingSm.copyWith(color: AppColors.textSecondary)),
    ]),
  );
}

class _CardSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 12),
    height: 130,
    decoration: BoxDecoration(
      color: AppColors.bgPanel,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppColors.border),
    ),
  );
}

// Snackbar helper
void _snack(BuildContext context, String msg, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg, style: const TextStyle(fontFamily: 'DMSans')),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ));
}
