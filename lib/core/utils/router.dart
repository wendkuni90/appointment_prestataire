import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';
import '../../core/models/models.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/auth/screens/pending_screen.dart';
import '../../features/dashboard/screens/dashboard_screen.dart';
import '../../features/agenda/screens/agenda_screen.dart';
import '../../features/services/screens/services_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../widgets/main_shell.dart';

class AppRoutes {
  static const login    = '/login';
  static const register = '/register';
  static const pending  = '/pending';   // EN_ATTENTE validation
  static const home     = '/home';
  static const agenda   = '/agenda';
  static const services = '/services';
  static const profile  = '/profile';
}

// ── RouterNotifier ────────────────────────────────────────────────────────────

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  AuthState? _lastState;

  RouterNotifier(this._ref) {
    _ref.listen<AuthState>(authProvider, (_, next) {
      if (next != _lastState) {
        _lastState = next;
        notifyListeners();
      }
    });
  }

  AuthState get authState => _ref.read(authProvider);
}

final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});

// ── Router ────────────────────────────────────────────────────────────────────

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider);

  return GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,
    refreshListenable: notifier,

    redirect: (context, state) {
      final authState = notifier.authState;
      final isAuth    = authState is AuthAuthenticated;
      final isLoading = authState is AuthLoading || authState is AuthInitial;
      final loc       = state.matchedLocation;
      final isOnAuth  = loc == AppRoutes.login || loc == AppRoutes.register;
      final isOnPending = loc == AppRoutes.pending;

      if (isLoading) return null;

      if (!isAuth && !isOnAuth) return AppRoutes.login;
      if (isAuth  &&  isOnAuth) {
        // Rediriger vers pending si EN_ATTENTE
        final user = (authState as AuthAuthenticated).user;
        return user.status == UserStatus.EN_ATTENTE
            ? AppRoutes.pending
            : AppRoutes.home;
      }
      // Si connecté mais EN_ATTENTE → bloquer sur /pending
      if (isAuth && !isOnPending) {
        final user = (authState as AuthAuthenticated).user;
        if (user.status == UserStatus.EN_ATTENTE) return AppRoutes.pending;
      }
      // Si connecté et ACTIF mais sur /pending → renvoyer home
      if (isAuth && isOnPending) {
        final user = (authState as AuthAuthenticated).user;
        if (user.status == UserStatus.ACTIF) return AppRoutes.home;
      }
      return null;
    },

    routes: [
      // ── Auth ────────────────────────────────────────────────────
      GoRoute(path: AppRoutes.login,    builder: (_, __) => const LoginScreen()),
      GoRoute(path: AppRoutes.register, builder: (_, __) => const RegisterScreen()),
      GoRoute(path: AppRoutes.pending,  builder: (_, __) => const PendingScreen()),

      // ── App (bottom nav shell) ───────────────────────────────────
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            pageBuilder: (_, __) =>
                const NoTransitionPage(child: DashboardScreen()),
          ),
          GoRoute(
            path: AppRoutes.agenda,
            pageBuilder: (_, __) =>
                const NoTransitionPage(child: AgendaScreen()),
          ),
          GoRoute(
            path: AppRoutes.services,
            pageBuilder: (_, __) =>
                const NoTransitionPage(child: ServicesScreen()),
          ),
          GoRoute(
            path: AppRoutes.profile,
            pageBuilder: (_, __) =>
                const NoTransitionPage(child: ProfileScreen()),
          ),
        ],
      ),
    ],
  );
});
