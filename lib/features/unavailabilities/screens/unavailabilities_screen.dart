import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/models/models.dart';
import '../../../../core/providers/unavailability_provider.dart';
import '../../../../core/utils/theme.dart';

// Labels et icônes pour chaque type
const _motifLabels = {
  'CONGE':     'Congé',
  'PAUSE':     'Pause',
  'FORMATION': 'Formation',
  'AUTRE':     'Autre',
};

const _motifIcons = {
  'CONGE':     Icons.beach_access_outlined,
  'PAUSE':     Icons.coffee_outlined,
  'FORMATION': Icons.school_outlined,
  'AUTRE':     Icons.event_busy_outlined,
};

const _motifColors = {
  'CONGE':     AppColors.blue,
  'PAUSE':     AppColors.green,
  'FORMATION': AppColors.accent,
  'AUTRE':     AppColors.textSecondary,
};

class UnavailabilitiesScreen extends ConsumerWidget {
  const UnavailabilitiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unavailAsync = ref.watch(myUnavailabilitiesProvider);

    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      appBar: AppBar(
        title: const Text('Indisponibilités'),
        leading: const BackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton.icon(
              onPressed: () => _showAddSheet(context, ref),
              icon: const Icon(Icons.add_rounded, size: 18),
              label: const Text('Ajouter'),
              style: TextButton.styleFrom(foregroundColor: AppColors.accent),
            ),
          ),
        ],
      ),
      body: unavailAsync.when(
        loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.accent)),
        error: (_, __) => Center(
          child: Text('Impossible de charger les indisponibilités',
              style: AppTextStyles.bodyMd
                  .copyWith(color: AppColors.textSecondary)),
        ),
        data: (list) {
          // Trier par date de début croissante
          final sorted = [...list]
            ..sort((a, b) => a.dateDebut.compareTo(b.dateDebut));

          if (sorted.isEmpty) return const _EmptyState();

          return RefreshIndicator(
            color: AppColors.accent,
            backgroundColor: AppColors.bgPanel,
            onRefresh: () async =>
                ref.invalidate(myUnavailabilitiesProvider),
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              itemCount: sorted.length,
              itemBuilder: (_, i) => _UnavailCard(
                item: sorted[i],
                onDelete: () => _confirmDelete(context, ref, sorted[i]),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAddSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bgPanel,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const _AddUnavailSheet(),
    );
  }

  void _confirmDelete(
      BuildContext context, WidgetRef ref, UnavailabilityResponse item) {
    final label = _motifLabels[item.motif] ?? item.motif;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.bgPanel,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Supprimer cette indisponibilité',
            style: AppTextStyles.headingMd),
        content: Text(
          'Supprimer "$label" ? Les créneaux redeviendront disponibles.',
          style: AppTextStyles.bodyMd
              .copyWith(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final ok = await ref
                  .read(deleteUnavailabilityProvider.notifier)
                  .delete(item.id);
              if (ok && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Indisponibilité supprimée',
                      style: TextStyle(fontFamily: 'DMSans')),
                  backgroundColor: AppColors.bgSurface,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ));
              }
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// CARTE INDISPONIBILITÉ
// ══════════════════════════════════════════════════════════════════════════════

class _UnavailCard extends StatelessWidget {
  final UnavailabilityResponse item;
  final VoidCallback            onDelete;

  const _UnavailCard({required this.item, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final debut = DateTime.tryParse(item.dateDebut);
    final fin   = DateTime.tryParse(item.dateFin);
    final color = _motifColors[item.motif] ?? AppColors.textSecondary;
    final icon  = _motifIcons[item.motif]  ?? Icons.event_busy_outlined;
    final label = _motifLabels[item.motif] ?? item.motif;

    String fmtDt(DateTime? d) {
      if (d == null) return '—';
      try { return DateFormat('EEE d MMM yyyy  HH:mm', 'fr_FR').format(d); }
      catch (_) { return DateFormat('dd/MM/yyyy HH:mm').format(d); }
    }

    // Indique si c'est en cours / à venir / passé
    final now = DateTime.now();
    final isPast    = fin != null && fin.isBefore(now);
    final isCurrent = debut != null && fin != null &&
        debut.isBefore(now) && fin.isAfter(now);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.bgPanel,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isPast
              ? AppColors.border.withOpacity(0.4)
              : color.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          // ── En-tête ───────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icône motif
                Container(
                  width: 44, height: 44,
                  decoration: BoxDecoration(
                    color: isPast
                        ? AppColors.bgSurface
                        : color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon,
                      color: isPast ? AppColors.textMuted : color, size: 22),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(label,
                            style: AppTextStyles.headingSm.copyWith(
                              color: isPast
                                  ? AppColors.textMuted
                                  : AppColors.textPrimary,
                            )),
                        const Spacer(),
                        // Badge état
                        if (isCurrent)
                          _Chip('En cours', AppColors.warning,
                              AppColors.warningDim)
                        else if (isPast)
                          _Chip('Terminé', AppColors.textMuted,
                              AppColors.bgSurface)
                        else
                          _Chip('À venir', color, color.withOpacity(0.12)),
                      ]),
                      const SizedBox(height: 8),

                      // Dates
                      Row(children: [
                        const Icon(Icons.calendar_today_outlined,
                            size: 13, color: AppColors.textMuted),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            fmtDt(debut),
                            style: AppTextStyles.bodyMd
                                .copyWith(color: AppColors.textSecondary),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 4),
                      Row(children: [
                        const Icon(Icons.arrow_forward_rounded,
                            size: 13, color: AppColors.textMuted),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            fmtDt(fin),
                            style: AppTextStyles.bodyMd
                                .copyWith(color: AppColors.textSecondary),
                          ),
                        ),
                      ]),

                      // Description
                      if (item.description != null &&
                          item.description!.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.bgSurface,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item.description!,
                            style: AppTextStyles.bodySm.copyWith(
                                color: AppColors.textSecondary),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Bouton supprimer ──────────────────────────────────────
          const SizedBox(height: 10),
          Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: TextButton.icon(
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline_rounded, size: 16),
              label: const Text('Supprimer'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.error,
                minimumSize: const Size(double.infinity, 44),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final Color  color;
  final Color  bg;
  const _Chip(this.label, this.color, this.bg);

  @override
  Widget build(BuildContext context) => Container(
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

// ══════════════════════════════════════════════════════════════════════════════
// SHEET : AJOUTER UNE INDISPONIBILITÉ
// ══════════════════════════════════════════════════════════════════════════════

class _AddUnavailSheet extends ConsumerStatefulWidget {
  const _AddUnavailSheet();

  @override
  ConsumerState<_AddUnavailSheet> createState() => _AddUnavailSheetState();
}

class _AddUnavailSheetState extends ConsumerState<_AddUnavailSheet> {
  UnavailabilityType _motif    = UnavailabilityType.CONGE;
  DateTime?          _debut;
  DateTime?          _fin;
  final _descCtrl              = TextEditingController();

  @override
  void dispose() { _descCtrl.dispose(); super.dispose(); }

  String _fmtDt(DateTime? d) {
    if (d == null) return 'Choisir…';
    try { return DateFormat('EEE d MMM yyyy  HH:mm', 'fr_FR').format(d); }
    catch (_) { return DateFormat('dd/MM/yyyy HH:mm').format(d); }
  }

  Future<void> _pickDateTime(bool isDebut) async {
    final now = DateTime.now();
    final initial = isDebut
        ? (_debut ?? now)
        : (_fin   ?? (_debut ?? now).add(const Duration(hours: 1)));

    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.dark(
            primary:   AppColors.accent,
            surface:   AppColors.bgPanel,
            onSurface: AppColors.textPrimary,
          ),
        ),
        child: child!,
      ),
    );
    if (date == null || !mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.dark(
            primary:   AppColors.accent,
            surface:   AppColors.bgPanel,
            onSurface: AppColors.textPrimary,
          ),
        ),
        child: child!,
      ),
    );
    if (time == null || !mounted) return;

    final combined = DateTime(
        date.year, date.month, date.day, time.hour, time.minute);

    setState(() {
      if (isDebut) _debut = combined;
      else         _fin   = combined;
    });
  }

  bool get _canSubmit =>
      _debut != null &&
      _fin   != null &&
      _fin!.isAfter(_debut!);

  @override
  Widget build(BuildContext context) {
    final state     = ref.watch(createUnavailabilityProvider);
    final isLoading = state is AsyncLoading;
    final error     = state is AsyncError
        ? 'Une erreur est survenue. Réessayez.'
        : null;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        20, 20, 20,
        20 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poignée
          Center(child: Container(
            width: 36, height: 4,
            decoration: BoxDecoration(
              color: AppColors.textMuted.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          )),
          const SizedBox(height: 16),

          Text('Ajouter une indisponibilité',
              style: AppTextStyles.headingMd),
          const SizedBox(height: 20),

          if (error != null) ...[
            _ErrorBanner(message: error),
            const SizedBox(height: 14),
          ],

          // Motif
          Text('Motif', style: AppTextStyles.eyebrow),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: UnavailabilityType.values.map((type) {
              final selected = _motif == type;
              final label    = _motifLabels[type.name] ?? type.name;
              final icon     = _motifIcons[type.name]  ?? Icons.event_busy_outlined;
              final color    = _motifColors[type.name] ?? AppColors.textSecondary;
              return GestureDetector(
                onTap: () => setState(() => _motif = type),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 160),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: selected
                        ? color.withOpacity(0.15)
                        : AppColors.bgSurface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: selected
                          ? color.withOpacity(0.5)
                          : AppColors.border,
                      width: selected ? 1.5 : 1,
                    ),
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(icon,
                        size: 15,
                        color: selected ? color : AppColors.textMuted),
                    const SizedBox(width: 6),
                    Text(label,
                        style: AppTextStyles.labelMd.copyWith(
                          color: selected ? color : AppColors.textSecondary,
                          fontWeight: selected
                              ? FontWeight.w600
                              : FontWeight.w400,
                        )),
                  ]),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          // Date début
          Text('Date de début', style: AppTextStyles.eyebrow),
          const SizedBox(height: 8),
          _DateTimePicker(
            value:  _fmtDt(_debut),
            filled: _debut != null,
            onTap:  () => _pickDateTime(true),
          ),
          const SizedBox(height: 14),

          // Date fin
          Text('Date de fin', style: AppTextStyles.eyebrow),
          const SizedBox(height: 8),
          _DateTimePicker(
            value:  _fmtDt(_fin),
            filled: _fin != null,
            onTap:  () => _pickDateTime(false),
          ),

          // Validation dates
          if (_debut != null && _fin != null && !_fin!.isAfter(_debut!)) ...[
            const SizedBox(height: 6),
            Text('La date de fin doit être après la date de début.',
                style: AppTextStyles.bodySm
                    .copyWith(color: AppColors.error)),
          ],

          const SizedBox(height: 14),

          // Description
          TextField(
            controller: _descCtrl,
            style: AppTextStyles.bodyMd,
            maxLines: 2,
            maxLength: 200,
            decoration: const InputDecoration(
              labelText: 'Description (optionnel)',
              counterStyle: TextStyle(
                  fontFamily: 'DMSans', fontSize: 11,
                  color: AppColors.textMuted),
            ),
          ),
          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: (_canSubmit && !isLoading) ? _submit : null,
            child: isLoading
                ? const SizedBox(
                    width: 20, height: 20,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: AppColors.bgDeep))
                : const Text('Ajouter'),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final request = UnavailabilityRequest(
      dateDebut:   _debut!.toIso8601String(),
      dateFin:     _fin!.toIso8601String(),
      motif:       _motif,
      description: _descCtrl.text.trim().isEmpty
          ? null
          : _descCtrl.text.trim(),
    );

    final ok = await ref
        .read(createUnavailabilityProvider.notifier)
        .create(request);

    if (ok && mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Indisponibilité ajoutée',
            style: TextStyle(fontFamily: 'DMSans')),
        backgroundColor: AppColors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ));
    }
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// WIDGETS COMMUNS
// ══════════════════════════════════════════════════════════════════════════════

class _DateTimePicker extends StatelessWidget {
  final String       value;
  final bool         filled;
  final VoidCallback onTap;

  const _DateTimePicker({
    required this.value,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: filled
              ? AppColors.accent.withOpacity(0.4)
              : AppColors.border,
        ),
      ),
      child: Row(children: [
        Icon(Icons.calendar_today_outlined,
            size: 16,
            color: filled ? AppColors.accent : AppColors.textMuted),
        const SizedBox(width: 10),
        Text(value,
            style: AppTextStyles.bodyMd.copyWith(
              color: filled
                  ? AppColors.textPrimary
                  : AppColors.textMuted,
            )),
      ]),
    ),
  );
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.event_available_rounded,
            size: 56, color: AppColors.textMuted),
        const SizedBox(height: 16),
        Text('Aucune indisponibilité',
            style: AppTextStyles.headingSm
                .copyWith(color: AppColors.textSecondary)),
        const SizedBox(height: 8),
        Text(
          'Ajoutez vos congés, pauses ou formations\npour bloquer automatiquement vos créneaux.',
          style: AppTextStyles.bodyMd.copyWith(color: AppColors.textMuted),
          textAlign: TextAlign.center,
        ),
      ]),
    ),
  );
}

class _ErrorBanner extends StatelessWidget {
  final String message;
  const _ErrorBanner({required this.message});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.errorDim,
      border: Border.all(color: AppColors.error.withOpacity(0.3)),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(children: [
      const Icon(Icons.error_outline, color: AppColors.error, size: 16),
      const SizedBox(width: 8),
      Expanded(child: Text(message,
          style: AppTextStyles.bodySm.copyWith(color: AppColors.error))),
    ]),
  );
}
