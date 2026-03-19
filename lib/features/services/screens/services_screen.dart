import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/models/models.dart';
import '../../../core/providers/services_provider.dart';
import '../../../core/utils/theme.dart';

class ServicesScreen extends ConsumerWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesAsync = ref.watch(myServicesProvider);

    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      appBar: AppBar(
        title: const Text('Mes services'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton.icon(
              onPressed: () => _showServiceSheet(context, ref),
              icon: const Icon(Icons.add_rounded, size: 18),
              label: const Text('Ajouter'),
              style: TextButton.styleFrom(foregroundColor: AppColors.accent),
            ),
          ),
        ],
      ),
      body: servicesAsync.when(
        loading: () => _LoadingList(),
        error: (_, __) => _ErrorState(
          onRetry: () => ref.invalidate(myServicesProvider),
        ),
        data: (services) {
          if (services.isEmpty) return const _EmptyState();
          return RefreshIndicator(
            color: AppColors.accent,
            backgroundColor: AppColors.bgPanel,
            onRefresh: () async => ref.invalidate(myServicesProvider),
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              itemCount: services.length,
              itemBuilder: (_, i) => _ServiceCard(
                service: services[i],
                onEdit: () => _showServiceSheet(context, ref, service: services[i]),
                onDelete: () => _confirmDelete(context, ref, services[i]),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showServiceSheet(BuildContext context, WidgetRef ref,
      {ServiceResponse? service}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bgPanel,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _ServiceFormSheet(service: service),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, ServiceResponse service) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(   // ← nommer le context
        backgroundColor: AppColors.bgPanel,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Supprimer ce service', style: AppTextStyles.headingMd),
        content: Text(
          'Supprimer "${service.nom}" ? Cette action est irréversible.',
          style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),  // ← dialogContext
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);                 // ← dialogContext
              final ok = await ref
                  .read(serviceActionsProvider.notifier)
                  .delete(service.id);
              if (ok && context.mounted) {
                _snack(context, 'Service supprimé', AppColors.textSecondary);
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
// CARTE SERVICE
// ══════════════════════════════════════════════════════════════════════════════

class _ServiceCard extends StatelessWidget {
  final ServiceResponse service;
  final VoidCallback    onEdit;
  final VoidCallback    onDelete;

  const _ServiceCard({
    required this.service,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat('#,###', 'fr_FR');

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.bgPanel,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: service.actif ? AppColors.border : AppColors.border.withOpacity(0.4),
        ),
      ),
      child: Column(
        children: [
          // ── Corps ──────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icône
                Container(
                  width: 46, height: 46,
                  decoration: BoxDecoration(
                    color: service.actif
                        ? AppColors.accentDim
                        : AppColors.bgSurface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.design_services_outlined,
                    color: service.actif
                        ? AppColors.accent
                        : AppColors.textMuted,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),

                // Nom + description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                          child: Text(
                            service.nom,
                            style: AppTextStyles.headingSm.copyWith(
                              color: service.actif
                                  ? AppColors.textPrimary
                                  : AppColors.textMuted,
                            ),
                          ),
                        ),
                        // Badge actif/inactif
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: service.actif
                                ? AppColors.greenDim
                                : AppColors.bgSurface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: service.actif
                                  ? AppColors.green.withOpacity(0.3)
                                  : AppColors.border,
                            ),
                          ),
                          child: Text(
                            service.actif ? 'Actif' : 'Inactif',
                            style: AppTextStyles.labelSm.copyWith(
                              color: service.actif
                                  ? AppColors.green
                                  : AppColors.textMuted,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ]),

                      if (service.description != null &&
                          service.description!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          service.description!,
                          style: AppTextStyles.bodyMd
                              .copyWith(color: AppColors.textSecondary),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],

                      const SizedBox(height: 10),
                      Row(children: [
                        const Icon(Icons.schedule_outlined,
                            size: 13, color: AppColors.textMuted),
                        const SizedBox(width: 4),
                        Text('${service.duree} min',
                            style: AppTextStyles.bodyMd
                                .copyWith(color: AppColors.textMuted)),
                        const SizedBox(width: 16),
                        const Icon(Icons.payments_outlined,
                            size: 13, color: AppColors.accent),
                        const SizedBox(width: 4),
                        Text(
                          '${fmt.format(service.prix)} F',
                          style: AppTextStyles.labelLg
                              .copyWith(color: AppColors.accent),
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Actions ────────────────────────────────────────────────
          Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit_outlined, size: 16),
                    label: const Text('Modifier'),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.textSecondary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                Container(width: 1, height: 36, color: AppColors.border),
                Expanded(
                  child: TextButton.icon(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete_outline_rounded, size: 16),
                    label: const Text('Supprimer'),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.error,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// SHEET : FORMULAIRE SERVICE (Ajouter / Modifier)
// ══════════════════════════════════════════════════════════════════════════════

class _ServiceFormSheet extends ConsumerStatefulWidget {
  final ServiceResponse? service; // null = création

  const _ServiceFormSheet({this.service});

  @override
  ConsumerState<_ServiceFormSheet> createState() => _ServiceFormSheetState();
}

class _ServiceFormSheetState extends ConsumerState<_ServiceFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late final _nomCtrl         = TextEditingController(text: widget.service?.nom);
  late final _descCtrl        = TextEditingController(text: widget.service?.description);
  late final _dureeCtrl       = TextEditingController(
      text: widget.service?.duree.toString());
  late final _prixCtrl        = TextEditingController(
      text: widget.service?.prix.toStringAsFixed(0));
  late bool _actif            = widget.service?.actif ?? true;

  bool get _isEditing => widget.service != null;

  @override
  void dispose() {
    _nomCtrl.dispose(); _descCtrl.dispose();
    _dureeCtrl.dispose(); _prixCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state     = ref.watch(serviceActionsProvider);
    final isLoading = state is AsyncLoading;
    final error     = state is AsyncError ? 'Une erreur est survenue. Réessayez.' : null;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        20, 20, 20,
        20 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: _formKey,
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

            Text(
              _isEditing ? 'Modifier le service' : 'Ajouter un service',
              style: AppTextStyles.headingMd,
            ),
            const SizedBox(height: 20),

            if (error != null) ...[
              _ErrorBanner(message: error),
              const SizedBox(height: 14),
            ],

            // Nom
            TextFormField(
              controller: _nomCtrl,
              style: AppTextStyles.bodyMd,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Nom du service'),
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Requis' : null,
            ),
            const SizedBox(height: 14),

            // Description
            TextFormField(
              controller: _descCtrl,
              style: AppTextStyles.bodyMd,
              maxLines: 2,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  labelText: 'Description (optionnel)'),
            ),
            const SizedBox(height: 14),

            // Durée + Prix
            Row(children: [
              Expanded(
                child: TextFormField(
                  controller: _dureeCtrl,
                  style: AppTextStyles.bodyMd,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Durée (min)',
                    suffixText: 'min',
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Requis';
                    if (int.tryParse(v) == null || int.parse(v) <= 0)
                      return 'Invalide';
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _prixCtrl,
                  style: AppTextStyles.bodyMd,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'Prix (F)',
                    suffixText: 'F',
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Requis';
                    if (double.tryParse(v) == null || double.parse(v) < 0)
                      return 'Invalide';
                    return null;
                  },
                ),
              ),
            ]),
            const SizedBox(height: 16),

            // Toggle actif
            Row(children: [
              Expanded(
                child: Text('Service actif',
                    style: AppTextStyles.bodyMd),
              ),
              Switch(
                value: _actif,
                onChanged: (v) => setState(() => _actif = v),
                activeColor: AppColors.accent,
              ),
            ]),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: isLoading ? null : _submit,
              child: isLoading
                  ? const SizedBox(
                      width: 20, height: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: AppColors.bgDeep))
                  : Text(_isEditing ? 'Enregistrer' : 'Ajouter le service'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final request = ServiceRequest(
      nom:         _nomCtrl.text.trim(),
      description: _descCtrl.text.trim().isEmpty ? null : _descCtrl.text.trim(),
      duree:       int.parse(_dureeCtrl.text.trim()),
      prix:        double.parse(_prixCtrl.text.trim()),
      actif:       _actif,
    );

    final ok = _isEditing
        ? await ref
            .read(serviceActionsProvider.notifier)
            .update(widget.service!.id, request)
        : await ref
            .read(serviceActionsProvider.notifier)
            .create(request);

    if (ok && mounted) {
      Navigator.pop(context);
      _snack(
        context,
        _isEditing ? 'Service mis à jour' : 'Service ajouté',
        AppColors.green,
      );
    }
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// WIDGETS COMMUNS
// ══════════════════════════════════════════════════════════════════════════════

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.design_services_outlined,
            size: 56, color: AppColors.textMuted),
        const SizedBox(height: 16),
        Text('Aucun service',
            style: AppTextStyles.headingSm
                .copyWith(color: AppColors.textSecondary)),
        const SizedBox(height: 8),
        Text('Ajoutez votre premier service\npour commencer à recevoir des réservations.',
            style: AppTextStyles.bodyMd.copyWith(color: AppColors.textMuted),
            textAlign: TextAlign.center),
      ]),
    ),
  );
}

class _ErrorState extends StatelessWidget {
  final VoidCallback onRetry;
  const _ErrorState({required this.onRetry});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      const Icon(Icons.wifi_off_rounded,
          size: 48, color: AppColors.textMuted),
      const SizedBox(height: 14),
      Text('Impossible de charger vos services',
          style: AppTextStyles.headingSm
              .copyWith(color: AppColors.textSecondary),
          textAlign: TextAlign.center),
      const SizedBox(height: 20),
      SizedBox(
        width: 160,
        child: ElevatedButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh_rounded, size: 16),
          label: const Text('Réessayer'),
          style: ElevatedButton.styleFrom(minimumSize: const Size(0, 44)),
        ),
      ),
    ]),
  );
}

class _LoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: 3,
    itemBuilder: (_, __) => Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 130,
      decoration: BoxDecoration(
        color: AppColors.bgPanel,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
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

void _snack(BuildContext context, String msg, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg, style: const TextStyle(fontFamily: 'DMSans')),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ));
}
