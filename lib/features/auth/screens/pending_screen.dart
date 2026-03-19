import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/utils/theme.dart';

class PendingScreen extends ConsumerWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 96, height: 96,
                decoration: BoxDecoration(
                  color: AppColors.warningDim,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.warning.withOpacity(0.4), width: 2),
                ),
                child: const Icon(Icons.hourglass_top_rounded,
                    color: AppColors.warning, size: 44),
              ),
              const SizedBox(height: 28),
              Text('Compte en attente', style: AppTextStyles.displaySm,
                  textAlign: TextAlign.center),
              const SizedBox(height: 12),
              if (user != null)
                Text(
                  'Bonjour ${user.firstName},',
                  style: AppTextStyles.headingSm.copyWith(color: AppColors.accent),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 12),
              Text(
                'Votre compte prestataire est en cours de validation par notre équipe. '
                'Vous recevrez une notification dès que votre compte sera activé.',
                style: AppTextStyles.bodyMd.copyWith(
                    color: AppColors.textSecondary, height: 1.6),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Info uploads
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.bgPanel,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    _InfoRow(
                      icon: Icons.check_circle_outline_rounded,
                      color: AppColors.green,
                      text: 'Compte créé avec succès',
                    ),
                    const SizedBox(height: 10),
                    _InfoRow(
                      icon: Icons.pending_outlined,
                      color: AppColors.warning,
                      text: 'Vérification des informations en cours',
                    ),
                    const SizedBox(height: 10),
                    _InfoRow(
                      icon: Icons.notifications_outlined,
                      color: AppColors.textMuted,
                      text: 'Activation sous 24 à 48h ouvrées',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Bouton vérifier statut
              OutlinedButton.icon(
                onPressed: () => ref.read(authProvider.notifier).refresh(),
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: const Text('Vérifier le statut'),
                style: OutlinedButton.styleFrom(minimumSize: const Size(double.infinity, 48)),
              ),
              const SizedBox(height: 12),

              TextButton(
                onPressed: () => ref.read(authProvider.notifier).logout(),
                child: Text(
                  'Se déconnecter',
                  style: AppTextStyles.bodyMd.copyWith(color: AppColors.textMuted),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color    color;
  final String   text;
  const _InfoRow({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, size: 18, color: color),
      const SizedBox(width: 10),
      Expanded(
        child: Text(text,
            style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary)),
      ),
    ],
  );
}
