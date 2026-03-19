import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../api/api_client.dart';
import '../models/models.dart';

part 'availability_provider.g.dart';

@riverpod
Future<List<AvailabilityDto>> myAvailabilities(MyAvailabilitiesRef ref) async {
  final dio = ref.read(dioProvider);
  final res = await dio.get(ApiConstants.availabilities);
  return (res.data as List)
      .map((e) => AvailabilityDto.fromJson(e))
      .toList();
}

@riverpod
class SaveAvailabilities extends _$SaveAvailabilities {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> save(List<AvailabilityDto> dtos) async {
    state = const AsyncLoading();
    try {
      final dio = ref.read(dioProvider);
      await dio.put(
        ApiConstants.availabilitiesBulk,
        data: dtos.map((d) => d.toJson()).toList(),
      );
      ref.invalidate(myAvailabilitiesProvider);
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}
