// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phone: json['phone'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      status: $enumDecode(_$UserStatusEnumMap, json['status']),
      prestataireId: (json['prestataireId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'role': _$UserRoleEnumMap[instance.role]!,
      'status': _$UserStatusEnumMap[instance.status]!,
      'prestataireId': instance.prestataireId,
    };

const _$UserRoleEnumMap = {
  UserRole.ADMIN: 'ADMIN',
  UserRole.CLIENT: 'CLIENT',
  UserRole.PRESTATAIRE: 'PRESTATAIRE',
};

const _$UserStatusEnumMap = {
  UserStatus.ACTIF: 'ACTIF',
  UserStatus.EN_ATTENTE: 'EN_ATTENTE',
  UserStatus.SUSPENDU: 'SUSPENDU',
};

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

_$RegisterRequestImpl _$$RegisterRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterRequestImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String? ?? 'PRESTATAIRE',
    );

Map<String, dynamic> _$$RegisterRequestImplToJson(
        _$RegisterRequestImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'role': instance.role,
    };

_$RegisterPrestataireRequestImpl _$$RegisterPrestataireRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterPrestataireRequestImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      businessName: json['businessName'] as String,
      description: json['description'] as String,
      categoryId: (json['categoryId'] as num).toInt(),
    );

Map<String, dynamic> _$$RegisterPrestataireRequestImplToJson(
        _$RegisterPrestataireRequestImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'businessName': instance.businessName,
      'description': instance.description,
      'categoryId': instance.categoryId,
    };

_$CategoryResponseImpl _$$CategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryResponseImpl(
      id: (json['id'] as num).toInt(),
      nom: json['nom'] as String,
      description: json['description'] as String?,
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$$CategoryResponseImplToJson(
        _$CategoryResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
    };

_$PrestataireResponseImpl _$$PrestataireResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PrestataireResponseImpl(
      id: (json['id'] as num).toInt(),
      businessName: json['businessName'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      status: json['status'] as String,
      description: json['description'] as String?,
      photoUrl: json['photoUrl'] as String?,
      justificatifUrl: json['justificatifUrl'] as String?,
      category: json['category'] == null
          ? null
          : CategoryResponse.fromJson(json['category'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PrestataireResponseImplToJson(
        _$PrestataireResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'businessName': instance.businessName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'status': instance.status,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'justificatifUrl': instance.justificatifUrl,
      'category': instance.category,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
    };

_$PrestataireProfileRequestImpl _$$PrestataireProfileRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PrestataireProfileRequestImpl(
      businessName: json['businessName'] as String,
      description: json['description'] as String?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$PrestataireProfileRequestImplToJson(
        _$PrestataireProfileRequestImpl instance) =>
    <String, dynamic>{
      'businessName': instance.businessName,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'photoUrl': instance.photoUrl,
    };

_$ServiceResponseImpl _$$ServiceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceResponseImpl(
      id: (json['id'] as num).toInt(),
      nom: json['nom'] as String,
      description: json['description'] as String?,
      duree: (json['duree'] as num).toInt(),
      prix: (json['prix'] as num).toDouble(),
      actif: json['actif'] as bool,
    );

Map<String, dynamic> _$$ServiceResponseImplToJson(
        _$ServiceResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'description': instance.description,
      'duree': instance.duree,
      'prix': instance.prix,
      'actif': instance.actif,
    };

_$ServiceRequestImpl _$$ServiceRequestImplFromJson(Map<String, dynamic> json) =>
    _$ServiceRequestImpl(
      nom: json['nom'] as String,
      description: json['description'] as String?,
      duree: (json['duree'] as num).toInt(),
      prix: (json['prix'] as num).toDouble(),
      actif: json['actif'] as bool? ?? true,
    );

Map<String, dynamic> _$$ServiceRequestImplToJson(
        _$ServiceRequestImpl instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'description': instance.description,
      'duree': instance.duree,
      'prix': instance.prix,
      'actif': instance.actif,
    };

_$AvailabilityDtoImpl _$$AvailabilityDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AvailabilityDtoImpl(
      id: (json['id'] as num?)?.toInt(),
      jour: json['jour'] as String,
      travaille: json['travaille'] as bool,
      heureDebutMatin: json['heureDebutMatin'] as String?,
      heureFinMatin: json['heureFinMatin'] as String?,
      heureDebutApresMidi: json['heureDebutApresMidi'] as String?,
      heureFinApresMidi: json['heureFinApresMidi'] as String?,
    );

Map<String, dynamic> _$$AvailabilityDtoImplToJson(
        _$AvailabilityDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jour': instance.jour,
      'travaille': instance.travaille,
      'heureDebutMatin': instance.heureDebutMatin,
      'heureFinMatin': instance.heureFinMatin,
      'heureDebutApresMidi': instance.heureDebutApresMidi,
      'heureFinApresMidi': instance.heureFinApresMidi,
    };

_$UnavailabilityResponseImpl _$$UnavailabilityResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UnavailabilityResponseImpl(
      id: (json['id'] as num).toInt(),
      dateDebut: json['dateDebut'] as String,
      dateFin: json['dateFin'] as String,
      motif: json['motif'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$UnavailabilityResponseImplToJson(
        _$UnavailabilityResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateDebut': instance.dateDebut,
      'dateFin': instance.dateFin,
      'motif': instance.motif,
      'description': instance.description,
    };

_$UnavailabilityRequestImpl _$$UnavailabilityRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UnavailabilityRequestImpl(
      dateDebut: json['dateDebut'] as String,
      dateFin: json['dateFin'] as String,
      motif: $enumDecode(_$UnavailabilityTypeEnumMap, json['motif']),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$UnavailabilityRequestImplToJson(
        _$UnavailabilityRequestImpl instance) =>
    <String, dynamic>{
      'dateDebut': instance.dateDebut,
      'dateFin': instance.dateFin,
      'motif': _$UnavailabilityTypeEnumMap[instance.motif]!,
      'description': instance.description,
    };

const _$UnavailabilityTypeEnumMap = {
  UnavailabilityType.CONGE: 'CONGE',
  UnavailabilityType.PAUSE: 'PAUSE',
  UnavailabilityType.FORMATION: 'FORMATION',
  UnavailabilityType.AUTRE: 'AUTRE',
};

_$UserSummaryImpl _$$UserSummaryImplFromJson(Map<String, dynamic> json) =>
    _$UserSummaryImpl(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$UserSummaryImplToJson(_$UserSummaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
    };

_$AppointmentServiceRefImpl _$$AppointmentServiceRefImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentServiceRefImpl(
      id: (json['id'] as num).toInt(),
      nom: json['nom'] as String,
      duree: (json['duree'] as num).toInt(),
      prix: (json['prix'] as num).toDouble(),
    );

Map<String, dynamic> _$$AppointmentServiceRefImplToJson(
        _$AppointmentServiceRefImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'duree': instance.duree,
      'prix': instance.prix,
    };

_$AppointmentPrestataireRefImpl _$$AppointmentPrestataireRefImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentPrestataireRefImpl(
      id: (json['id'] as num).toInt(),
      businessName: json['businessName'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      photoUrl: json['photoUrl'] as String?,
      ville: json['ville'] as String?,
    );

Map<String, dynamic> _$$AppointmentPrestataireRefImplToJson(
        _$AppointmentPrestataireRefImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'businessName': instance.businessName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'photoUrl': instance.photoUrl,
      'ville': instance.ville,
    };

_$AppointmentResponseImpl _$$AppointmentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentResponseImpl(
      id: (json['id'] as num).toInt(),
      client: UserSummary.fromJson(json['client'] as Map<String, dynamic>),
      prestataire: AppointmentPrestataireRef.fromJson(
          json['prestataire'] as Map<String, dynamic>),
      service: AppointmentServiceRef.fromJson(
          json['service'] as Map<String, dynamic>),
      dateHeureDebut: json['dateHeureDebut'] as String,
      dateHeureFin: json['dateHeureFin'] as String,
      status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
      noteClient: json['noteClient'] as String?,
      notePrestataire: json['notePrestataire'] as String?,
      motifRefus: json['motifRefus'] as String?,
      motifAnnulation: json['motifAnnulation'] as String?,
      dateConfirmation: json['dateConfirmation'] as String?,
      dateAnnulation: json['dateAnnulation'] as String?,
    );

Map<String, dynamic> _$$AppointmentResponseImplToJson(
        _$AppointmentResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client': instance.client,
      'prestataire': instance.prestataire,
      'service': instance.service,
      'dateHeureDebut': instance.dateHeureDebut,
      'dateHeureFin': instance.dateHeureFin,
      'status': _$AppointmentStatusEnumMap[instance.status]!,
      'noteClient': instance.noteClient,
      'notePrestataire': instance.notePrestataire,
      'motifRefus': instance.motifRefus,
      'motifAnnulation': instance.motifAnnulation,
      'dateConfirmation': instance.dateConfirmation,
      'dateAnnulation': instance.dateAnnulation,
    };

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.EN_ATTENTE: 'EN_ATTENTE',
  AppointmentStatus.CONFIRME: 'CONFIRME',
  AppointmentStatus.ANNULE_CLIENT: 'ANNULE_CLIENT',
  AppointmentStatus.ANNULE_PRESTATAIRE: 'ANNULE_PRESTATAIRE',
  AppointmentStatus.HONORE: 'HONORE',
  AppointmentStatus.ABSENT: 'ABSENT',
};

_$PrestataireDashboardStatsImpl _$$PrestataireDashboardStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$PrestataireDashboardStatsImpl(
      totalAppointments: (json['totalAppointments'] as num).toInt(),
      pendingAppointments: (json['pendingAppointments'] as num).toInt(),
      completedAppointments: (json['completedAppointments'] as num).toInt(),
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      currentRating: (json['currentRating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PrestataireDashboardStatsImplToJson(
        _$PrestataireDashboardStatsImpl instance) =>
    <String, dynamic>{
      'totalAppointments': instance.totalAppointments,
      'pendingAppointments': instance.pendingAppointments,
      'completedAppointments': instance.completedAppointments,
      'totalRevenue': instance.totalRevenue,
      'currentRating': instance.currentRating,
    };

_$UpdateProfileRequestImpl _$$UpdateProfileRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateProfileRequestImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$UpdateProfileRequestImplToJson(
        _$UpdateProfileRequestImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
    };

_$ChangePasswordRequestImpl _$$ChangePasswordRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangePasswordRequestImpl(
      currentPassword: json['currentPassword'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$$ChangePasswordRequestImplToJson(
        _$ChangePasswordRequestImpl instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
    };
