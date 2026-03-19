import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/models/models.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/providers/dashboard_provider.dart';
import '../../../core/utils/router.dart';
import '../../../core/utils/theme.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user        = ref.watch(currentUserProvider);
    final statsAsync  = ref.watch(dashboardStatsProvider);
    final todayAsync  = ref.watch(todayAppointmentsProvider);
    final pendingAsync = ref.watch(pendingAppointmentsProvider);

    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.accent,
          backgroundColor: AppColors.bgPanel,
          onRefresh: () async {
            ref.invalidate(dashboardStatsProvider);
            ref.invalidate(myAppointmentsProvider);
          },
          child: CustomScrollView(
            slivers: [

              // ── En-tête ───────────────────────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_greeting(),
                                style: AppTextStyles.labelMd
                                    .copyWith(color: AppColors.textMuted)),
                            const SizedBox(height: 2),
                            Text(
                              user != null
                                  ? user.firstName
                                  : 'Prestataire',
                              style: AppTextStyles.displaySm,
                            ),
                          ],
                        ),
                      ),
                      // Avatar initiales
                      GestureDetector(
                        onTap: () => context.go(AppRoutes.profile),
                        child: Container(
                          width: 44, height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.accentDim,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.accent.withOpacity(0.4)),
                          ),
                          child: Center(
                            child: Text(
                              user != null
                                  ? '${user.firstName[0]}${user.lastName[0]}'
                                      .toUpperCase()
                                  : '?',
                              style: AppTextStyles.labelLg
                                  .copyWith(color: AppColors.accent),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Cartes stats ──────────────────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                  child: statsAsync.when(
                    loading: () => _StatsGridSkeleton(),
                    error: (_, __) => const _ErrorChip(
                        'Impossible de charger les statistiques'),
                    data: (stats) => _StatsGrid(stats: stats),
                  ),
                ),
              ),

              // ── RDV du jour ───────────────────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
                  child: Row(
                    children: [
                      const Icon(Icons.today_rounded,
                          size: 16, color: AppColors.accent),
                      const SizedBox(width: 6),
                      Text("Aujourd'hui", style: AppTextStyles.headingSm),
                    ],
                  ),
                ),
              ),

              todayAsync.when(
                loading: () => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, __) => const _ApptSkeleton(),
                    childCount: 2,
                  ),
                ),
                error: (_, __) => SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const _ErrorChip('Erreur chargement RDV'),
                  ),
                ),
                data: (rdvs) {
                  if (rdvs.isEmpty) {
                    return SliverToBoxAdapter(
                      child: _EmptyCard(
                        icon: Icons.event_available_rounded,
                        text: "Aucun rendez-vous aujourd'hui",
                      ),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, i) => _ApptCard(appt: rdvs[i]),
                      childCount: rdvs.length,
                    ),
                  );
                },
              ),

              // ── En attente ────────────────────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                  child: Row(
                    children: [
                      const Icon(Icons.pending_actions_rounded,
                          size: 16, color: AppColors.warning),
                      const SizedBox(width: 6),
                      Text('En attente', style: AppTextStyles.headingSm),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => context.go(AppRoutes.agenda),
                        child: Text('Voir tout',
                            style: AppTextStyles.labelMd
                                .copyWith(color: AppColors.accent)),
                      ),
                    ],
                  ),
                ),
              ),

              pendingAsync.when(
                loading: () => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, __) => const _ApptSkeleton(),
                    childCount: 2,
                  ),
                ),
                error: (_, __) => const SliverToBoxAdapter(
                    child: SizedBox.shrink()),
                data: (pending) {
                  if (pending.isEmpty) {
                    return SliverToBoxAdapter(
                      child: _EmptyCard(
                        icon: Icons.check_circle_outline_rounded,
                        text: 'Aucune demande en attente',
                        color: AppColors.green,
                      ),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, i) => _ApptCard(
                        appt: pending[i],
                        highlight: true,
                      ),
                      childCount: pending.length > 3 ? 3 : pending.length,
                    ),
                  );
                },
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),
            ],
          ),
        ),
      ),
    );
  }

  String _greeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'Bonjour 👋';
    if (h < 18) return 'Bon après-midi 👋';
    return 'Bonsoir 👋';
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// GRILLE STATS
// ══════════════════════════════════════════════════════════════════════════════

class _StatsGrid extends StatelessWidget {
  final PrestataireDashboardStats stats;
  const _StatsGrid({required this.stats});

  @override
  Widget build(BuildContext context) {
    final fmtMoney = NumberFormat('#,###', 'fr_FR');

    return Column(
      children: [
        Row(children: [
          Expanded(child: _StatCard(
            label: 'Total RDV',
            value: '${stats.totalAppointments}',
            icon: Icons.calendar_month_rounded,
            color: AppColors.blue,
            bg: AppColors.blueDim,
          )),
          const SizedBox(width: 12),
          Expanded(child: _StatCard(
            label: 'En attente',
            value: '${stats.pendingAppointments}',
            icon: Icons.pending_actions_rounded,
            color: AppColors.warning,
            bg: AppColors.warningDim,
          )),
        ]),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(child: _StatCard(
            label: 'Terminés',
            value: '${stats.completedAppointments}',
            icon: Icons.check_circle_outline_rounded,
            color: AppColors.green,
            bg: AppColors.greenDim,
          )),
          const SizedBox(width: 12),
          Expanded(child: _StatCard(
            label: 'Chiffre d\'affaires',
            value: '${fmtMoney.format(stats.totalRevenue)} F',
            icon: Icons.payments_outlined,
            color: AppColors.accent,
            bg: AppColors.accentDim,
          )),
        ]),
        if (stats.currentRating != null) ...[
          const SizedBox(height: 12),
          _RatingCard(rating: stats.currentRating!),
        ],
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String  label;
  final String  value;
  final IconData icon;
  final Color   color;
  final Color   bg;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgPanel,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(height: 12),
          Text(value,
              style: AppTextStyles.headingLg.copyWith(color: AppColors.textPrimary)),
          const SizedBox(height: 2),
          Text(label,
              style: AppTextStyles.bodySm.copyWith(color: AppColors.textMuted)),
        ],
      ),
    );
  }
}

class _RatingCard extends StatelessWidget {
  final double rating;
  const _RatingCard({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.bgPanel,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(Icons.star_rounded, color: AppColors.warning, size: 22),
          const SizedBox(width: 10),
          Text('Note moyenne',
              style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary)),
          const Spacer(),
          Text(
            rating.toStringAsFixed(1),
            style: AppTextStyles.headingMd.copyWith(color: AppColors.warning),
          ),
          const SizedBox(width: 4),
          Text('/5',
              style: AppTextStyles.bodyMd.copyWith(color: AppColors.textMuted)),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// CARTE RDV
// ══════════════════════════════════════════════════════════════════════════════

class _ApptCard extends StatelessWidget {
  final AppointmentResponse appt;
  final bool highlight;
  const _ApptCard({required this.appt, this.highlight = false});

  @override
  Widget build(BuildContext context) {
    final debut = DateTime.parse(appt.dateHeureDebut);
    final fin   = DateTime.parse(appt.dateHeureFin);
    String formatDate(DateTime d) {
      try { return DateFormat('EEE d MMM', 'fr_FR').format(d); }
      catch (_) { return DateFormat('dd/MM').format(d); }
    }

    return GestureDetector(
      onTap: () => context.go(AppRoutes.agenda),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.bgPanel,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: highlight
                ? AppColors.warning.withOpacity(0.3)
                : AppColors.border,
          ),
        ),
        child: Row(
          children: [
            // Bloc heure
            Container(
              width: 56, height: 56,
              decoration: BoxDecoration(
                color: highlight ? AppColors.warningDim : AppColors.bgSurface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('HH:mm').format(debut),
                    style: AppTextStyles.labelLg.copyWith(
                        color: highlight ? AppColors.warning : AppColors.textPrimary),
                  ),
                  Text(
                    DateFormat('HH:mm').format(fin),
                    style: AppTextStyles.bodySm.copyWith(color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Infos client + service
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
                  const SizedBox(height: 3),
                  Text(
                    appt.service.nom,
                    style: AppTextStyles.bodyMd
                        .copyWith(color: AppColors.textSecondary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Row(children: [
                    const Icon(Icons.calendar_today_outlined,
                        size: 11, color: AppColors.textMuted),
                    const SizedBox(width: 3),
                    Text(formatDate(debut),
                        style: AppTextStyles.bodySm
                            .copyWith(color: AppColors.textMuted)),
                  ]),
                ],
              ),
            ),

            // Badge statut + prix
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _StatusBadge(status: appt.status),
                const SizedBox(height: 6),
                Text(
                  '${NumberFormat('#,###', 'fr_FR').format(appt.service.prix)} F',
                  style: AppTextStyles.labelMd
                      .copyWith(color: AppColors.accent),
                ),
              ],
            ),
          ],
        ),
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
      AppointmentStatus.EN_ATTENTE         => ('En attente', AppColors.warning, AppColors.warningDim),
      AppointmentStatus.CONFIRME           => ('Confirmé',   AppColors.green,   AppColors.greenDim),
      AppointmentStatus.HONORE             => ('Honoré',     AppColors.blue,    AppColors.blueDim),
      AppointmentStatus.ANNULE_CLIENT      => ('Annulé',     AppColors.error,   AppColors.errorDim),
      AppointmentStatus.ANNULE_PRESTATAIRE => ('Annulé',     AppColors.error,   AppColors.errorDim),
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

class _EmptyCard extends StatelessWidget {
  final IconData icon;
  final String   text;
  final Color    color;
  const _EmptyCard({
    required this.icon,
    required this.text,
    this.color = AppColors.textMuted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.bgPanel,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 12),
          Text(text,
              style: AppTextStyles.bodyMd
                  .copyWith(color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}

class _ErrorChip extends StatelessWidget {
  final String message;
  const _ErrorChip(this.message);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Icon(Icons.error_outline, color: AppColors.error, size: 15),
      const SizedBox(width: 6),
      Text(message,
          style: AppTextStyles.bodySm.copyWith(color: AppColors.error)),
    ]);
  }
}

// ── Skeletons ─────────────────────────────────────────────────────────────────

class _StatsGridSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Expanded(child: _Sk(h: 100)),
        const SizedBox(width: 12),
        Expanded(child: _Sk(h: 100)),
      ]),
      const SizedBox(height: 12),
      Row(children: [
        Expanded(child: _Sk(h: 100)),
        const SizedBox(width: 12),
        Expanded(child: _Sk(h: 100)),
      ]),
    ]);
  }
}

class _ApptSkeleton extends StatelessWidget {
  const _ApptSkeleton();

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
    height: 82,
    decoration: BoxDecoration(
      color: AppColors.bgPanel,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppColors.border),
    ),
  );
}

class _Sk extends StatelessWidget {
  final double h;
  const _Sk({required this.h});

  @override
  Widget build(BuildContext context) => Container(
    height: h,
    decoration: BoxDecoration(
      color: AppColors.bgPanel,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppColors.border),
    ),
  );
}
