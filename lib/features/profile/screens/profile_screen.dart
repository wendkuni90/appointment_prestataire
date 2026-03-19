import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/router.dart';
import '../../../core/models/models.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/providers/profile_provider.dart';
import '../../../core/utils/theme.dart';
import '../../availabilities/screens/availabilities_screen.dart';
import '../../unavailabilities/screens/unavailabilities_screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user        = ref.watch(currentUserProvider);
    final profileAsync = ref.watch(myProfileProvider);

    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      appBar: AppBar(
        title: const Text('Mon profil'),
        automaticallyImplyLeading: false,
      ),
      body: profileAsync.when(
        loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.accent)),
        error: (_, __) => _ErrorState(
          onRetry: () => ref.invalidate(myProfileProvider),
        ),
        data: (profile) => RefreshIndicator(
          color: AppColors.accent,
          backgroundColor: AppColors.bgPanel,
          onRefresh: () async => ref.invalidate(myProfileProvider),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
            children: [

              // ── Photo + identité ────────────────────────────────
              Center(
                child: Column(
                  children: [
                    _PhotoAvatar(profile: profile),
                    const SizedBox(height: 14),
                    Text(
                      profile.businessName,
                      style: AppTextStyles.headingLg,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    if (user != null)
                      Text(
                        '${user.firstName} ${user.lastName}',
                        style: AppTextStyles.bodyMd
                            .copyWith(color: AppColors.textSecondary),
                      ),
                    const SizedBox(height: 6),
                    if (profile.category != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.accentDim,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: AppColors.accent.withOpacity(0.3)),
                        ),
                        child: Text(
                          profile.category!.nom,
                          style: AppTextStyles.labelMd
                              .copyWith(color: AppColors.accent),
                        ),
                      ),
                    const SizedBox(height: 6),
                    _StatusChip(status: profile.status),
                    if (profile.description != null &&
                        profile.description!.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Text(
                        profile.description!,
                        style: AppTextStyles.bodyMd.copyWith(
                            color: AppColors.textSecondary, height: 1.5),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ── Mon activité ────────────────────────────────────
              _SectionLabel('Mon activité'),
              const SizedBox(height: 10),
              _MenuCard(children: [
                _MenuItem(
                  icon: Icons.storefront_outlined,
                  label: 'Modifier mon profil professionnel',
                  onTap: () => _showBusinessSheet(context, ref, profile),
                ),
                _MenuItem(
                  icon: Icons.design_services_outlined,
                  label: 'Mes services',
                  onTap: () => context.go(AppRoutes.services),
                ),
                _MenuItem(
                  icon: Icons.calendar_month_outlined,
                  label: 'Mes disponibilités',
                  onTap: () => _openAvailabilities(context),
                ),
                _MenuItem(
                  icon: Icons.event_busy_outlined,
                  label: 'Mes indisponibilités',
                  onTap: () => _openUnavailabilities(context),
                ),
              ]),

              const SizedBox(height: 20),

              // ── Compte ──────────────────────────────────────────
              _SectionLabel('Compte'),
              const SizedBox(height: 10),
              _MenuCard(children: [
                _MenuItem(
                  icon: Icons.person_outline_rounded,
                  label: 'Modifier mes informations',
                  onTap: () => _showPersonalSheet(context, ref, user),
                ),
                _MenuItem(
                  icon: Icons.lock_outline_rounded,
                  label: 'Changer le mot de passe',
                  onTap: () => _showPasswordSheet(context, ref),
                ),
              ]),

              const SizedBox(height: 20),

              // ── Session ──────────────────────────────────────────
              _SectionLabel('Session'),
              const SizedBox(height: 10),
              _MenuCard(children: [
                _MenuItem(
                  icon: Icons.logout_rounded,
                  label: 'Se déconnecter',
                  onTap: () => _confirmLogout(context, ref),
                ),
              ]),

              const SizedBox(height: 20),

              // ── Danger ───────────────────────────────────────────
              _SectionLabel('Zone de danger'),
              const SizedBox(height: 10),
              _MenuCard(children: [
                _MenuItem(
                  icon: Icons.delete_outline_rounded,
                  label: 'Supprimer mon compte',
                  color: AppColors.error,
                  onTap: () => _confirmDeleteAccount(context, ref),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  // ── Navigation ─────────────────────────────────────────────────────────────

  void _openAvailabilities(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AvailabilitiesScreen(),
      ),
    );
  }

  void _openUnavailabilities(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const UnavailabilitiesScreen(),
      ),
    );
  }

  // ── Sheets ─────────────────────────────────────────────────────────────────

  void _showBusinessSheet(
      BuildContext context, WidgetRef ref, PrestataireResponse profile) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bgPanel,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _BusinessSheet(profile: profile),
    );
  }

  void _showPersonalSheet(
      BuildContext context, WidgetRef ref, User? user) {
    if (user == null) return;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bgPanel,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _PersonalInfoSheet(user: user),
    );
  }

  void _showPasswordSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bgPanel,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const _PasswordSheet(),
    );
  }

  void _confirmLogout(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(        // ← nommer
        backgroundColor: AppColors.bgPanel,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Déconnexion', style: AppTextStyles.headingMd),
        content: Text(
          'Êtes-vous sûr de vouloir vous déconnecter ?',
          style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext), // ← dialogContext
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);               // ← dialogContext
              await ref.read(authProvider.notifier).logout();
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Se déconnecter'),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteAccount(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(        // ← nommer
        backgroundColor: AppColors.bgPanel,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Supprimer mon compte', style: AppTextStyles.headingMd),
        content: Text(
          'Action irréversible. Tous vos services, disponibilités et rendez-vous seront supprimés.',
          style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext), // ← dialogContext
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);               // ← dialogContext
              await ref.read(deleteAccountProvider.notifier).delete();
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Supprimer définitivement'),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// PHOTO AVATAR avec upload
// ══════════════════════════════════════════════════════════════════════════════

class _PhotoAvatar extends ConsumerWidget {
  final PrestataireResponse profile;
  const _PhotoAvatar({required this.profile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadState = ref.watch(uploadPhotoProvider);
    final isUploading = uploadState is AsyncLoading;

    final initials = '${profile.firstName[0]}${profile.lastName[0]}'
        .toUpperCase();

    return GestureDetector(
      onTap: isUploading ? null : () => _pick(context, ref),
      child: Stack(
        children: [
          Container(
            width: 88, height: 88,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: AppColors.accent.withOpacity(0.4), width: 2),
            ),
            child: isUploading
                ? const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.accent, strokeWidth: 2))
                : ClipOval(
                    child: profile.photoUrl != null
                        ? Image.network(
                            profile.photoUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                _InitialsCircle(initials: initials),
                          )
                        : _InitialsCircle(initials: initials),
                  ),
          ),
          // Bouton modifier photo
          Positioned(
            bottom: 0, right: 0,
            child: Container(
              width: 26, height: 26,
              decoration: const BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.edit_rounded,
                  size: 14, color: AppColors.bgDeep),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pick(BuildContext context, WidgetRef ref) async {
    final file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024, maxHeight: 1024, imageQuality: 85,
    );
    if (file == null) return;
    await ref.read(uploadPhotoProvider.notifier).upload(File(file.path));
  }
}

class _InitialsCircle extends StatelessWidget {
  final String initials;
  const _InitialsCircle({required this.initials});

  @override
  Widget build(BuildContext context) => Container(
    color: AppColors.accentDim,
    child: Center(
      child: Text(initials,
          style: AppTextStyles.displaySm.copyWith(color: AppColors.accent)),
    ),
  );
}

// ══════════════════════════════════════════════════════════════════════════════
// SHEET : PROFIL PROFESSIONNEL
// ══════════════════════════════════════════════════════════════════════════════

class _BusinessSheet extends ConsumerStatefulWidget {
  final PrestataireResponse profile;
  const _BusinessSheet({required this.profile});

  @override
  ConsumerState<_BusinessSheet> createState() => _BusinessSheetState();
}

class _BusinessSheetState extends ConsumerState<_BusinessSheet> {
  final _formKey   = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _descCtrl;
  int? _categoryId;

  @override
  void initState() {
    super.initState();
    _nameCtrl    = TextEditingController(text: widget.profile.businessName);
    _descCtrl    = TextEditingController(text: widget.profile.description);
    _categoryId  = widget.profile.category?.id;
  }

  @override
  void dispose() { _nameCtrl.dispose(); _descCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final state     = ref.watch(updatePrestataireProfileProvider);
    final isLoading = state is AsyncLoading;
    final error     = state is AsyncError ? 'Erreur lors de la mise à jour' : null;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          20, 20, 20, 20 + MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Handle(),
            const SizedBox(height: 16),
            Text('Profil professionnel', style: AppTextStyles.headingMd),
            const SizedBox(height: 20),

            if (error != null) ...[
              _ErrorBanner(message: error),
              const SizedBox(height: 14),
            ],

            TextFormField(
              controller: _nameCtrl,
              style: AppTextStyles.bodyMd,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Nom du business',
                prefixIcon: Icon(Icons.storefront_outlined,
                    size: 20, color: AppColors.textMuted),
              ),
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Requis' : null,
            ),
            const SizedBox(height: 14),

            TextFormField(
              controller: _descCtrl,
              style: AppTextStyles.bodyMd,
              maxLines: 3,
              maxLength: 300,
              decoration: const InputDecoration(
                labelText: 'Description (optionnel)',
                alignLabelWithHint: true,
                counterStyle: TextStyle(fontFamily: 'DMSans', fontSize: 11,
                    color: AppColors.textMuted),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: isLoading ? null : _submit,
              child: isLoading
                  ? const SizedBox(width: 20, height: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: AppColors.bgDeep))
                  : const Text('Enregistrer'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final ok = await ref
        .read(updatePrestataireProfileProvider.notifier)
        .update(PrestataireProfileRequest(
          businessName: _nameCtrl.text.trim(),
          description:  _descCtrl.text.trim().isEmpty
              ? null
              : _descCtrl.text.trim(),
          categoryId: _categoryId,
        ));
    if (ok && mounted) {
      Navigator.pop(context);
      _snack(context, 'Profil mis à jour', AppColors.green);
    }
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// SHEET : INFORMATIONS PERSONNELLES
// ══════════════════════════════════════════════════════════════════════════════

class _PersonalInfoSheet extends ConsumerStatefulWidget {
  final User user;
  const _PersonalInfoSheet({required this.user});

  @override
  ConsumerState<_PersonalInfoSheet> createState() =>
      _PersonalInfoSheetState();
}

class _PersonalInfoSheetState extends ConsumerState<_PersonalInfoSheet> {
  final _formKey  = GlobalKey<FormState>();
  late final TextEditingController _firstCtrl;
  late final TextEditingController _lastCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _phoneCtrl;

  @override
  void initState() {
    super.initState();
    _firstCtrl = TextEditingController(text: widget.user.firstName);
    _lastCtrl  = TextEditingController(text: widget.user.lastName);
    _emailCtrl = TextEditingController(text: widget.user.email);
    _phoneCtrl = TextEditingController(text: widget.user.phone);
  }

  @override
  void dispose() {
    _firstCtrl.dispose(); _lastCtrl.dispose();
    _emailCtrl.dispose(); _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state     = ref.watch(updatePersonalInfoProvider);
    final isLoading = state is AsyncLoading;
    final error     = state is AsyncError
        ? state.error.toString()
        : null;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          20, 20, 20, 20 + MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Handle(),
            const SizedBox(height: 16),
            Text('Informations personnelles', style: AppTextStyles.headingMd),
            const SizedBox(height: 20),

            if (error != null) ...[
              _ErrorBanner(message: error),
              const SizedBox(height: 14),
            ],

            Row(children: [
              Expanded(child: TextFormField(
                controller: _firstCtrl, style: AppTextStyles.bodyMd,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(labelText: 'Prénom'),
                validator: (v) => (v == null || v.isEmpty) ? 'Requis' : null,
              )),
              const SizedBox(width: 12),
              Expanded(child: TextFormField(
                controller: _lastCtrl, style: AppTextStyles.bodyMd,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (v) => (v == null || v.isEmpty) ? 'Requis' : null,
              )),
            ]),
            const SizedBox(height: 14),

            TextFormField(
              controller: _emailCtrl, style: AppTextStyles.bodyMd,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                prefixIcon: Icon(Icons.mail_outline_rounded,
                    size: 20, color: AppColors.textMuted),
              ),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Requis';
                if (!v.contains('@')) return 'E-mail invalide';
                return null;
              },
            ),
            const SizedBox(height: 14),

            TextFormField(
              controller: _phoneCtrl, style: AppTextStyles.bodyMd,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Téléphone',
                prefixIcon: Icon(Icons.phone_outlined,
                    size: 20, color: AppColors.textMuted),
              ),
              validator: (v) => (v == null || v.isEmpty) ? 'Requis' : null,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: isLoading ? null : _submit,
              child: isLoading
                  ? const SizedBox(width: 20, height: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: AppColors.bgDeep))
                  : const Text('Enregistrer'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final ok = await ref.read(updatePersonalInfoProvider.notifier).update(
      firstName: _firstCtrl.text.trim(),
      lastName:  _lastCtrl.text.trim(),
      email:     _emailCtrl.text.trim(),
      phone:     _phoneCtrl.text.trim(),
    );
    if (ok && mounted) {
      Navigator.pop(context);
      _snack(context, 'Informations mises à jour', AppColors.green);
    }
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// SHEET : MOT DE PASSE
// ══════════════════════════════════════════════════════════════════════════════

class _PasswordSheet extends ConsumerStatefulWidget {
  const _PasswordSheet();

  @override
  ConsumerState<_PasswordSheet> createState() => _PasswordSheetState();
}

class _PasswordSheetState extends ConsumerState<_PasswordSheet> {
  final _formKey     = GlobalKey<FormState>();
  final _currentCtrl = TextEditingController();
  final _newCtrl     = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool  _obscure     = true;

  @override
  void dispose() {
    _currentCtrl.dispose(); _newCtrl.dispose(); _confirmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state     = ref.watch(changePasswordProvider);
    final isLoading = state is AsyncLoading;
    final error     = state is AsyncError
        ? state.error.toString()
        : null;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          20, 20, 20, 20 + MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Handle(),
            const SizedBox(height: 16),
            Text('Changer le mot de passe', style: AppTextStyles.headingMd),
            const SizedBox(height: 20),

            if (error != null) ...[
              _ErrorBanner(message: error),
              const SizedBox(height: 14),
            ],

            TextFormField(
              controller: _currentCtrl, obscureText: _obscure,
              style: AppTextStyles.bodyMd,
              decoration: InputDecoration(
                labelText: 'Mot de passe actuel',
                prefixIcon: const Icon(Icons.lock_outline_rounded,
                    size: 20, color: AppColors.textMuted),
                suffixIcon: IconButton(
                  icon: Icon(_obscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                      size: 20, color: AppColors.textMuted),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
              validator: (v) => (v == null || v.isEmpty) ? 'Requis' : null,
            ),
            const SizedBox(height: 14),

            TextFormField(
              controller: _newCtrl, obscureText: _obscure,
              style: AppTextStyles.bodyMd,
              decoration: const InputDecoration(
                labelText: 'Nouveau mot de passe',
                prefixIcon: Icon(Icons.lock_outline_rounded,
                    size: 20, color: AppColors.textMuted),
              ),
              validator: (v) => (v == null || v.length < 6)
                  ? 'Au moins 6 caractères'
                  : null,
            ),
            const SizedBox(height: 14),

            TextFormField(
              controller: _confirmCtrl, obscureText: _obscure,
              style: AppTextStyles.bodyMd,
              decoration: const InputDecoration(
                labelText: 'Confirmer le nouveau mot de passe',
                prefixIcon: Icon(Icons.lock_outline_rounded,
                    size: 20, color: AppColors.textMuted),
              ),
              validator: (v) => v != _newCtrl.text
                  ? 'Les mots de passe ne correspondent pas'
                  : null,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: isLoading ? null : _submit,
              child: isLoading
                  ? const SizedBox(width: 20, height: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: AppColors.bgDeep))
                  : const Text('Changer le mot de passe'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final ok = await ref.read(changePasswordProvider.notifier).change(
      currentPassword: _currentCtrl.text,
      newPassword:     _newCtrl.text,
    );
    if (ok && mounted) {
      Navigator.pop(context);
      _snack(context, 'Mot de passe modifié', AppColors.green);
    }
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// ROUTES PUSH (disponibilités / indisponibilités depuis profil)
// ══════════════════════════════════════════════════════════════════════════════



// ══════════════════════════════════════════════════════════════════════════════
// WIDGETS COMMUNS
// ══════════════════════════════════════════════════════════════════════════════

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel(this.label);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 4, bottom: 2),
    child: Text(label, style: AppTextStyles.eyebrow),
  );
}

class _MenuCard extends StatelessWidget {
  final List<Widget> children;
  const _MenuCard({required this.children});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppColors.bgPanel,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppColors.border),
    ),
    child: Column(
      children: children.asMap().entries.map((e) => Column(children: [
        e.value,
        if (e.key < children.length - 1)
          const Divider(height: 1, indent: 52),
      ])).toList(),
    ),
  );
}

class _MenuItem extends StatelessWidget {
  final IconData     icon;
  final String       label;
  final VoidCallback onTap;
  final Color        color;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color = AppColors.textPrimary,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(14),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Row(children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 16),
        Expanded(child: Text(label,
            style: AppTextStyles.bodyMd.copyWith(color: color))),
        Icon(Icons.arrow_forward_ios_rounded,
            size: 13, color: AppColors.textMuted),
      ]),
    ),
  );
}

class _StatusChip extends StatelessWidget {
  final String status;
  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final (label, color, bg) = switch (status) {
      'ACTIF'      => ('Actif',        AppColors.green,   AppColors.greenDim),
      'EN_ATTENTE' => ('En validation', AppColors.warning, AppColors.warningDim),
      _            => ('Suspendu',     AppColors.error,   AppColors.errorDim),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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

class _Handle extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(child: Container(
    width: 36, height: 4,
    decoration: BoxDecoration(
      color: AppColors.textMuted.withOpacity(0.4),
      borderRadius: BorderRadius.circular(2),
    ),
  ));
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

class _ErrorState extends StatelessWidget {
  final VoidCallback onRetry;
  const _ErrorState({required this.onRetry});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      const Icon(Icons.wifi_off_rounded, size: 48, color: AppColors.textMuted),
      const SizedBox(height: 14),
      Text('Impossible de charger votre profil',
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

void _snack(BuildContext context, String msg, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg, style: const TextStyle(fontFamily: 'DMSans')),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ));
}
