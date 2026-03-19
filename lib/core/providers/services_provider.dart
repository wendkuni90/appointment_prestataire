import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../api/api_client.dart';
import '../models/models.dart';

part 'services_provider.g.dart';

// ── Liste des services ────────────────────────────────────────────────────────

@riverpod
Future<List<ServiceResponse>> myServices(MyServicesRef ref) async {
  final dio = ref.read(dioProvider);
  final res = await dio.get(ApiConstants.services);
  return (res.data as List)
      .map((e) => ServiceResponse.fromJson(e))
      .toList();
}

// ── CRUD services ─────────────────────────────────────────────────────────────

@riverpod
class ServiceActions extends _$ServiceActions {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> create(ServiceRequest request) async {
    state = const AsyncLoading();
    try {
      final dio = ref.read(dioProvider);
      await dio.post(ApiConstants.services, data: request.toJson());
      ref.invalidate(myServicesProvider);
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }

  Future<bool> update(int id, ServiceRequest request) async {
    state = const AsyncLoading();
    try {
      final dio = ref.read(dioProvider);
      await dio.put(ApiEndpoints.serviceById(id), data: request.toJson());
      ref.invalidate(myServicesProvider);
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }

  Future<bool> delete(int id) async {
    state = const AsyncLoading();
    try {
      final dio = ref.read(dioProvider);
      await dio.delete(ApiEndpoints.serviceById(id));
      ref.invalidate(myServicesProvider);
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}
