import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../api/api_client.dart';
import '../models/models.dart';

part 'unavailability_provider.g.dart';

// ── Liste ─────────────────────────────────────────────────────────────────────

@riverpod
Future<List<UnavailabilityResponse>> myUnavailabilities(
    MyUnavailabilitiesRef ref) async {
  final dio = ref.read(dioProvider);
  final res = await dio.get(ApiConstants.unavailabilities);
  return (res.data as List)
      .map((e) => UnavailabilityResponse.fromJson(e))
      .toList();
}

// ── Créer ─────────────────────────────────────────────────────────────────────

@riverpod
class CreateUnavailability extends _$CreateUnavailability {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> create(UnavailabilityRequest request) async {
    state = const AsyncLoading();
    try {
      final dio = ref.read(dioProvider);
      await dio.post(
        ApiConstants.unavailabilities,
        data: {
          'dateDebut':   request.dateDebut,
          'dateFin':     request.dateFin,
          'motif':       request.motif.name,
          'description': request.description,
        },
      );
      ref.invalidate(myUnavailabilitiesProvider);
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}

// ── Supprimer ─────────────────────────────────────────────────────────────────

@riverpod
class DeleteUnavailability extends _$DeleteUnavailability {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> delete(int id) async {
    state = const AsyncLoading();
    try {
      final dio = ref.read(dioProvider);
      await dio.delete(ApiEndpoints.unavailabilityById(id));
      ref.invalidate(myUnavailabilitiesProvider);
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}
