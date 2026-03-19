import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/utils/router.dart';
import '../../../core/utils/theme.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey   = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl  = TextEditingController();
  bool _obscure    = true;

  @override
  void dispose() { _emailCtrl.dispose(); _passCtrl.dispose(); super.dispose(); }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    await ref.read(authProvider.notifier).login(_emailCtrl.text.trim(), _passCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    final auth      = ref.watch(authProvider);
    final isLoading = auth is AuthLoading;
    final error     = auth is AuthError ? (auth as AuthError).message : null;

    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64),
                Text('Appointment Pro', style: AppTextStyles.eyebrow),
                const SizedBox(height: 12),
                Text('Espace prestataire', style: AppTextStyles.displayLg),
                const SizedBox(height: 8),
                Text('Connectez-vous pour gérer vos rendez-vous.',
                    style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary)),
                const SizedBox(height: 48),

                if (error != null) ...[
                  _ErrorBanner(message: error),
                  const SizedBox(height: 20),
                ],

                TextFormField(
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  style: AppTextStyles.bodyMd,
                  decoration: const InputDecoration(
                    labelText: 'Adresse e-mail',
                    prefixIcon: Icon(Icons.mail_outline_rounded, size: 20, color: AppColors.textMuted),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Champ requis';
                    if (!v.contains('@')) return 'E-mail invalide';
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _passCtrl,
                  obscureText: _obscure,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _submit(),
                  style: AppTextStyles.bodyMd,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    prefixIcon: const Icon(Icons.lock_outline_rounded, size: 20, color: AppColors.textMuted),
                    suffixIcon: IconButton(
                      icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          size: 20, color: AppColors.textMuted),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                  ),
                  validator: (v) => (v == null || v.isEmpty) ? 'Champ requis' : null,
                ),
                const SizedBox(height: 32),

                ElevatedButton(
                  onPressed: isLoading ? null : _submit,
                  child: isLoading
                      ? const SizedBox(width: 20, height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.bgDeep))
                      : const Text('Se connecter'),
                ),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pas encore de compte ? ",
                        style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary)),
                    TextButton(
                      onPressed: () => context.go(AppRoutes.register),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text("S'inscrire"),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
