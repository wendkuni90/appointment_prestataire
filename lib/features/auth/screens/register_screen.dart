import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/api/api_client.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/utils/router.dart';
import '../../../core/utils/theme.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});
  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey     = GlobalKey<FormState>();
  final _firstCtrl   = TextEditingController();
  final _lastCtrl    = TextEditingController();
  final _emailCtrl   = TextEditingController();
  final _phoneCtrl   = TextEditingController();
  final _passCtrl    = TextEditingController();
  final _confirmCtrl = TextEditingController();

  bool  _obscure       = true;
  bool  _isUploading   = false;
  File? _photo;
  File? _justificatif;
  String? _uploadError;

  @override
  void dispose() {
    _firstCtrl.dispose(); _lastCtrl.dispose(); _emailCtrl.dispose();
    _phoneCtrl.dispose(); _passCtrl.dispose(); _confirmCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto() async {
    final f = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxWidth: 1024, maxHeight: 1024, imageQuality: 85);
    if (f != null) setState(() => _photo = File(f.path));
  }

  Future<void> _pickJustificatif() async {
    final f = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 90);
    if (f != null) setState(() => _justificatif = File(f.path));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    await ref.read(authProvider.notifier).register(
      firstName: _firstCtrl.text.trim(),
      lastName:  _lastCtrl.text.trim(),
      email:     _emailCtrl.text.trim(),
      password:  _passCtrl.text,
      phone:     _phoneCtrl.text.trim(),
    );

    final auth = ref.read(authProvider);
    if (auth is! AuthAuthenticated) return;

    setState(() { _isUploading = true; _uploadError = null; });

    final dio = ref.read(dioProvider);
    final opts = Options(contentType: 'multipart/form-data');

    if (_photo != null) {
      try {
        await dio.post(ApiConstants.uploadPhoto,
            data: FormData.fromMap({'file': await MultipartFile.fromFile(_photo!.path, filename: 'photo.jpg')}),
            options: opts);
      } catch (_) {
        setState(() => _uploadError = 'Photo non envoyée — modifiable depuis le profil.');
      }
    }

    if (_justificatif != null) {
      try {
        await dio.post(ApiConstants.uploadJustificatif,
            data: FormData.fromMap({'file': await MultipartFile.fromFile(_justificatif!.path, filename: 'justificatif.jpg')}),
            options: opts);
      } catch (_) {
        setState(() => _uploadError = (_uploadError != null ? '$_uploadError\n' : '') +
            'Justificatif non envoyé — modifiable depuis le profil.');
      }
    }

    setState(() => _isUploading = false);
  }

  @override
  Widget build(BuildContext context) {
    final auth      = ref.watch(authProvider);
    final isLoading = auth is AuthLoading || _isUploading;
    final error     = auth is AuthError ? (auth as AuthError).message : null;

    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.go(AppRoutes.login)),
        title: const Text('Créer un compte'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text('Devenir prestataire', style: AppTextStyles.displaySm),
                const SizedBox(height: 6),
                Text('Votre compte sera examiné avant activation.',
                    style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary)),
                const SizedBox(height: 28),

                // ── Photo profil ─────────────────────────────────────
                _Label('Photo de profil'),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _pickPhoto,
                  child: Container(
                    width: 90, height: 90,
                    decoration: BoxDecoration(
                      color: AppColors.bgSurface,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _photo != null ? AppColors.accent.withOpacity(0.5) : AppColors.border,
                        width: 2,
                      ),
                    ),
                    child: _photo != null
                        ? ClipOval(child: Image.file(_photo!, fit: BoxFit.cover))
                        : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            const Icon(Icons.add_a_photo_outlined, color: AppColors.textMuted, size: 24),
                            const SizedBox(height: 4),
                            Text('Ajouter', style: AppTextStyles.bodySm.copyWith(color: AppColors.textMuted)),
                          ]),
                  ),
                ),
                const SizedBox(height: 24),

                // ── Informations ─────────────────────────────────────
                _Label('Informations personnelles'),
                const SizedBox(height: 10),

                if (error != null) ...[
                  _ErrorBanner(message: error),
                  const SizedBox(height: 14),
                ],

                Row(children: [
                  Expanded(child: TextFormField(
                    controller: _firstCtrl, textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next, style: AppTextStyles.bodyMd,
                    decoration: const InputDecoration(labelText: 'Prénom'),
                    validator: (v) => (v == null || v.isEmpty) ? 'Requis' : null,
                  )),
                  const SizedBox(width: 12),
                  Expanded(child: TextFormField(
                    controller: _lastCtrl, textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next, style: AppTextStyles.bodyMd,
                    decoration: const InputDecoration(labelText: 'Nom'),
                    validator: (v) => (v == null || v.isEmpty) ? 'Requis' : null,
                  )),
                ]),
                const SizedBox(height: 14),

                TextFormField(
                  controller: _emailCtrl, keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next, style: AppTextStyles.bodyMd,
                  decoration: const InputDecoration(
                    labelText: 'Adresse e-mail',
                    prefixIcon: Icon(Icons.mail_outline_rounded, size: 20, color: AppColors.textMuted),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Requis';
                    if (!v.contains('@')) return 'E-mail invalide';
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                TextFormField(
                  controller: _phoneCtrl, keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next, style: AppTextStyles.bodyMd,
                  decoration: const InputDecoration(
                    labelText: 'Téléphone',
                    prefixIcon: Icon(Icons.phone_outlined, size: 20, color: AppColors.textMuted),
                  ),
                  validator: (v) => (v == null || v.isEmpty) ? 'Requis' : null,
                ),
                const SizedBox(height: 14),

                TextFormField(
                  controller: _passCtrl, obscureText: _obscure,
                  textInputAction: TextInputAction.next, style: AppTextStyles.bodyMd,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    prefixIcon: const Icon(Icons.lock_outline_rounded, size: 20, color: AppColors.textMuted),
                    suffixIcon: IconButton(
                      icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          size: 20, color: AppColors.textMuted),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                  ),
                  validator: (v) => (v == null || v.length < 6) ? 'Au moins 6 caractères' : null,
                ),
                const SizedBox(height: 14),

                TextFormField(
                  controller: _confirmCtrl, obscureText: _obscure,
                  textInputAction: TextInputAction.done, onFieldSubmitted: (_) => _submit(),
                  style: AppTextStyles.bodyMd,
                  decoration: const InputDecoration(
                    labelText: 'Confirmer le mot de passe',
                    prefixIcon: Icon(Icons.lock_outline_rounded, size: 20, color: AppColors.textMuted),
                  ),
                  validator: (v) => v != _passCtrl.text ? 'Les mots de passe ne correspondent pas' : null,
                ),
                const SizedBox(height: 24),

                // ── Justificatif ─────────────────────────────────────
                _Label('Justificatif professionnel'),
                const SizedBox(height: 6),
                Text('Kbis, attestation auto-entrepreneur, diplôme… Accélère la validation.',
                    style: AppTextStyles.bodySm.copyWith(color: AppColors.textSecondary)),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _pickJustificatif,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.bgSurface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _justificatif != null ? AppColors.green.withOpacity(0.5) : AppColors.border,
                      ),
                    ),
                    child: Row(children: [
                      Icon(
                        _justificatif != null ? Icons.check_circle_outline_rounded : Icons.upload_file_outlined,
                        color: _justificatif != null ? AppColors.green : AppColors.textMuted, size: 22,
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Text(
                        _justificatif != null
                            ? _justificatif!.path.split('/').last
                            : 'Appuyez pour sélectionner un fichier',
                        style: AppTextStyles.bodyMd.copyWith(
                            color: _justificatif != null ? AppColors.textPrimary : AppColors.textMuted),
                        maxLines: 1, overflow: TextOverflow.ellipsis,
                      )),
                      if (_justificatif != null)
                        GestureDetector(
                          onTap: () => setState(() => _justificatif = null),
                          child: const Icon(Icons.close, size: 18, color: AppColors.textMuted),
                        ),
                    ]),
                  ),
                ),

                if (_uploadError != null) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.warningDim,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.warning.withOpacity(0.3)),
                    ),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Icon(Icons.warning_amber_rounded, color: AppColors.warning, size: 16),
                      const SizedBox(width: 8),
                      Expanded(child: Text(_uploadError!,
                          style: AppTextStyles.bodySm.copyWith(color: AppColors.warning))),
                    ]),
                  ),
                ],

                if (_isUploading) ...[
                  const SizedBox(height: 20),
                  const Center(child: Column(children: [
                    CircularProgressIndicator(color: AppColors.accent),
                    SizedBox(height: 10),
                    Text('Envoi des fichiers…',
                        style: TextStyle(fontFamily: 'DMSans', color: AppColors.textSecondary, fontSize: 13)),
                  ])),
                ],

                const SizedBox(height: 28),

                ElevatedButton(
                  onPressed: isLoading ? null : _submit,
                  child: isLoading
                      ? const SizedBox(width: 20, height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.bgDeep))
                      : const Text('Créer mon compte'),
                ),
                const SizedBox(height: 16),

                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Déjà un compte ? ',
                      style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary)),
                  TextButton(
                    onPressed: () => context.go(AppRoutes.login),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    child: const Text('Se connecter'),
                  ),
                ]),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String label;
  const _Label(this.label);
  @override
  Widget build(BuildContext context) => Text(label, style: AppTextStyles.eyebrow);
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
      Expanded(child: Text(message, style: AppTextStyles.bodySm.copyWith(color: AppColors.error))),
    ]),
  );
}
