import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../api/api_client.dart';
import '../models/models.dart';
import 'dashboard_provider.dart';

part 'agenda_provider.g.dart';

// ── RDV filtrés par statut ────────────────────────────────────────────────────

@riverpod
Future<List<AppointmentResponse>> appointmentsByStatus(
  AppointmentsByStatusRef ref,
  AppointmentStatus status,
) async {
  final all = await ref.watch(myAppointmentsProvider.future);
  return all.where((a) => a.status == status).toList()
    ..sort((a, b) => a.dateHeureDebut.compareTo(b.dateHeureDebut));
}

@riverpod
Future<List<AppointmentResponse>> historyAppointments(
    HistoryAppointmentsRef ref) async {
  final all = await ref.watch(myAppointmentsProvider.future);
  return all
      .where((a) =>
          a.status == AppointmentStatus.HONORE ||
          a.status == AppointmentStatus.ABSENT ||
          a.status == AppointmentStatus.ANNULE_CLIENT ||
          a.status == AppointmentStatus.ANNULE_PRESTATAIRE)
      .toList()
    ..sort((a, b) => b.dateHeureDebut.compareTo(a.dateHeureDebut));
}

// ── Actions ───────────────────────────────────────────────────────────────────

@riverpod
class AppointmentActions extends _$AppointmentActions {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Dio get _dio => ref.read(dioProvider);

  Future<bool> confirm(int id) async {
    state = const AsyncLoading();
    try {
      await _dio.patch(ApiEndpoints.confirmAppointment(id));
      ref.invalidate(myAppointmentsProvider);
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }

  Future<bool> refuse(int id, String motif) async {
    state = const AsyncLoading();
    try {
      await _dio.patch(
        ApiEndpoints.refuseAppointment(id),
        queryParameters: {'motif': motif},
      );
      ref.invalidate(myAppointmentsProvider);
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }

  Future<bool> cloture(int id, {required bool present}) async {
    state = const AsyncLoading();
    try {
      await _dio.patch(
        ApiEndpoints.clotureAppointment(id),
        queryParameters: {'present': present},
      );
      ref.invalidate(myAppointmentsProvider);
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}
