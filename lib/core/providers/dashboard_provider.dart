import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../api/api_client.dart';
import '../models/models.dart';

part 'dashboard_provider.g.dart';

// ── Stats prestataire ─────────────────────────────────────────────────────────

@riverpod
Future<PrestataireDashboardStats> dashboardStats(DashboardStatsRef ref) async {
  final dio = ref.read(dioProvider);
  final res = await dio.get(ApiConstants.stats);
  return PrestataireDashboardStats.fromJson(res.data);
}

// ── Tous les RDV du prestataire ───────────────────────────────────────────────

@riverpod
Future<List<AppointmentResponse>> myAppointments(MyAppointmentsRef ref) async {
  final dio = ref.read(dioProvider);
  final res = await dio.get(ApiConstants.myAppointments);
  return (res.data as List)
      .map((e) => AppointmentResponse.fromJson(e))
      .toList();
}

// ── RDV du jour (CONFIRME + EN_ATTENTE) ──────────────────────────────────────

@riverpod
Future<List<AppointmentResponse>> todayAppointments(
    TodayAppointmentsRef ref) async {
  final all   = await ref.watch(myAppointmentsProvider.future);
  final today = DateTime.now();
  return all.where((a) {
    final d = DateTime.parse(a.dateHeureDebut);
    return d.year == today.year &&
        d.month == today.month &&
        d.day == today.day &&
        (a.status == AppointmentStatus.CONFIRME ||
            a.status == AppointmentStatus.EN_ATTENTE);
  }).toList()
    ..sort((a, b) => a.dateHeureDebut.compareTo(b.dateHeureDebut));
}

// ── RDV en attente (toutes dates) ─────────────────────────────────────────────

@riverpod
Future<List<AppointmentResponse>> pendingAppointments(
    PendingAppointmentsRef ref) async {
  final all = await ref.watch(myAppointmentsProvider.future);
  return all
      .where((a) => a.status == AppointmentStatus.EN_ATTENTE)
      .toList()
    ..sort((a, b) => a.dateHeureDebut.compareTo(b.dateHeureDebut));
}
