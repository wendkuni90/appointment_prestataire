import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../api/api_client.dart';
import '../models/models.dart';

part 'auth_provider.g.dart';

// ── State ─────────────────────────────────────────────────────────────────────

sealed class AuthState {}
class AuthInitial        extends AuthState {}
class AuthLoading        extends AuthState {}
class AuthAuthenticated  extends AuthState {
  final User user;
  AuthAuthenticated(this.user);
}
class AuthUnauthenticated extends AuthState {}
class AuthError           extends AuthState {
  final String message;
  AuthError(this.message);
}

// ── Notifier ──────────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthState build() {
    Future.microtask(_checkSession);
    return AuthInitial();
  }

  Dio get _dio => ref.read(dioProvider);

  Future<void> _checkSession() async {
    state = AuthLoading();
    try {
      final res = await _dio.get(ApiConstants.me);
      state = AuthAuthenticated(User.fromJson(res.data));
    } on DioException {
      state = AuthUnauthenticated();
    }
  }

  Future<void> login(String email, String password) async {
    state = AuthLoading();
    try {
      final res = await _dio.post(
        ApiConstants.login,
        data: LoginRequest(email: email, password: password).toJson(),
      );
      final user = User.fromJson(res.data);
      // Seuls les PRESTATAIRE peuvent se connecter ici
      if (user.role != UserRole.PRESTATAIRE) {
        await _dio.post(ApiConstants.logout);
        state = AuthError('Ce compte n\'est pas un compte prestataire.');
        return;
      }
      if (user.status == UserStatus.SUSPENDU) {
        await _dio.post(ApiConstants.logout);
        state = AuthError('Votre compte a été suspendu. Contactez le support.');
        return;
      }
      state = AuthAuthenticated(user);
    } on DioException catch (e) {
      final msg = e.response?.data?['message'] ?? 'Email ou mot de passe incorrect';
      state = AuthError(msg);
    }
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String businessName,
    required String description,
    required int    categoryId,
  }) async {
    state = AuthLoading();
    try {
      final res = await _dio.post(
        ApiConstants.registerPrestataire,   // ← nouvelle route
        data: RegisterPrestataireRequest(
          firstName:    firstName,
          lastName:     lastName,
          email:        email,
          password:     password,
          phone:        phone,
          businessName: businessName,
          description:  description,
          categoryId:   categoryId,
        ).toJson(),
      );
      state = AuthAuthenticated(User.fromJson(res.data));
    } on DioException catch (e) {
      final msg = e.response?.data?['message'] ?? "Erreur lors de l'inscription";
      state = AuthError(msg);
    }
  }

  Future<void> logout() async {
    try { await _dio.post(ApiConstants.logout); } catch (_) {}
    state = AuthUnauthenticated();
  }

  Future<void> refresh() async {
    try {
      final res = await _dio.get(ApiConstants.me);
      state = AuthAuthenticated(User.fromJson(res.data));
    } catch (_) {}
  }
}

// ── Helpers ───────────────────────────────────────────────────────────────────

final currentUserProvider = Provider<User?>((ref) {
  final auth = ref.watch(authProvider);
  return switch (auth) {
    AuthAuthenticated(:final user) => user,
    _ => null,
  };
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(currentUserProvider) != null;
});

/// true si le compte est EN_ATTENTE de validation admin
final isPendingProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.status == UserStatus.EN_ATTENTE;
});
