import 'dart:io';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../api/api_client.dart';
import '../models/models.dart';
import 'auth_provider.dart';

part 'profile_provider.g.dart';

// ── Profil prestataire ────────────────────────────────────────────────────────

@riverpod
Future<PrestataireResponse> myProfile(MyProfileRef ref) async {
  final dio = ref.read(dioProvider);
  final res = await dio.get(ApiConstants.prestataireProfile);
  return PrestataireResponse.fromJson(res.data);
}

// ── Mettre à jour le profil prestataire ──────────────────────────────────────

@riverpod
class UpdatePrestataireProfile extends _$UpdatePrestataireProfile {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> update(PrestataireProfileRequest request) async {
    state = const AsyncLoading();
    try {
      final dio = ref.read(dioProvider);
      await dio.put(
        ApiConstants.prestataireProfile,
        data: request.toJson(),
      );
      ref.invalidate(myProfileProvider);
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}

// ── Mettre à jour les infos personnelles (compte) ────────────────────────────

@riverpod
class UpdatePersonalInfo extends _$UpdatePersonalInfo {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> update({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    state = const AsyncLoading();
    try {
      final dio = ref.read(dioProvider);
      await dio.put(
        ApiConstants.updateProfile,
        data: {
          'firstName': firstName,
          'lastName':  lastName,
          'email':     email,
          'phone':     phone,
        },
      );
      await ref.read(authProvider.notifier).refresh();
      state = const AsyncData(null);
      return true;
    } on DioException catch (e) {
      final msg = e.response?.data?['message'] ?? 'Erreur lors de la mise à jour';
      state = AsyncError(msg, StackTrace.current);
      return false;
    }
  }
}

// ── Changer le mot de passe ───────────────────────────────────────────────────

@riverpod
class ChangePassword extends _$ChangePassword {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> change({
    required String currentPassword,
    required String newPassword,
  }) async {
    state = const AsyncLoading();
    try {
      final dio = ref.read(dioProvider);
      await dio.patch(ApiConstants.changePassword, data: {
        'currentPassword': currentPassword,
        'newPassword':     newPassword,
      });
      state = const AsyncData(null);
      return true;
    } on DioException catch (e) {
      final msg = e.response?.data?['message'] ?? 'Mot de passe actuel incorrect';
      state = AsyncError(msg, StackTrace.current);
      return false;
    }
  }
}

// ── Upload photo ──────────────────────────────────────────────────────────────

@riverpod
class UploadPhoto extends _$UploadPhoto {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> upload(File file) async {
    state = const AsyncLoading();
    try {
      final dio  = ref.read(dioProvider);
      final form = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: 'photo.jpg',
        ),
      });
      await dio.post(
        ApiConstants.uploadPhoto,
        data: form,
        options: Options(contentType: 'multipart/form-data'),
      );
      ref.invalidate(myProfileProvider);
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}

// ── Supprimer le compte ───────────────────────────────────────────────────────

@riverpod
class DeleteAccount extends _$DeleteAccount {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> delete() async {
    state = const AsyncLoading();
    try {
      final dio = ref.read(dioProvider);
      await dio.delete(ApiConstants.deleteAccount);
      await ref.read(authProvider.notifier).logout();
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }
}
