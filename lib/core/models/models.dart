import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

// ══════════════════════════════════════════════════════════════════════════════
// ENUMS
// ══════════════════════════════════════════════════════════════════════════════
enum UserRole {
  @JsonValue('ADMIN')       ADMIN,
  @JsonValue('CLIENT')      CLIENT,
  @JsonValue('PRESTATAIRE') PRESTATAIRE,
}

enum UserStatus {
  @JsonValue('ACTIF')       ACTIF,
  @JsonValue('EN_ATTENTE')  EN_ATTENTE,
  @JsonValue('SUSPENDU')    SUSPENDU,
}

enum AppointmentStatus {
  EN_ATTENTE,
  CONFIRME,
  ANNULE_CLIENT,
  ANNULE_PRESTATAIRE,
  HONORE,
  ABSENT,
}

enum UnavailabilityType { CONGE, PAUSE, FORMATION, AUTRE }

// ══════════════════════════════════════════════════════════════════════════════
// AUTH
// ══════════════════════════════════════════════════════════════════════════════

@freezed
class User with _$User {
  const factory User({
    required int        id,
    required String     email,
    required String     firstName,
    required String     lastName,
    required String     phone,
    required UserRole   role,
    required UserStatus status,
    int? prestataireId,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;
  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
}

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    @Default('PRESTATAIRE') String role,
  }) = _RegisterRequest;
  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);
}

@freezed
class RegisterPrestataireRequest with _$RegisterPrestataireRequest {
  const factory RegisterPrestataireRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String businessName,
    required String description,
    required int    categoryId,
  }) = _RegisterPrestataireRequest;
  factory RegisterPrestataireRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterPrestataireRequestFromJson(json);
}

// ══════════════════════════════════════════════════════════════════════════════
// PROFIL PRESTATAIRE
// ══════════════════════════════════════════════════════════════════════════════

@freezed
class CategoryResponse with _$CategoryResponse {
  const factory CategoryResponse({
    required int    id,
    required String nom,
    String? description,
    String? iconUrl,
  }) = _CategoryResponse;
  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);
}

@freezed
class PrestataireResponse with _$PrestataireResponse {
  const factory PrestataireResponse({
    required int    id,
    required String businessName,
    required String firstName,
    required String lastName,
    String? email,
    String? phone,
    required String status,
    String? description,   // champ réel du backend
    String? photoUrl,
    String? justificatifUrl,
    CategoryResponse? category,
    double? rating,
    int?    reviewCount,
  }) = _PrestataireResponse;
  factory PrestataireResponse.fromJson(Map<String, dynamic> json) => _$PrestataireResponseFromJson(json);
}

@freezed
class PrestataireProfileRequest with _$PrestataireProfileRequest {
  const factory PrestataireProfileRequest({
    required String businessName,
    String? description,   // correspond au champ "description" du backend
    int?    categoryId,
    String? photoUrl,
  }) = _PrestataireProfileRequest;
  factory PrestataireProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$PrestataireProfileRequestFromJson(json);
}

// ══════════════════════════════════════════════════════════════════════════════
// SERVICES
// ══════════════════════════════════════════════════════════════════════════════

@freezed
class ServiceResponse with _$ServiceResponse {
  const factory ServiceResponse({
    required int    id,
    required String nom,
    String? description,
    required int    duree,
    required double prix,
    required bool   actif,
  }) = _ServiceResponse;
  factory ServiceResponse.fromJson(Map<String, dynamic> json) => _$ServiceResponseFromJson(json);
}

@freezed
class ServiceRequest with _$ServiceRequest {
  const factory ServiceRequest({
    required String nom,
    String? description,
    required int    duree,
    required double prix,
    @Default(true) bool actif,
  }) = _ServiceRequest;
  factory ServiceRequest.fromJson(Map<String, dynamic> json) => _$ServiceRequestFromJson(json);
}

// ══════════════════════════════════════════════════════════════════════════════
// DISPONIBILITÉS
// ══════════════════════════════════════════════════════════════════════════════

@freezed
class AvailabilityDto with _$AvailabilityDto {
  const factory AvailabilityDto({
    int?    id,
    required String jour,        // "MONDAY", "TUESDAY", ...
    required bool   travaille,
    String? heureDebutMatin,     // "09:00:00"
    String? heureFinMatin,
    String? heureDebutApresMidi,
    String? heureFinApresMidi,
  }) = _AvailabilityDto;
  factory AvailabilityDto.fromJson(Map<String, dynamic> json) => _$AvailabilityDtoFromJson(json);
}

// ══════════════════════════════════════════════════════════════════════════════
// INDISPONIBILITÉS
// ══════════════════════════════════════════════════════════════════════════════

@freezed
class UnavailabilityResponse with _$UnavailabilityResponse {
  const factory UnavailabilityResponse({
    required int    id,
    required String dateDebut,  // ISO string
    required String dateFin,
    required String motif,
    String? description,
  }) = _UnavailabilityResponse;
  factory UnavailabilityResponse.fromJson(Map<String, dynamic> json) =>
      _$UnavailabilityResponseFromJson(json);
}

@freezed
class UnavailabilityRequest with _$UnavailabilityRequest {
  const factory UnavailabilityRequest({
    required String             dateDebut,  // ISO format
    required String             dateFin,
    required UnavailabilityType motif,
    String? description,
  }) = _UnavailabilityRequest;
  factory UnavailabilityRequest.fromJson(Map<String, dynamic> json) =>
      _$UnavailabilityRequestFromJson(json);
}

// ══════════════════════════════════════════════════════════════════════════════
// RENDEZ-VOUS
// ══════════════════════════════════════════════════════════════════════════════

@freezed
class UserSummary with _$UserSummary {
  const factory UserSummary({
    required int    id,
    required String firstName,
    required String lastName,
    String? phone,
  }) = _UserSummary;
  factory UserSummary.fromJson(Map<String, dynamic> json) => _$UserSummaryFromJson(json);
}

@freezed
class AppointmentServiceRef with _$AppointmentServiceRef {
  const factory AppointmentServiceRef({
    required int    id,
    required String nom,
    required int    duree,
    required double prix,
  }) = _AppointmentServiceRef;
  factory AppointmentServiceRef.fromJson(Map<String, dynamic> json) =>
      _$AppointmentServiceRefFromJson(json);
}

@freezed
class AppointmentPrestataireRef with _$AppointmentPrestataireRef {
  const factory AppointmentPrestataireRef({
    required int    id,
    required String businessName,
    required String firstName,
    required String lastName,
    String? photoUrl,
    String? ville,
  }) = _AppointmentPrestataireRef;
  factory AppointmentPrestataireRef.fromJson(Map<String, dynamic> json) =>
      _$AppointmentPrestataireRefFromJson(json);
}

@freezed
class AppointmentResponse with _$AppointmentResponse {
  const factory AppointmentResponse({
    required int                       id,
    required UserSummary               client,
    required AppointmentPrestataireRef prestataire,
    required AppointmentServiceRef     service,
    required String                    dateHeureDebut,
    required String                    dateHeureFin,
    required AppointmentStatus         status,
    String? noteClient,
    String? notePrestataire,
    String? motifRefus,
    String? motifAnnulation,
    String? dateConfirmation,
    String? dateAnnulation,
  }) = _AppointmentResponse;
  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseFromJson(json);
}

// ══════════════════════════════════════════════════════════════════════════════
// STATS
// ══════════════════════════════════════════════════════════════════════════════

@freezed
class PrestataireDashboardStats with _$PrestataireDashboardStats {
  const factory PrestataireDashboardStats({
    required int    totalAppointments,
    required int    pendingAppointments,
    required int    completedAppointments,
    required double totalRevenue,
    double? currentRating,
  }) = _PrestataireDashboardStats;
  factory PrestataireDashboardStats.fromJson(Map<String, dynamic> json) =>
      _$PrestataireDashboardStatsFromJson(json);
}

// ══════════════════════════════════════════════════════════════════════════════
// COMPTE
// ══════════════════════════════════════════════════════════════════════════════

@freezed
class UpdateProfileRequest with _$UpdateProfileRequest {
  const factory UpdateProfileRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) = _UpdateProfileRequest;
  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);
}

@freezed
class ChangePasswordRequest with _$ChangePasswordRequest {
  const factory ChangePasswordRequest({
    required String currentPassword,
    required String newPassword,
  }) = _ChangePasswordRequest;
  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);
}
