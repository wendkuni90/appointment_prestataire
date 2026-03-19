// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  UserStatus get status => throw _privateConstructorUsedError;
  int? get prestataireId => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String email,
      String firstName,
      String lastName,
      String phone,
      UserRole role,
      UserStatus status,
      int? prestataireId});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? role = null,
    Object? status = null,
    Object? prestataireId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      prestataireId: freezed == prestataireId
          ? _value.prestataireId
          : prestataireId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String firstName,
      String lastName,
      String phone,
      UserRole role,
      UserStatus status,
      int? prestataireId});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? role = null,
    Object? status = null,
    Object? prestataireId = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      prestataireId: freezed == prestataireId
          ? _value.prestataireId
          : prestataireId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.role,
      required this.status,
      this.prestataireId});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phone;
  @override
  final UserRole role;
  @override
  final UserStatus status;
  @override
  final int? prestataireId;

  @override
  String toString() {
    return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, role: $role, status: $status, prestataireId: $prestataireId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.prestataireId, prestataireId) ||
                other.prestataireId == prestataireId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, firstName, lastName,
      phone, role, status, prestataireId);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final int id,
      required final String email,
      required final String firstName,
      required final String lastName,
      required final String phone,
      required final UserRole role,
      required final UserStatus status,
      final int? prestataireId}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get phone;
  @override
  UserRole get role;
  @override
  UserStatus get status;
  @override
  int? get prestataireId;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
          LoginRequest value, $Res Function(LoginRequest) then) =
      _$LoginRequestCopyWithImpl<$Res, LoginRequest>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res, $Val extends LoginRequest>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginRequestImplCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$$LoginRequestImplCopyWith(
          _$LoginRequestImpl value, $Res Function(_$LoginRequestImpl) then) =
      __$$LoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginRequestImplCopyWithImpl<$Res>
    extends _$LoginRequestCopyWithImpl<$Res, _$LoginRequestImpl>
    implements _$$LoginRequestImplCopyWith<$Res> {
  __$$LoginRequestImplCopyWithImpl(
      _$LoginRequestImpl _value, $Res Function(_$LoginRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LoginRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestImpl implements _LoginRequest {
  const _$LoginRequestImpl({required this.email, required this.password});

  factory _$LoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginRequest(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      __$$LoginRequestImplCopyWithImpl<_$LoginRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestImplToJson(
      this,
    );
  }
}

abstract class _LoginRequest implements LoginRequest {
  const factory _LoginRequest(
      {required final String email,
      required final String password}) = _$LoginRequestImpl;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$LoginRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) {
  return _RegisterRequest.fromJson(json);
}

/// @nodoc
mixin _$RegisterRequest {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  /// Serializes this RegisterRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterRequestCopyWith<RegisterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterRequestCopyWith<$Res> {
  factory $RegisterRequestCopyWith(
          RegisterRequest value, $Res Function(RegisterRequest) then) =
      _$RegisterRequestCopyWithImpl<$Res, RegisterRequest>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      String phone,
      String role});
}

/// @nodoc
class _$RegisterRequestCopyWithImpl<$Res, $Val extends RegisterRequest>
    implements $RegisterRequestCopyWith<$Res> {
  _$RegisterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? phone = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterRequestImplCopyWith<$Res>
    implements $RegisterRequestCopyWith<$Res> {
  factory _$$RegisterRequestImplCopyWith(_$RegisterRequestImpl value,
          $Res Function(_$RegisterRequestImpl) then) =
      __$$RegisterRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      String phone,
      String role});
}

/// @nodoc
class __$$RegisterRequestImplCopyWithImpl<$Res>
    extends _$RegisterRequestCopyWithImpl<$Res, _$RegisterRequestImpl>
    implements _$$RegisterRequestImplCopyWith<$Res> {
  __$$RegisterRequestImplCopyWithImpl(
      _$RegisterRequestImpl _value, $Res Function(_$RegisterRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? phone = null,
    Object? role = null,
  }) {
    return _then(_$RegisterRequestImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterRequestImpl implements _RegisterRequest {
  const _$RegisterRequestImpl(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.phone,
      this.role = 'PRESTATAIRE'});

  factory _$RegisterRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterRequestImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String phone;
  @override
  @JsonKey()
  final String role;

  @override
  String toString() {
    return 'RegisterRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, phone: $phone, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, firstName, lastName, email, password, phone, role);

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestImplCopyWith<_$RegisterRequestImpl> get copyWith =>
      __$$RegisterRequestImplCopyWithImpl<_$RegisterRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterRequestImplToJson(
      this,
    );
  }
}

abstract class _RegisterRequest implements RegisterRequest {
  const factory _RegisterRequest(
      {required final String firstName,
      required final String lastName,
      required final String email,
      required final String password,
      required final String phone,
      final String role}) = _$RegisterRequestImpl;

  factory _RegisterRequest.fromJson(Map<String, dynamic> json) =
      _$RegisterRequestImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get password;
  @override
  String get phone;
  @override
  String get role;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterRequestImplCopyWith<_$RegisterRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegisterPrestataireRequest _$RegisterPrestataireRequestFromJson(
    Map<String, dynamic> json) {
  return _RegisterPrestataireRequest.fromJson(json);
}

/// @nodoc
mixin _$RegisterPrestataireRequest {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get businessName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;

  /// Serializes this RegisterPrestataireRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterPrestataireRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterPrestataireRequestCopyWith<RegisterPrestataireRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPrestataireRequestCopyWith<$Res> {
  factory $RegisterPrestataireRequestCopyWith(RegisterPrestataireRequest value,
          $Res Function(RegisterPrestataireRequest) then) =
      _$RegisterPrestataireRequestCopyWithImpl<$Res,
          RegisterPrestataireRequest>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      String phone,
      String businessName,
      String description,
      int categoryId});
}

/// @nodoc
class _$RegisterPrestataireRequestCopyWithImpl<$Res,
        $Val extends RegisterPrestataireRequest>
    implements $RegisterPrestataireRequestCopyWith<$Res> {
  _$RegisterPrestataireRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterPrestataireRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? phone = null,
    Object? businessName = null,
    Object? description = null,
    Object? categoryId = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterPrestataireRequestImplCopyWith<$Res>
    implements $RegisterPrestataireRequestCopyWith<$Res> {
  factory _$$RegisterPrestataireRequestImplCopyWith(
          _$RegisterPrestataireRequestImpl value,
          $Res Function(_$RegisterPrestataireRequestImpl) then) =
      __$$RegisterPrestataireRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      String phone,
      String businessName,
      String description,
      int categoryId});
}

/// @nodoc
class __$$RegisterPrestataireRequestImplCopyWithImpl<$Res>
    extends _$RegisterPrestataireRequestCopyWithImpl<$Res,
        _$RegisterPrestataireRequestImpl>
    implements _$$RegisterPrestataireRequestImplCopyWith<$Res> {
  __$$RegisterPrestataireRequestImplCopyWithImpl(
      _$RegisterPrestataireRequestImpl _value,
      $Res Function(_$RegisterPrestataireRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterPrestataireRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? phone = null,
    Object? businessName = null,
    Object? description = null,
    Object? categoryId = null,
  }) {
    return _then(_$RegisterPrestataireRequestImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterPrestataireRequestImpl implements _RegisterPrestataireRequest {
  const _$RegisterPrestataireRequestImpl(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.phone,
      required this.businessName,
      required this.description,
      required this.categoryId});

  factory _$RegisterPrestataireRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RegisterPrestataireRequestImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String phone;
  @override
  final String businessName;
  @override
  final String description;
  @override
  final int categoryId;

  @override
  String toString() {
    return 'RegisterPrestataireRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, phone: $phone, businessName: $businessName, description: $description, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterPrestataireRequestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email,
      password, phone, businessName, description, categoryId);

  /// Create a copy of RegisterPrestataireRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterPrestataireRequestImplCopyWith<_$RegisterPrestataireRequestImpl>
      get copyWith => __$$RegisterPrestataireRequestImplCopyWithImpl<
          _$RegisterPrestataireRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterPrestataireRequestImplToJson(
      this,
    );
  }
}

abstract class _RegisterPrestataireRequest
    implements RegisterPrestataireRequest {
  const factory _RegisterPrestataireRequest(
      {required final String firstName,
      required final String lastName,
      required final String email,
      required final String password,
      required final String phone,
      required final String businessName,
      required final String description,
      required final int categoryId}) = _$RegisterPrestataireRequestImpl;

  factory _RegisterPrestataireRequest.fromJson(Map<String, dynamic> json) =
      _$RegisterPrestataireRequestImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get password;
  @override
  String get phone;
  @override
  String get businessName;
  @override
  String get description;
  @override
  int get categoryId;

  /// Create a copy of RegisterPrestataireRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterPrestataireRequestImplCopyWith<_$RegisterPrestataireRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) {
  return _CategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryResponse {
  int get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;

  /// Serializes this CategoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryResponseCopyWith<CategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryResponseCopyWith<$Res> {
  factory $CategoryResponseCopyWith(
          CategoryResponse value, $Res Function(CategoryResponse) then) =
      _$CategoryResponseCopyWithImpl<$Res, CategoryResponse>;
  @useResult
  $Res call({int id, String nom, String? description, String? iconUrl});
}

/// @nodoc
class _$CategoryResponseCopyWithImpl<$Res, $Val extends CategoryResponse>
    implements $CategoryResponseCopyWith<$Res> {
  _$CategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? description = freezed,
    Object? iconUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryResponseImplCopyWith<$Res>
    implements $CategoryResponseCopyWith<$Res> {
  factory _$$CategoryResponseImplCopyWith(_$CategoryResponseImpl value,
          $Res Function(_$CategoryResponseImpl) then) =
      __$$CategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String nom, String? description, String? iconUrl});
}

/// @nodoc
class __$$CategoryResponseImplCopyWithImpl<$Res>
    extends _$CategoryResponseCopyWithImpl<$Res, _$CategoryResponseImpl>
    implements _$$CategoryResponseImplCopyWith<$Res> {
  __$$CategoryResponseImplCopyWithImpl(_$CategoryResponseImpl _value,
      $Res Function(_$CategoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? description = freezed,
    Object? iconUrl = freezed,
  }) {
    return _then(_$CategoryResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryResponseImpl implements _CategoryResponse {
  const _$CategoryResponseImpl(
      {required this.id, required this.nom, this.description, this.iconUrl});

  factory _$CategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String nom;
  @override
  final String? description;
  @override
  final String? iconUrl;

  @override
  String toString() {
    return 'CategoryResponse(id: $id, nom: $nom, description: $description, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nom, description, iconUrl);

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryResponseImplCopyWith<_$CategoryResponseImpl> get copyWith =>
      __$$CategoryResponseImplCopyWithImpl<_$CategoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _CategoryResponse implements CategoryResponse {
  const factory _CategoryResponse(
      {required final int id,
      required final String nom,
      final String? description,
      final String? iconUrl}) = _$CategoryResponseImpl;

  factory _CategoryResponse.fromJson(Map<String, dynamic> json) =
      _$CategoryResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get nom;
  @override
  String? get description;
  @override
  String? get iconUrl;

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryResponseImplCopyWith<_$CategoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrestataireResponse _$PrestataireResponseFromJson(Map<String, dynamic> json) {
  return _PrestataireResponse.fromJson(json);
}

/// @nodoc
mixin _$PrestataireResponse {
  int get id => throw _privateConstructorUsedError;
  String get businessName => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get description =>
      throw _privateConstructorUsedError; // champ réel du backend
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get justificatifUrl => throw _privateConstructorUsedError;
  CategoryResponse? get category => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  int? get reviewCount => throw _privateConstructorUsedError;

  /// Serializes this PrestataireResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrestataireResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrestataireResponseCopyWith<PrestataireResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrestataireResponseCopyWith<$Res> {
  factory $PrestataireResponseCopyWith(
          PrestataireResponse value, $Res Function(PrestataireResponse) then) =
      _$PrestataireResponseCopyWithImpl<$Res, PrestataireResponse>;
  @useResult
  $Res call(
      {int id,
      String businessName,
      String firstName,
      String lastName,
      String? email,
      String? phone,
      String status,
      String? description,
      String? photoUrl,
      String? justificatifUrl,
      CategoryResponse? category,
      double? rating,
      int? reviewCount});

  $CategoryResponseCopyWith<$Res>? get category;
}

/// @nodoc
class _$PrestataireResponseCopyWithImpl<$Res, $Val extends PrestataireResponse>
    implements $PrestataireResponseCopyWith<$Res> {
  _$PrestataireResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrestataireResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? businessName = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? status = null,
    Object? description = freezed,
    Object? photoUrl = freezed,
    Object? justificatifUrl = freezed,
    Object? category = freezed,
    Object? rating = freezed,
    Object? reviewCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      justificatifUrl: freezed == justificatifUrl
          ? _value.justificatifUrl
          : justificatifUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryResponse?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      reviewCount: freezed == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of PrestataireResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryResponseCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryResponseCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrestataireResponseImplCopyWith<$Res>
    implements $PrestataireResponseCopyWith<$Res> {
  factory _$$PrestataireResponseImplCopyWith(_$PrestataireResponseImpl value,
          $Res Function(_$PrestataireResponseImpl) then) =
      __$$PrestataireResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String businessName,
      String firstName,
      String lastName,
      String? email,
      String? phone,
      String status,
      String? description,
      String? photoUrl,
      String? justificatifUrl,
      CategoryResponse? category,
      double? rating,
      int? reviewCount});

  @override
  $CategoryResponseCopyWith<$Res>? get category;
}

/// @nodoc
class __$$PrestataireResponseImplCopyWithImpl<$Res>
    extends _$PrestataireResponseCopyWithImpl<$Res, _$PrestataireResponseImpl>
    implements _$$PrestataireResponseImplCopyWith<$Res> {
  __$$PrestataireResponseImplCopyWithImpl(_$PrestataireResponseImpl _value,
      $Res Function(_$PrestataireResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrestataireResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? businessName = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? status = null,
    Object? description = freezed,
    Object? photoUrl = freezed,
    Object? justificatifUrl = freezed,
    Object? category = freezed,
    Object? rating = freezed,
    Object? reviewCount = freezed,
  }) {
    return _then(_$PrestataireResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      justificatifUrl: freezed == justificatifUrl
          ? _value.justificatifUrl
          : justificatifUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryResponse?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      reviewCount: freezed == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrestataireResponseImpl implements _PrestataireResponse {
  const _$PrestataireResponseImpl(
      {required this.id,
      required this.businessName,
      required this.firstName,
      required this.lastName,
      this.email,
      this.phone,
      required this.status,
      this.description,
      this.photoUrl,
      this.justificatifUrl,
      this.category,
      this.rating,
      this.reviewCount});

  factory _$PrestataireResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrestataireResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String businessName;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String status;
  @override
  final String? description;
// champ réel du backend
  @override
  final String? photoUrl;
  @override
  final String? justificatifUrl;
  @override
  final CategoryResponse? category;
  @override
  final double? rating;
  @override
  final int? reviewCount;

  @override
  String toString() {
    return 'PrestataireResponse(id: $id, businessName: $businessName, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, status: $status, description: $description, photoUrl: $photoUrl, justificatifUrl: $justificatifUrl, category: $category, rating: $rating, reviewCount: $reviewCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrestataireResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.justificatifUrl, justificatifUrl) ||
                other.justificatifUrl == justificatifUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      businessName,
      firstName,
      lastName,
      email,
      phone,
      status,
      description,
      photoUrl,
      justificatifUrl,
      category,
      rating,
      reviewCount);

  /// Create a copy of PrestataireResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrestataireResponseImplCopyWith<_$PrestataireResponseImpl> get copyWith =>
      __$$PrestataireResponseImplCopyWithImpl<_$PrestataireResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrestataireResponseImplToJson(
      this,
    );
  }
}

abstract class _PrestataireResponse implements PrestataireResponse {
  const factory _PrestataireResponse(
      {required final int id,
      required final String businessName,
      required final String firstName,
      required final String lastName,
      final String? email,
      final String? phone,
      required final String status,
      final String? description,
      final String? photoUrl,
      final String? justificatifUrl,
      final CategoryResponse? category,
      final double? rating,
      final int? reviewCount}) = _$PrestataireResponseImpl;

  factory _PrestataireResponse.fromJson(Map<String, dynamic> json) =
      _$PrestataireResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get businessName;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String get status;
  @override
  String? get description; // champ réel du backend
  @override
  String? get photoUrl;
  @override
  String? get justificatifUrl;
  @override
  CategoryResponse? get category;
  @override
  double? get rating;
  @override
  int? get reviewCount;

  /// Create a copy of PrestataireResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrestataireResponseImplCopyWith<_$PrestataireResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrestataireProfileRequest _$PrestataireProfileRequestFromJson(
    Map<String, dynamic> json) {
  return _PrestataireProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$PrestataireProfileRequest {
  String get businessName => throw _privateConstructorUsedError;
  String? get description =>
      throw _privateConstructorUsedError; // correspond au champ "description" du backend
  int? get categoryId => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  /// Serializes this PrestataireProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrestataireProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrestataireProfileRequestCopyWith<PrestataireProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrestataireProfileRequestCopyWith<$Res> {
  factory $PrestataireProfileRequestCopyWith(PrestataireProfileRequest value,
          $Res Function(PrestataireProfileRequest) then) =
      _$PrestataireProfileRequestCopyWithImpl<$Res, PrestataireProfileRequest>;
  @useResult
  $Res call(
      {String businessName,
      String? description,
      int? categoryId,
      String? photoUrl});
}

/// @nodoc
class _$PrestataireProfileRequestCopyWithImpl<$Res,
        $Val extends PrestataireProfileRequest>
    implements $PrestataireProfileRequestCopyWith<$Res> {
  _$PrestataireProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrestataireProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessName = null,
    Object? description = freezed,
    Object? categoryId = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrestataireProfileRequestImplCopyWith<$Res>
    implements $PrestataireProfileRequestCopyWith<$Res> {
  factory _$$PrestataireProfileRequestImplCopyWith(
          _$PrestataireProfileRequestImpl value,
          $Res Function(_$PrestataireProfileRequestImpl) then) =
      __$$PrestataireProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String businessName,
      String? description,
      int? categoryId,
      String? photoUrl});
}

/// @nodoc
class __$$PrestataireProfileRequestImplCopyWithImpl<$Res>
    extends _$PrestataireProfileRequestCopyWithImpl<$Res,
        _$PrestataireProfileRequestImpl>
    implements _$$PrestataireProfileRequestImplCopyWith<$Res> {
  __$$PrestataireProfileRequestImplCopyWithImpl(
      _$PrestataireProfileRequestImpl _value,
      $Res Function(_$PrestataireProfileRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrestataireProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessName = null,
    Object? description = freezed,
    Object? categoryId = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_$PrestataireProfileRequestImpl(
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrestataireProfileRequestImpl implements _PrestataireProfileRequest {
  const _$PrestataireProfileRequestImpl(
      {required this.businessName,
      this.description,
      this.categoryId,
      this.photoUrl});

  factory _$PrestataireProfileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrestataireProfileRequestImplFromJson(json);

  @override
  final String businessName;
  @override
  final String? description;
// correspond au champ "description" du backend
  @override
  final int? categoryId;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'PrestataireProfileRequest(businessName: $businessName, description: $description, categoryId: $categoryId, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrestataireProfileRequestImpl &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, businessName, description, categoryId, photoUrl);

  /// Create a copy of PrestataireProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrestataireProfileRequestImplCopyWith<_$PrestataireProfileRequestImpl>
      get copyWith => __$$PrestataireProfileRequestImplCopyWithImpl<
          _$PrestataireProfileRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrestataireProfileRequestImplToJson(
      this,
    );
  }
}

abstract class _PrestataireProfileRequest implements PrestataireProfileRequest {
  const factory _PrestataireProfileRequest(
      {required final String businessName,
      final String? description,
      final int? categoryId,
      final String? photoUrl}) = _$PrestataireProfileRequestImpl;

  factory _PrestataireProfileRequest.fromJson(Map<String, dynamic> json) =
      _$PrestataireProfileRequestImpl.fromJson;

  @override
  String get businessName;
  @override
  String? get description; // correspond au champ "description" du backend
  @override
  int? get categoryId;
  @override
  String? get photoUrl;

  /// Create a copy of PrestataireProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrestataireProfileRequestImplCopyWith<_$PrestataireProfileRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServiceResponse _$ServiceResponseFromJson(Map<String, dynamic> json) {
  return _ServiceResponse.fromJson(json);
}

/// @nodoc
mixin _$ServiceResponse {
  int get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get duree => throw _privateConstructorUsedError;
  double get prix => throw _privateConstructorUsedError;
  bool get actif => throw _privateConstructorUsedError;

  /// Serializes this ServiceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceResponseCopyWith<ServiceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceResponseCopyWith<$Res> {
  factory $ServiceResponseCopyWith(
          ServiceResponse value, $Res Function(ServiceResponse) then) =
      _$ServiceResponseCopyWithImpl<$Res, ServiceResponse>;
  @useResult
  $Res call(
      {int id,
      String nom,
      String? description,
      int duree,
      double prix,
      bool actif});
}

/// @nodoc
class _$ServiceResponseCopyWithImpl<$Res, $Val extends ServiceResponse>
    implements $ServiceResponseCopyWith<$Res> {
  _$ServiceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? description = freezed,
    Object? duree = null,
    Object? prix = null,
    Object? actif = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      duree: null == duree
          ? _value.duree
          : duree // ignore: cast_nullable_to_non_nullable
              as int,
      prix: null == prix
          ? _value.prix
          : prix // ignore: cast_nullable_to_non_nullable
              as double,
      actif: null == actif
          ? _value.actif
          : actif // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceResponseImplCopyWith<$Res>
    implements $ServiceResponseCopyWith<$Res> {
  factory _$$ServiceResponseImplCopyWith(_$ServiceResponseImpl value,
          $Res Function(_$ServiceResponseImpl) then) =
      __$$ServiceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nom,
      String? description,
      int duree,
      double prix,
      bool actif});
}

/// @nodoc
class __$$ServiceResponseImplCopyWithImpl<$Res>
    extends _$ServiceResponseCopyWithImpl<$Res, _$ServiceResponseImpl>
    implements _$$ServiceResponseImplCopyWith<$Res> {
  __$$ServiceResponseImplCopyWithImpl(
      _$ServiceResponseImpl _value, $Res Function(_$ServiceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? description = freezed,
    Object? duree = null,
    Object? prix = null,
    Object? actif = null,
  }) {
    return _then(_$ServiceResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      duree: null == duree
          ? _value.duree
          : duree // ignore: cast_nullable_to_non_nullable
              as int,
      prix: null == prix
          ? _value.prix
          : prix // ignore: cast_nullable_to_non_nullable
              as double,
      actif: null == actif
          ? _value.actif
          : actif // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceResponseImpl implements _ServiceResponse {
  const _$ServiceResponseImpl(
      {required this.id,
      required this.nom,
      this.description,
      required this.duree,
      required this.prix,
      required this.actif});

  factory _$ServiceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String nom;
  @override
  final String? description;
  @override
  final int duree;
  @override
  final double prix;
  @override
  final bool actif;

  @override
  String toString() {
    return 'ServiceResponse(id: $id, nom: $nom, description: $description, duree: $duree, prix: $prix, actif: $actif)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.duree, duree) || other.duree == duree) &&
            (identical(other.prix, prix) || other.prix == prix) &&
            (identical(other.actif, actif) || other.actif == actif));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nom, description, duree, prix, actif);

  /// Create a copy of ServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceResponseImplCopyWith<_$ServiceResponseImpl> get copyWith =>
      __$$ServiceResponseImplCopyWithImpl<_$ServiceResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceResponseImplToJson(
      this,
    );
  }
}

abstract class _ServiceResponse implements ServiceResponse {
  const factory _ServiceResponse(
      {required final int id,
      required final String nom,
      final String? description,
      required final int duree,
      required final double prix,
      required final bool actif}) = _$ServiceResponseImpl;

  factory _ServiceResponse.fromJson(Map<String, dynamic> json) =
      _$ServiceResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get nom;
  @override
  String? get description;
  @override
  int get duree;
  @override
  double get prix;
  @override
  bool get actif;

  /// Create a copy of ServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceResponseImplCopyWith<_$ServiceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceRequest _$ServiceRequestFromJson(Map<String, dynamic> json) {
  return _ServiceRequest.fromJson(json);
}

/// @nodoc
mixin _$ServiceRequest {
  String get nom => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get duree => throw _privateConstructorUsedError;
  double get prix => throw _privateConstructorUsedError;
  bool get actif => throw _privateConstructorUsedError;

  /// Serializes this ServiceRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceRequestCopyWith<ServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestCopyWith<$Res> {
  factory $ServiceRequestCopyWith(
          ServiceRequest value, $Res Function(ServiceRequest) then) =
      _$ServiceRequestCopyWithImpl<$Res, ServiceRequest>;
  @useResult
  $Res call(
      {String nom, String? description, int duree, double prix, bool actif});
}

/// @nodoc
class _$ServiceRequestCopyWithImpl<$Res, $Val extends ServiceRequest>
    implements $ServiceRequestCopyWith<$Res> {
  _$ServiceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nom = null,
    Object? description = freezed,
    Object? duree = null,
    Object? prix = null,
    Object? actif = null,
  }) {
    return _then(_value.copyWith(
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      duree: null == duree
          ? _value.duree
          : duree // ignore: cast_nullable_to_non_nullable
              as int,
      prix: null == prix
          ? _value.prix
          : prix // ignore: cast_nullable_to_non_nullable
              as double,
      actif: null == actif
          ? _value.actif
          : actif // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceRequestImplCopyWith<$Res>
    implements $ServiceRequestCopyWith<$Res> {
  factory _$$ServiceRequestImplCopyWith(_$ServiceRequestImpl value,
          $Res Function(_$ServiceRequestImpl) then) =
      __$$ServiceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nom, String? description, int duree, double prix, bool actif});
}

/// @nodoc
class __$$ServiceRequestImplCopyWithImpl<$Res>
    extends _$ServiceRequestCopyWithImpl<$Res, _$ServiceRequestImpl>
    implements _$$ServiceRequestImplCopyWith<$Res> {
  __$$ServiceRequestImplCopyWithImpl(
      _$ServiceRequestImpl _value, $Res Function(_$ServiceRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nom = null,
    Object? description = freezed,
    Object? duree = null,
    Object? prix = null,
    Object? actif = null,
  }) {
    return _then(_$ServiceRequestImpl(
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      duree: null == duree
          ? _value.duree
          : duree // ignore: cast_nullable_to_non_nullable
              as int,
      prix: null == prix
          ? _value.prix
          : prix // ignore: cast_nullable_to_non_nullable
              as double,
      actif: null == actif
          ? _value.actif
          : actif // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceRequestImpl implements _ServiceRequest {
  const _$ServiceRequestImpl(
      {required this.nom,
      this.description,
      required this.duree,
      required this.prix,
      this.actif = true});

  factory _$ServiceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceRequestImplFromJson(json);

  @override
  final String nom;
  @override
  final String? description;
  @override
  final int duree;
  @override
  final double prix;
  @override
  @JsonKey()
  final bool actif;

  @override
  String toString() {
    return 'ServiceRequest(nom: $nom, description: $description, duree: $duree, prix: $prix, actif: $actif)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceRequestImpl &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.duree, duree) || other.duree == duree) &&
            (identical(other.prix, prix) || other.prix == prix) &&
            (identical(other.actif, actif) || other.actif == actif));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nom, description, duree, prix, actif);

  /// Create a copy of ServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceRequestImplCopyWith<_$ServiceRequestImpl> get copyWith =>
      __$$ServiceRequestImplCopyWithImpl<_$ServiceRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceRequestImplToJson(
      this,
    );
  }
}

abstract class _ServiceRequest implements ServiceRequest {
  const factory _ServiceRequest(
      {required final String nom,
      final String? description,
      required final int duree,
      required final double prix,
      final bool actif}) = _$ServiceRequestImpl;

  factory _ServiceRequest.fromJson(Map<String, dynamic> json) =
      _$ServiceRequestImpl.fromJson;

  @override
  String get nom;
  @override
  String? get description;
  @override
  int get duree;
  @override
  double get prix;
  @override
  bool get actif;

  /// Create a copy of ServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceRequestImplCopyWith<_$ServiceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AvailabilityDto _$AvailabilityDtoFromJson(Map<String, dynamic> json) {
  return _AvailabilityDto.fromJson(json);
}

/// @nodoc
mixin _$AvailabilityDto {
  int? get id => throw _privateConstructorUsedError;
  String get jour =>
      throw _privateConstructorUsedError; // "MONDAY", "TUESDAY", ...
  bool get travaille => throw _privateConstructorUsedError;
  String? get heureDebutMatin =>
      throw _privateConstructorUsedError; // "09:00:00"
  String? get heureFinMatin => throw _privateConstructorUsedError;
  String? get heureDebutApresMidi => throw _privateConstructorUsedError;
  String? get heureFinApresMidi => throw _privateConstructorUsedError;

  /// Serializes this AvailabilityDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailabilityDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailabilityDtoCopyWith<AvailabilityDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityDtoCopyWith<$Res> {
  factory $AvailabilityDtoCopyWith(
          AvailabilityDto value, $Res Function(AvailabilityDto) then) =
      _$AvailabilityDtoCopyWithImpl<$Res, AvailabilityDto>;
  @useResult
  $Res call(
      {int? id,
      String jour,
      bool travaille,
      String? heureDebutMatin,
      String? heureFinMatin,
      String? heureDebutApresMidi,
      String? heureFinApresMidi});
}

/// @nodoc
class _$AvailabilityDtoCopyWithImpl<$Res, $Val extends AvailabilityDto>
    implements $AvailabilityDtoCopyWith<$Res> {
  _$AvailabilityDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailabilityDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? jour = null,
    Object? travaille = null,
    Object? heureDebutMatin = freezed,
    Object? heureFinMatin = freezed,
    Object? heureDebutApresMidi = freezed,
    Object? heureFinApresMidi = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      jour: null == jour
          ? _value.jour
          : jour // ignore: cast_nullable_to_non_nullable
              as String,
      travaille: null == travaille
          ? _value.travaille
          : travaille // ignore: cast_nullable_to_non_nullable
              as bool,
      heureDebutMatin: freezed == heureDebutMatin
          ? _value.heureDebutMatin
          : heureDebutMatin // ignore: cast_nullable_to_non_nullable
              as String?,
      heureFinMatin: freezed == heureFinMatin
          ? _value.heureFinMatin
          : heureFinMatin // ignore: cast_nullable_to_non_nullable
              as String?,
      heureDebutApresMidi: freezed == heureDebutApresMidi
          ? _value.heureDebutApresMidi
          : heureDebutApresMidi // ignore: cast_nullable_to_non_nullable
              as String?,
      heureFinApresMidi: freezed == heureFinApresMidi
          ? _value.heureFinApresMidi
          : heureFinApresMidi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailabilityDtoImplCopyWith<$Res>
    implements $AvailabilityDtoCopyWith<$Res> {
  factory _$$AvailabilityDtoImplCopyWith(_$AvailabilityDtoImpl value,
          $Res Function(_$AvailabilityDtoImpl) then) =
      __$$AvailabilityDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String jour,
      bool travaille,
      String? heureDebutMatin,
      String? heureFinMatin,
      String? heureDebutApresMidi,
      String? heureFinApresMidi});
}

/// @nodoc
class __$$AvailabilityDtoImplCopyWithImpl<$Res>
    extends _$AvailabilityDtoCopyWithImpl<$Res, _$AvailabilityDtoImpl>
    implements _$$AvailabilityDtoImplCopyWith<$Res> {
  __$$AvailabilityDtoImplCopyWithImpl(
      _$AvailabilityDtoImpl _value, $Res Function(_$AvailabilityDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvailabilityDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? jour = null,
    Object? travaille = null,
    Object? heureDebutMatin = freezed,
    Object? heureFinMatin = freezed,
    Object? heureDebutApresMidi = freezed,
    Object? heureFinApresMidi = freezed,
  }) {
    return _then(_$AvailabilityDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      jour: null == jour
          ? _value.jour
          : jour // ignore: cast_nullable_to_non_nullable
              as String,
      travaille: null == travaille
          ? _value.travaille
          : travaille // ignore: cast_nullable_to_non_nullable
              as bool,
      heureDebutMatin: freezed == heureDebutMatin
          ? _value.heureDebutMatin
          : heureDebutMatin // ignore: cast_nullable_to_non_nullable
              as String?,
      heureFinMatin: freezed == heureFinMatin
          ? _value.heureFinMatin
          : heureFinMatin // ignore: cast_nullable_to_non_nullable
              as String?,
      heureDebutApresMidi: freezed == heureDebutApresMidi
          ? _value.heureDebutApresMidi
          : heureDebutApresMidi // ignore: cast_nullable_to_non_nullable
              as String?,
      heureFinApresMidi: freezed == heureFinApresMidi
          ? _value.heureFinApresMidi
          : heureFinApresMidi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailabilityDtoImpl implements _AvailabilityDto {
  const _$AvailabilityDtoImpl(
      {this.id,
      required this.jour,
      required this.travaille,
      this.heureDebutMatin,
      this.heureFinMatin,
      this.heureDebutApresMidi,
      this.heureFinApresMidi});

  factory _$AvailabilityDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailabilityDtoImplFromJson(json);

  @override
  final int? id;
  @override
  final String jour;
// "MONDAY", "TUESDAY", ...
  @override
  final bool travaille;
  @override
  final String? heureDebutMatin;
// "09:00:00"
  @override
  final String? heureFinMatin;
  @override
  final String? heureDebutApresMidi;
  @override
  final String? heureFinApresMidi;

  @override
  String toString() {
    return 'AvailabilityDto(id: $id, jour: $jour, travaille: $travaille, heureDebutMatin: $heureDebutMatin, heureFinMatin: $heureFinMatin, heureDebutApresMidi: $heureDebutApresMidi, heureFinApresMidi: $heureFinApresMidi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilityDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jour, jour) || other.jour == jour) &&
            (identical(other.travaille, travaille) ||
                other.travaille == travaille) &&
            (identical(other.heureDebutMatin, heureDebutMatin) ||
                other.heureDebutMatin == heureDebutMatin) &&
            (identical(other.heureFinMatin, heureFinMatin) ||
                other.heureFinMatin == heureFinMatin) &&
            (identical(other.heureDebutApresMidi, heureDebutApresMidi) ||
                other.heureDebutApresMidi == heureDebutApresMidi) &&
            (identical(other.heureFinApresMidi, heureFinApresMidi) ||
                other.heureFinApresMidi == heureFinApresMidi));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, jour, travaille,
      heureDebutMatin, heureFinMatin, heureDebutApresMidi, heureFinApresMidi);

  /// Create a copy of AvailabilityDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailabilityDtoImplCopyWith<_$AvailabilityDtoImpl> get copyWith =>
      __$$AvailabilityDtoImplCopyWithImpl<_$AvailabilityDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailabilityDtoImplToJson(
      this,
    );
  }
}

abstract class _AvailabilityDto implements AvailabilityDto {
  const factory _AvailabilityDto(
      {final int? id,
      required final String jour,
      required final bool travaille,
      final String? heureDebutMatin,
      final String? heureFinMatin,
      final String? heureDebutApresMidi,
      final String? heureFinApresMidi}) = _$AvailabilityDtoImpl;

  factory _AvailabilityDto.fromJson(Map<String, dynamic> json) =
      _$AvailabilityDtoImpl.fromJson;

  @override
  int? get id;
  @override
  String get jour; // "MONDAY", "TUESDAY", ...
  @override
  bool get travaille;
  @override
  String? get heureDebutMatin; // "09:00:00"
  @override
  String? get heureFinMatin;
  @override
  String? get heureDebutApresMidi;
  @override
  String? get heureFinApresMidi;

  /// Create a copy of AvailabilityDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailabilityDtoImplCopyWith<_$AvailabilityDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UnavailabilityResponse _$UnavailabilityResponseFromJson(
    Map<String, dynamic> json) {
  return _UnavailabilityResponse.fromJson(json);
}

/// @nodoc
mixin _$UnavailabilityResponse {
  int get id => throw _privateConstructorUsedError;
  String get dateDebut => throw _privateConstructorUsedError; // ISO string
  String get dateFin => throw _privateConstructorUsedError;
  String get motif => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this UnavailabilityResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnavailabilityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnavailabilityResponseCopyWith<UnavailabilityResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnavailabilityResponseCopyWith<$Res> {
  factory $UnavailabilityResponseCopyWith(UnavailabilityResponse value,
          $Res Function(UnavailabilityResponse) then) =
      _$UnavailabilityResponseCopyWithImpl<$Res, UnavailabilityResponse>;
  @useResult
  $Res call(
      {int id,
      String dateDebut,
      String dateFin,
      String motif,
      String? description});
}

/// @nodoc
class _$UnavailabilityResponseCopyWithImpl<$Res,
        $Val extends UnavailabilityResponse>
    implements $UnavailabilityResponseCopyWith<$Res> {
  _$UnavailabilityResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnavailabilityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateDebut = null,
    Object? dateFin = null,
    Object? motif = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateDebut: null == dateDebut
          ? _value.dateDebut
          : dateDebut // ignore: cast_nullable_to_non_nullable
              as String,
      dateFin: null == dateFin
          ? _value.dateFin
          : dateFin // ignore: cast_nullable_to_non_nullable
              as String,
      motif: null == motif
          ? _value.motif
          : motif // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnavailabilityResponseImplCopyWith<$Res>
    implements $UnavailabilityResponseCopyWith<$Res> {
  factory _$$UnavailabilityResponseImplCopyWith(
          _$UnavailabilityResponseImpl value,
          $Res Function(_$UnavailabilityResponseImpl) then) =
      __$$UnavailabilityResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String dateDebut,
      String dateFin,
      String motif,
      String? description});
}

/// @nodoc
class __$$UnavailabilityResponseImplCopyWithImpl<$Res>
    extends _$UnavailabilityResponseCopyWithImpl<$Res,
        _$UnavailabilityResponseImpl>
    implements _$$UnavailabilityResponseImplCopyWith<$Res> {
  __$$UnavailabilityResponseImplCopyWithImpl(
      _$UnavailabilityResponseImpl _value,
      $Res Function(_$UnavailabilityResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnavailabilityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateDebut = null,
    Object? dateFin = null,
    Object? motif = null,
    Object? description = freezed,
  }) {
    return _then(_$UnavailabilityResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dateDebut: null == dateDebut
          ? _value.dateDebut
          : dateDebut // ignore: cast_nullable_to_non_nullable
              as String,
      dateFin: null == dateFin
          ? _value.dateFin
          : dateFin // ignore: cast_nullable_to_non_nullable
              as String,
      motif: null == motif
          ? _value.motif
          : motif // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnavailabilityResponseImpl implements _UnavailabilityResponse {
  const _$UnavailabilityResponseImpl(
      {required this.id,
      required this.dateDebut,
      required this.dateFin,
      required this.motif,
      this.description});

  factory _$UnavailabilityResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnavailabilityResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String dateDebut;
// ISO string
  @override
  final String dateFin;
  @override
  final String motif;
  @override
  final String? description;

  @override
  String toString() {
    return 'UnavailabilityResponse(id: $id, dateDebut: $dateDebut, dateFin: $dateFin, motif: $motif, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnavailabilityResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateDebut, dateDebut) ||
                other.dateDebut == dateDebut) &&
            (identical(other.dateFin, dateFin) || other.dateFin == dateFin) &&
            (identical(other.motif, motif) || other.motif == motif) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, dateDebut, dateFin, motif, description);

  /// Create a copy of UnavailabilityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnavailabilityResponseImplCopyWith<_$UnavailabilityResponseImpl>
      get copyWith => __$$UnavailabilityResponseImplCopyWithImpl<
          _$UnavailabilityResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnavailabilityResponseImplToJson(
      this,
    );
  }
}

abstract class _UnavailabilityResponse implements UnavailabilityResponse {
  const factory _UnavailabilityResponse(
      {required final int id,
      required final String dateDebut,
      required final String dateFin,
      required final String motif,
      final String? description}) = _$UnavailabilityResponseImpl;

  factory _UnavailabilityResponse.fromJson(Map<String, dynamic> json) =
      _$UnavailabilityResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get dateDebut; // ISO string
  @override
  String get dateFin;
  @override
  String get motif;
  @override
  String? get description;

  /// Create a copy of UnavailabilityResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnavailabilityResponseImplCopyWith<_$UnavailabilityResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UnavailabilityRequest _$UnavailabilityRequestFromJson(
    Map<String, dynamic> json) {
  return _UnavailabilityRequest.fromJson(json);
}

/// @nodoc
mixin _$UnavailabilityRequest {
  String get dateDebut => throw _privateConstructorUsedError; // ISO format
  String get dateFin => throw _privateConstructorUsedError;
  UnavailabilityType get motif => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this UnavailabilityRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnavailabilityRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnavailabilityRequestCopyWith<UnavailabilityRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnavailabilityRequestCopyWith<$Res> {
  factory $UnavailabilityRequestCopyWith(UnavailabilityRequest value,
          $Res Function(UnavailabilityRequest) then) =
      _$UnavailabilityRequestCopyWithImpl<$Res, UnavailabilityRequest>;
  @useResult
  $Res call(
      {String dateDebut,
      String dateFin,
      UnavailabilityType motif,
      String? description});
}

/// @nodoc
class _$UnavailabilityRequestCopyWithImpl<$Res,
        $Val extends UnavailabilityRequest>
    implements $UnavailabilityRequestCopyWith<$Res> {
  _$UnavailabilityRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnavailabilityRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateDebut = null,
    Object? dateFin = null,
    Object? motif = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      dateDebut: null == dateDebut
          ? _value.dateDebut
          : dateDebut // ignore: cast_nullable_to_non_nullable
              as String,
      dateFin: null == dateFin
          ? _value.dateFin
          : dateFin // ignore: cast_nullable_to_non_nullable
              as String,
      motif: null == motif
          ? _value.motif
          : motif // ignore: cast_nullable_to_non_nullable
              as UnavailabilityType,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnavailabilityRequestImplCopyWith<$Res>
    implements $UnavailabilityRequestCopyWith<$Res> {
  factory _$$UnavailabilityRequestImplCopyWith(
          _$UnavailabilityRequestImpl value,
          $Res Function(_$UnavailabilityRequestImpl) then) =
      __$$UnavailabilityRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dateDebut,
      String dateFin,
      UnavailabilityType motif,
      String? description});
}

/// @nodoc
class __$$UnavailabilityRequestImplCopyWithImpl<$Res>
    extends _$UnavailabilityRequestCopyWithImpl<$Res,
        _$UnavailabilityRequestImpl>
    implements _$$UnavailabilityRequestImplCopyWith<$Res> {
  __$$UnavailabilityRequestImplCopyWithImpl(_$UnavailabilityRequestImpl _value,
      $Res Function(_$UnavailabilityRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnavailabilityRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateDebut = null,
    Object? dateFin = null,
    Object? motif = null,
    Object? description = freezed,
  }) {
    return _then(_$UnavailabilityRequestImpl(
      dateDebut: null == dateDebut
          ? _value.dateDebut
          : dateDebut // ignore: cast_nullable_to_non_nullable
              as String,
      dateFin: null == dateFin
          ? _value.dateFin
          : dateFin // ignore: cast_nullable_to_non_nullable
              as String,
      motif: null == motif
          ? _value.motif
          : motif // ignore: cast_nullable_to_non_nullable
              as UnavailabilityType,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnavailabilityRequestImpl implements _UnavailabilityRequest {
  const _$UnavailabilityRequestImpl(
      {required this.dateDebut,
      required this.dateFin,
      required this.motif,
      this.description});

  factory _$UnavailabilityRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnavailabilityRequestImplFromJson(json);

  @override
  final String dateDebut;
// ISO format
  @override
  final String dateFin;
  @override
  final UnavailabilityType motif;
  @override
  final String? description;

  @override
  String toString() {
    return 'UnavailabilityRequest(dateDebut: $dateDebut, dateFin: $dateFin, motif: $motif, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnavailabilityRequestImpl &&
            (identical(other.dateDebut, dateDebut) ||
                other.dateDebut == dateDebut) &&
            (identical(other.dateFin, dateFin) || other.dateFin == dateFin) &&
            (identical(other.motif, motif) || other.motif == motif) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dateDebut, dateFin, motif, description);

  /// Create a copy of UnavailabilityRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnavailabilityRequestImplCopyWith<_$UnavailabilityRequestImpl>
      get copyWith => __$$UnavailabilityRequestImplCopyWithImpl<
          _$UnavailabilityRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnavailabilityRequestImplToJson(
      this,
    );
  }
}

abstract class _UnavailabilityRequest implements UnavailabilityRequest {
  const factory _UnavailabilityRequest(
      {required final String dateDebut,
      required final String dateFin,
      required final UnavailabilityType motif,
      final String? description}) = _$UnavailabilityRequestImpl;

  factory _UnavailabilityRequest.fromJson(Map<String, dynamic> json) =
      _$UnavailabilityRequestImpl.fromJson;

  @override
  String get dateDebut; // ISO format
  @override
  String get dateFin;
  @override
  UnavailabilityType get motif;
  @override
  String? get description;

  /// Create a copy of UnavailabilityRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnavailabilityRequestImplCopyWith<_$UnavailabilityRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserSummary _$UserSummaryFromJson(Map<String, dynamic> json) {
  return _UserSummary.fromJson(json);
}

/// @nodoc
mixin _$UserSummary {
  int get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  /// Serializes this UserSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSummaryCopyWith<UserSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSummaryCopyWith<$Res> {
  factory $UserSummaryCopyWith(
          UserSummary value, $Res Function(UserSummary) then) =
      _$UserSummaryCopyWithImpl<$Res, UserSummary>;
  @useResult
  $Res call({int id, String firstName, String lastName, String? phone});
}

/// @nodoc
class _$UserSummaryCopyWithImpl<$Res, $Val extends UserSummary>
    implements $UserSummaryCopyWith<$Res> {
  _$UserSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSummaryImplCopyWith<$Res>
    implements $UserSummaryCopyWith<$Res> {
  factory _$$UserSummaryImplCopyWith(
          _$UserSummaryImpl value, $Res Function(_$UserSummaryImpl) then) =
      __$$UserSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String firstName, String lastName, String? phone});
}

/// @nodoc
class __$$UserSummaryImplCopyWithImpl<$Res>
    extends _$UserSummaryCopyWithImpl<$Res, _$UserSummaryImpl>
    implements _$$UserSummaryImplCopyWith<$Res> {
  __$$UserSummaryImplCopyWithImpl(
      _$UserSummaryImpl _value, $Res Function(_$UserSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = freezed,
  }) {
    return _then(_$UserSummaryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSummaryImpl implements _UserSummary {
  const _$UserSummaryImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.phone});

  factory _$UserSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSummaryImplFromJson(json);

  @override
  final int id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? phone;

  @override
  String toString() {
    return 'UserSummary(id: $id, firstName: $firstName, lastName: $lastName, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, phone);

  /// Create a copy of UserSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSummaryImplCopyWith<_$UserSummaryImpl> get copyWith =>
      __$$UserSummaryImplCopyWithImpl<_$UserSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSummaryImplToJson(
      this,
    );
  }
}

abstract class _UserSummary implements UserSummary {
  const factory _UserSummary(
      {required final int id,
      required final String firstName,
      required final String lastName,
      final String? phone}) = _$UserSummaryImpl;

  factory _UserSummary.fromJson(Map<String, dynamic> json) =
      _$UserSummaryImpl.fromJson;

  @override
  int get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get phone;

  /// Create a copy of UserSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSummaryImplCopyWith<_$UserSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppointmentServiceRef _$AppointmentServiceRefFromJson(
    Map<String, dynamic> json) {
  return _AppointmentServiceRef.fromJson(json);
}

/// @nodoc
mixin _$AppointmentServiceRef {
  int get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  int get duree => throw _privateConstructorUsedError;
  double get prix => throw _privateConstructorUsedError;

  /// Serializes this AppointmentServiceRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentServiceRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentServiceRefCopyWith<AppointmentServiceRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentServiceRefCopyWith<$Res> {
  factory $AppointmentServiceRefCopyWith(AppointmentServiceRef value,
          $Res Function(AppointmentServiceRef) then) =
      _$AppointmentServiceRefCopyWithImpl<$Res, AppointmentServiceRef>;
  @useResult
  $Res call({int id, String nom, int duree, double prix});
}

/// @nodoc
class _$AppointmentServiceRefCopyWithImpl<$Res,
        $Val extends AppointmentServiceRef>
    implements $AppointmentServiceRefCopyWith<$Res> {
  _$AppointmentServiceRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentServiceRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? duree = null,
    Object? prix = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      duree: null == duree
          ? _value.duree
          : duree // ignore: cast_nullable_to_non_nullable
              as int,
      prix: null == prix
          ? _value.prix
          : prix // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentServiceRefImplCopyWith<$Res>
    implements $AppointmentServiceRefCopyWith<$Res> {
  factory _$$AppointmentServiceRefImplCopyWith(
          _$AppointmentServiceRefImpl value,
          $Res Function(_$AppointmentServiceRefImpl) then) =
      __$$AppointmentServiceRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String nom, int duree, double prix});
}

/// @nodoc
class __$$AppointmentServiceRefImplCopyWithImpl<$Res>
    extends _$AppointmentServiceRefCopyWithImpl<$Res,
        _$AppointmentServiceRefImpl>
    implements _$$AppointmentServiceRefImplCopyWith<$Res> {
  __$$AppointmentServiceRefImplCopyWithImpl(_$AppointmentServiceRefImpl _value,
      $Res Function(_$AppointmentServiceRefImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppointmentServiceRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? duree = null,
    Object? prix = null,
  }) {
    return _then(_$AppointmentServiceRefImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      duree: null == duree
          ? _value.duree
          : duree // ignore: cast_nullable_to_non_nullable
              as int,
      prix: null == prix
          ? _value.prix
          : prix // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentServiceRefImpl implements _AppointmentServiceRef {
  const _$AppointmentServiceRefImpl(
      {required this.id,
      required this.nom,
      required this.duree,
      required this.prix});

  factory _$AppointmentServiceRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentServiceRefImplFromJson(json);

  @override
  final int id;
  @override
  final String nom;
  @override
  final int duree;
  @override
  final double prix;

  @override
  String toString() {
    return 'AppointmentServiceRef(id: $id, nom: $nom, duree: $duree, prix: $prix)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentServiceRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.duree, duree) || other.duree == duree) &&
            (identical(other.prix, prix) || other.prix == prix));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nom, duree, prix);

  /// Create a copy of AppointmentServiceRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentServiceRefImplCopyWith<_$AppointmentServiceRefImpl>
      get copyWith => __$$AppointmentServiceRefImplCopyWithImpl<
          _$AppointmentServiceRefImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentServiceRefImplToJson(
      this,
    );
  }
}

abstract class _AppointmentServiceRef implements AppointmentServiceRef {
  const factory _AppointmentServiceRef(
      {required final int id,
      required final String nom,
      required final int duree,
      required final double prix}) = _$AppointmentServiceRefImpl;

  factory _AppointmentServiceRef.fromJson(Map<String, dynamic> json) =
      _$AppointmentServiceRefImpl.fromJson;

  @override
  int get id;
  @override
  String get nom;
  @override
  int get duree;
  @override
  double get prix;

  /// Create a copy of AppointmentServiceRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentServiceRefImplCopyWith<_$AppointmentServiceRefImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AppointmentPrestataireRef _$AppointmentPrestataireRefFromJson(
    Map<String, dynamic> json) {
  return _AppointmentPrestataireRef.fromJson(json);
}

/// @nodoc
mixin _$AppointmentPrestataireRef {
  int get id => throw _privateConstructorUsedError;
  String get businessName => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get ville => throw _privateConstructorUsedError;

  /// Serializes this AppointmentPrestataireRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentPrestataireRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentPrestataireRefCopyWith<AppointmentPrestataireRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentPrestataireRefCopyWith<$Res> {
  factory $AppointmentPrestataireRefCopyWith(AppointmentPrestataireRef value,
          $Res Function(AppointmentPrestataireRef) then) =
      _$AppointmentPrestataireRefCopyWithImpl<$Res, AppointmentPrestataireRef>;
  @useResult
  $Res call(
      {int id,
      String businessName,
      String firstName,
      String lastName,
      String? photoUrl,
      String? ville});
}

/// @nodoc
class _$AppointmentPrestataireRefCopyWithImpl<$Res,
        $Val extends AppointmentPrestataireRef>
    implements $AppointmentPrestataireRefCopyWith<$Res> {
  _$AppointmentPrestataireRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentPrestataireRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? businessName = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? photoUrl = freezed,
    Object? ville = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ville: freezed == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentPrestataireRefImplCopyWith<$Res>
    implements $AppointmentPrestataireRefCopyWith<$Res> {
  factory _$$AppointmentPrestataireRefImplCopyWith(
          _$AppointmentPrestataireRefImpl value,
          $Res Function(_$AppointmentPrestataireRefImpl) then) =
      __$$AppointmentPrestataireRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String businessName,
      String firstName,
      String lastName,
      String? photoUrl,
      String? ville});
}

/// @nodoc
class __$$AppointmentPrestataireRefImplCopyWithImpl<$Res>
    extends _$AppointmentPrestataireRefCopyWithImpl<$Res,
        _$AppointmentPrestataireRefImpl>
    implements _$$AppointmentPrestataireRefImplCopyWith<$Res> {
  __$$AppointmentPrestataireRefImplCopyWithImpl(
      _$AppointmentPrestataireRefImpl _value,
      $Res Function(_$AppointmentPrestataireRefImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppointmentPrestataireRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? businessName = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? photoUrl = freezed,
    Object? ville = freezed,
  }) {
    return _then(_$AppointmentPrestataireRefImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ville: freezed == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentPrestataireRefImpl implements _AppointmentPrestataireRef {
  const _$AppointmentPrestataireRefImpl(
      {required this.id,
      required this.businessName,
      required this.firstName,
      required this.lastName,
      this.photoUrl,
      this.ville});

  factory _$AppointmentPrestataireRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentPrestataireRefImplFromJson(json);

  @override
  final int id;
  @override
  final String businessName;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? photoUrl;
  @override
  final String? ville;

  @override
  String toString() {
    return 'AppointmentPrestataireRef(id: $id, businessName: $businessName, firstName: $firstName, lastName: $lastName, photoUrl: $photoUrl, ville: $ville)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentPrestataireRefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.ville, ville) || other.ville == ville));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, businessName, firstName, lastName, photoUrl, ville);

  /// Create a copy of AppointmentPrestataireRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentPrestataireRefImplCopyWith<_$AppointmentPrestataireRefImpl>
      get copyWith => __$$AppointmentPrestataireRefImplCopyWithImpl<
          _$AppointmentPrestataireRefImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentPrestataireRefImplToJson(
      this,
    );
  }
}

abstract class _AppointmentPrestataireRef implements AppointmentPrestataireRef {
  const factory _AppointmentPrestataireRef(
      {required final int id,
      required final String businessName,
      required final String firstName,
      required final String lastName,
      final String? photoUrl,
      final String? ville}) = _$AppointmentPrestataireRefImpl;

  factory _AppointmentPrestataireRef.fromJson(Map<String, dynamic> json) =
      _$AppointmentPrestataireRefImpl.fromJson;

  @override
  int get id;
  @override
  String get businessName;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get photoUrl;
  @override
  String? get ville;

  /// Create a copy of AppointmentPrestataireRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentPrestataireRefImplCopyWith<_$AppointmentPrestataireRefImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AppointmentResponse _$AppointmentResponseFromJson(Map<String, dynamic> json) {
  return _AppointmentResponse.fromJson(json);
}

/// @nodoc
mixin _$AppointmentResponse {
  int get id => throw _privateConstructorUsedError;
  UserSummary get client => throw _privateConstructorUsedError;
  AppointmentPrestataireRef get prestataire =>
      throw _privateConstructorUsedError;
  AppointmentServiceRef get service => throw _privateConstructorUsedError;
  String get dateHeureDebut => throw _privateConstructorUsedError;
  String get dateHeureFin => throw _privateConstructorUsedError;
  AppointmentStatus get status => throw _privateConstructorUsedError;
  String? get noteClient => throw _privateConstructorUsedError;
  String? get notePrestataire => throw _privateConstructorUsedError;
  String? get motifRefus => throw _privateConstructorUsedError;
  String? get motifAnnulation => throw _privateConstructorUsedError;
  String? get dateConfirmation => throw _privateConstructorUsedError;
  String? get dateAnnulation => throw _privateConstructorUsedError;

  /// Serializes this AppointmentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentResponseCopyWith<AppointmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentResponseCopyWith<$Res> {
  factory $AppointmentResponseCopyWith(
          AppointmentResponse value, $Res Function(AppointmentResponse) then) =
      _$AppointmentResponseCopyWithImpl<$Res, AppointmentResponse>;
  @useResult
  $Res call(
      {int id,
      UserSummary client,
      AppointmentPrestataireRef prestataire,
      AppointmentServiceRef service,
      String dateHeureDebut,
      String dateHeureFin,
      AppointmentStatus status,
      String? noteClient,
      String? notePrestataire,
      String? motifRefus,
      String? motifAnnulation,
      String? dateConfirmation,
      String? dateAnnulation});

  $UserSummaryCopyWith<$Res> get client;
  $AppointmentPrestataireRefCopyWith<$Res> get prestataire;
  $AppointmentServiceRefCopyWith<$Res> get service;
}

/// @nodoc
class _$AppointmentResponseCopyWithImpl<$Res, $Val extends AppointmentResponse>
    implements $AppointmentResponseCopyWith<$Res> {
  _$AppointmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? client = null,
    Object? prestataire = null,
    Object? service = null,
    Object? dateHeureDebut = null,
    Object? dateHeureFin = null,
    Object? status = null,
    Object? noteClient = freezed,
    Object? notePrestataire = freezed,
    Object? motifRefus = freezed,
    Object? motifAnnulation = freezed,
    Object? dateConfirmation = freezed,
    Object? dateAnnulation = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as UserSummary,
      prestataire: null == prestataire
          ? _value.prestataire
          : prestataire // ignore: cast_nullable_to_non_nullable
              as AppointmentPrestataireRef,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as AppointmentServiceRef,
      dateHeureDebut: null == dateHeureDebut
          ? _value.dateHeureDebut
          : dateHeureDebut // ignore: cast_nullable_to_non_nullable
              as String,
      dateHeureFin: null == dateHeureFin
          ? _value.dateHeureFin
          : dateHeureFin // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
      noteClient: freezed == noteClient
          ? _value.noteClient
          : noteClient // ignore: cast_nullable_to_non_nullable
              as String?,
      notePrestataire: freezed == notePrestataire
          ? _value.notePrestataire
          : notePrestataire // ignore: cast_nullable_to_non_nullable
              as String?,
      motifRefus: freezed == motifRefus
          ? _value.motifRefus
          : motifRefus // ignore: cast_nullable_to_non_nullable
              as String?,
      motifAnnulation: freezed == motifAnnulation
          ? _value.motifAnnulation
          : motifAnnulation // ignore: cast_nullable_to_non_nullable
              as String?,
      dateConfirmation: freezed == dateConfirmation
          ? _value.dateConfirmation
          : dateConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
      dateAnnulation: freezed == dateAnnulation
          ? _value.dateAnnulation
          : dateAnnulation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of AppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSummaryCopyWith<$Res> get client {
    return $UserSummaryCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value) as $Val);
    });
  }

  /// Create a copy of AppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppointmentPrestataireRefCopyWith<$Res> get prestataire {
    return $AppointmentPrestataireRefCopyWith<$Res>(_value.prestataire,
        (value) {
      return _then(_value.copyWith(prestataire: value) as $Val);
    });
  }

  /// Create a copy of AppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppointmentServiceRefCopyWith<$Res> get service {
    return $AppointmentServiceRefCopyWith<$Res>(_value.service, (value) {
      return _then(_value.copyWith(service: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppointmentResponseImplCopyWith<$Res>
    implements $AppointmentResponseCopyWith<$Res> {
  factory _$$AppointmentResponseImplCopyWith(_$AppointmentResponseImpl value,
          $Res Function(_$AppointmentResponseImpl) then) =
      __$$AppointmentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      UserSummary client,
      AppointmentPrestataireRef prestataire,
      AppointmentServiceRef service,
      String dateHeureDebut,
      String dateHeureFin,
      AppointmentStatus status,
      String? noteClient,
      String? notePrestataire,
      String? motifRefus,
      String? motifAnnulation,
      String? dateConfirmation,
      String? dateAnnulation});

  @override
  $UserSummaryCopyWith<$Res> get client;
  @override
  $AppointmentPrestataireRefCopyWith<$Res> get prestataire;
  @override
  $AppointmentServiceRefCopyWith<$Res> get service;
}

/// @nodoc
class __$$AppointmentResponseImplCopyWithImpl<$Res>
    extends _$AppointmentResponseCopyWithImpl<$Res, _$AppointmentResponseImpl>
    implements _$$AppointmentResponseImplCopyWith<$Res> {
  __$$AppointmentResponseImplCopyWithImpl(_$AppointmentResponseImpl _value,
      $Res Function(_$AppointmentResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? client = null,
    Object? prestataire = null,
    Object? service = null,
    Object? dateHeureDebut = null,
    Object? dateHeureFin = null,
    Object? status = null,
    Object? noteClient = freezed,
    Object? notePrestataire = freezed,
    Object? motifRefus = freezed,
    Object? motifAnnulation = freezed,
    Object? dateConfirmation = freezed,
    Object? dateAnnulation = freezed,
  }) {
    return _then(_$AppointmentResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as UserSummary,
      prestataire: null == prestataire
          ? _value.prestataire
          : prestataire // ignore: cast_nullable_to_non_nullable
              as AppointmentPrestataireRef,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as AppointmentServiceRef,
      dateHeureDebut: null == dateHeureDebut
          ? _value.dateHeureDebut
          : dateHeureDebut // ignore: cast_nullable_to_non_nullable
              as String,
      dateHeureFin: null == dateHeureFin
          ? _value.dateHeureFin
          : dateHeureFin // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
      noteClient: freezed == noteClient
          ? _value.noteClient
          : noteClient // ignore: cast_nullable_to_non_nullable
              as String?,
      notePrestataire: freezed == notePrestataire
          ? _value.notePrestataire
          : notePrestataire // ignore: cast_nullable_to_non_nullable
              as String?,
      motifRefus: freezed == motifRefus
          ? _value.motifRefus
          : motifRefus // ignore: cast_nullable_to_non_nullable
              as String?,
      motifAnnulation: freezed == motifAnnulation
          ? _value.motifAnnulation
          : motifAnnulation // ignore: cast_nullable_to_non_nullable
              as String?,
      dateConfirmation: freezed == dateConfirmation
          ? _value.dateConfirmation
          : dateConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
      dateAnnulation: freezed == dateAnnulation
          ? _value.dateAnnulation
          : dateAnnulation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentResponseImpl implements _AppointmentResponse {
  const _$AppointmentResponseImpl(
      {required this.id,
      required this.client,
      required this.prestataire,
      required this.service,
      required this.dateHeureDebut,
      required this.dateHeureFin,
      required this.status,
      this.noteClient,
      this.notePrestataire,
      this.motifRefus,
      this.motifAnnulation,
      this.dateConfirmation,
      this.dateAnnulation});

  factory _$AppointmentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentResponseImplFromJson(json);

  @override
  final int id;
  @override
  final UserSummary client;
  @override
  final AppointmentPrestataireRef prestataire;
  @override
  final AppointmentServiceRef service;
  @override
  final String dateHeureDebut;
  @override
  final String dateHeureFin;
  @override
  final AppointmentStatus status;
  @override
  final String? noteClient;
  @override
  final String? notePrestataire;
  @override
  final String? motifRefus;
  @override
  final String? motifAnnulation;
  @override
  final String? dateConfirmation;
  @override
  final String? dateAnnulation;

  @override
  String toString() {
    return 'AppointmentResponse(id: $id, client: $client, prestataire: $prestataire, service: $service, dateHeureDebut: $dateHeureDebut, dateHeureFin: $dateHeureFin, status: $status, noteClient: $noteClient, notePrestataire: $notePrestataire, motifRefus: $motifRefus, motifAnnulation: $motifAnnulation, dateConfirmation: $dateConfirmation, dateAnnulation: $dateAnnulation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.prestataire, prestataire) ||
                other.prestataire == prestataire) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.dateHeureDebut, dateHeureDebut) ||
                other.dateHeureDebut == dateHeureDebut) &&
            (identical(other.dateHeureFin, dateHeureFin) ||
                other.dateHeureFin == dateHeureFin) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.noteClient, noteClient) ||
                other.noteClient == noteClient) &&
            (identical(other.notePrestataire, notePrestataire) ||
                other.notePrestataire == notePrestataire) &&
            (identical(other.motifRefus, motifRefus) ||
                other.motifRefus == motifRefus) &&
            (identical(other.motifAnnulation, motifAnnulation) ||
                other.motifAnnulation == motifAnnulation) &&
            (identical(other.dateConfirmation, dateConfirmation) ||
                other.dateConfirmation == dateConfirmation) &&
            (identical(other.dateAnnulation, dateAnnulation) ||
                other.dateAnnulation == dateAnnulation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      client,
      prestataire,
      service,
      dateHeureDebut,
      dateHeureFin,
      status,
      noteClient,
      notePrestataire,
      motifRefus,
      motifAnnulation,
      dateConfirmation,
      dateAnnulation);

  /// Create a copy of AppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentResponseImplCopyWith<_$AppointmentResponseImpl> get copyWith =>
      __$$AppointmentResponseImplCopyWithImpl<_$AppointmentResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentResponseImplToJson(
      this,
    );
  }
}

abstract class _AppointmentResponse implements AppointmentResponse {
  const factory _AppointmentResponse(
      {required final int id,
      required final UserSummary client,
      required final AppointmentPrestataireRef prestataire,
      required final AppointmentServiceRef service,
      required final String dateHeureDebut,
      required final String dateHeureFin,
      required final AppointmentStatus status,
      final String? noteClient,
      final String? notePrestataire,
      final String? motifRefus,
      final String? motifAnnulation,
      final String? dateConfirmation,
      final String? dateAnnulation}) = _$AppointmentResponseImpl;

  factory _AppointmentResponse.fromJson(Map<String, dynamic> json) =
      _$AppointmentResponseImpl.fromJson;

  @override
  int get id;
  @override
  UserSummary get client;
  @override
  AppointmentPrestataireRef get prestataire;
  @override
  AppointmentServiceRef get service;
  @override
  String get dateHeureDebut;
  @override
  String get dateHeureFin;
  @override
  AppointmentStatus get status;
  @override
  String? get noteClient;
  @override
  String? get notePrestataire;
  @override
  String? get motifRefus;
  @override
  String? get motifAnnulation;
  @override
  String? get dateConfirmation;
  @override
  String? get dateAnnulation;

  /// Create a copy of AppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentResponseImplCopyWith<_$AppointmentResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrestataireDashboardStats _$PrestataireDashboardStatsFromJson(
    Map<String, dynamic> json) {
  return _PrestataireDashboardStats.fromJson(json);
}

/// @nodoc
mixin _$PrestataireDashboardStats {
  int get totalAppointments => throw _privateConstructorUsedError;
  int get pendingAppointments => throw _privateConstructorUsedError;
  int get completedAppointments => throw _privateConstructorUsedError;
  double get totalRevenue => throw _privateConstructorUsedError;
  double? get currentRating => throw _privateConstructorUsedError;

  /// Serializes this PrestataireDashboardStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrestataireDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrestataireDashboardStatsCopyWith<PrestataireDashboardStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrestataireDashboardStatsCopyWith<$Res> {
  factory $PrestataireDashboardStatsCopyWith(PrestataireDashboardStats value,
          $Res Function(PrestataireDashboardStats) then) =
      _$PrestataireDashboardStatsCopyWithImpl<$Res, PrestataireDashboardStats>;
  @useResult
  $Res call(
      {int totalAppointments,
      int pendingAppointments,
      int completedAppointments,
      double totalRevenue,
      double? currentRating});
}

/// @nodoc
class _$PrestataireDashboardStatsCopyWithImpl<$Res,
        $Val extends PrestataireDashboardStats>
    implements $PrestataireDashboardStatsCopyWith<$Res> {
  _$PrestataireDashboardStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrestataireDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAppointments = null,
    Object? pendingAppointments = null,
    Object? completedAppointments = null,
    Object? totalRevenue = null,
    Object? currentRating = freezed,
  }) {
    return _then(_value.copyWith(
      totalAppointments: null == totalAppointments
          ? _value.totalAppointments
          : totalAppointments // ignore: cast_nullable_to_non_nullable
              as int,
      pendingAppointments: null == pendingAppointments
          ? _value.pendingAppointments
          : pendingAppointments // ignore: cast_nullable_to_non_nullable
              as int,
      completedAppointments: null == completedAppointments
          ? _value.completedAppointments
          : completedAppointments // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      currentRating: freezed == currentRating
          ? _value.currentRating
          : currentRating // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrestataireDashboardStatsImplCopyWith<$Res>
    implements $PrestataireDashboardStatsCopyWith<$Res> {
  factory _$$PrestataireDashboardStatsImplCopyWith(
          _$PrestataireDashboardStatsImpl value,
          $Res Function(_$PrestataireDashboardStatsImpl) then) =
      __$$PrestataireDashboardStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalAppointments,
      int pendingAppointments,
      int completedAppointments,
      double totalRevenue,
      double? currentRating});
}

/// @nodoc
class __$$PrestataireDashboardStatsImplCopyWithImpl<$Res>
    extends _$PrestataireDashboardStatsCopyWithImpl<$Res,
        _$PrestataireDashboardStatsImpl>
    implements _$$PrestataireDashboardStatsImplCopyWith<$Res> {
  __$$PrestataireDashboardStatsImplCopyWithImpl(
      _$PrestataireDashboardStatsImpl _value,
      $Res Function(_$PrestataireDashboardStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrestataireDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAppointments = null,
    Object? pendingAppointments = null,
    Object? completedAppointments = null,
    Object? totalRevenue = null,
    Object? currentRating = freezed,
  }) {
    return _then(_$PrestataireDashboardStatsImpl(
      totalAppointments: null == totalAppointments
          ? _value.totalAppointments
          : totalAppointments // ignore: cast_nullable_to_non_nullable
              as int,
      pendingAppointments: null == pendingAppointments
          ? _value.pendingAppointments
          : pendingAppointments // ignore: cast_nullable_to_non_nullable
              as int,
      completedAppointments: null == completedAppointments
          ? _value.completedAppointments
          : completedAppointments // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      currentRating: freezed == currentRating
          ? _value.currentRating
          : currentRating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrestataireDashboardStatsImpl implements _PrestataireDashboardStats {
  const _$PrestataireDashboardStatsImpl(
      {required this.totalAppointments,
      required this.pendingAppointments,
      required this.completedAppointments,
      required this.totalRevenue,
      this.currentRating});

  factory _$PrestataireDashboardStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrestataireDashboardStatsImplFromJson(json);

  @override
  final int totalAppointments;
  @override
  final int pendingAppointments;
  @override
  final int completedAppointments;
  @override
  final double totalRevenue;
  @override
  final double? currentRating;

  @override
  String toString() {
    return 'PrestataireDashboardStats(totalAppointments: $totalAppointments, pendingAppointments: $pendingAppointments, completedAppointments: $completedAppointments, totalRevenue: $totalRevenue, currentRating: $currentRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrestataireDashboardStatsImpl &&
            (identical(other.totalAppointments, totalAppointments) ||
                other.totalAppointments == totalAppointments) &&
            (identical(other.pendingAppointments, pendingAppointments) ||
                other.pendingAppointments == pendingAppointments) &&
            (identical(other.completedAppointments, completedAppointments) ||
                other.completedAppointments == completedAppointments) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.currentRating, currentRating) ||
                other.currentRating == currentRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalAppointments,
      pendingAppointments, completedAppointments, totalRevenue, currentRating);

  /// Create a copy of PrestataireDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrestataireDashboardStatsImplCopyWith<_$PrestataireDashboardStatsImpl>
      get copyWith => __$$PrestataireDashboardStatsImplCopyWithImpl<
          _$PrestataireDashboardStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrestataireDashboardStatsImplToJson(
      this,
    );
  }
}

abstract class _PrestataireDashboardStats implements PrestataireDashboardStats {
  const factory _PrestataireDashboardStats(
      {required final int totalAppointments,
      required final int pendingAppointments,
      required final int completedAppointments,
      required final double totalRevenue,
      final double? currentRating}) = _$PrestataireDashboardStatsImpl;

  factory _PrestataireDashboardStats.fromJson(Map<String, dynamic> json) =
      _$PrestataireDashboardStatsImpl.fromJson;

  @override
  int get totalAppointments;
  @override
  int get pendingAppointments;
  @override
  int get completedAppointments;
  @override
  double get totalRevenue;
  @override
  double? get currentRating;

  /// Create a copy of PrestataireDashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrestataireDashboardStatsImplCopyWith<_$PrestataireDashboardStatsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateProfileRequest _$UpdateProfileRequestFromJson(Map<String, dynamic> json) {
  return _UpdateProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateProfileRequest {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  /// Serializes this UpdateProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateProfileRequestCopyWith<UpdateProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProfileRequestCopyWith<$Res> {
  factory $UpdateProfileRequestCopyWith(UpdateProfileRequest value,
          $Res Function(UpdateProfileRequest) then) =
      _$UpdateProfileRequestCopyWithImpl<$Res, UpdateProfileRequest>;
  @useResult
  $Res call({String firstName, String lastName, String email, String phone});
}

/// @nodoc
class _$UpdateProfileRequestCopyWithImpl<$Res,
        $Val extends UpdateProfileRequest>
    implements $UpdateProfileRequestCopyWith<$Res> {
  _$UpdateProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateProfileRequestImplCopyWith<$Res>
    implements $UpdateProfileRequestCopyWith<$Res> {
  factory _$$UpdateProfileRequestImplCopyWith(_$UpdateProfileRequestImpl value,
          $Res Function(_$UpdateProfileRequestImpl) then) =
      __$$UpdateProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName, String lastName, String email, String phone});
}

/// @nodoc
class __$$UpdateProfileRequestImplCopyWithImpl<$Res>
    extends _$UpdateProfileRequestCopyWithImpl<$Res, _$UpdateProfileRequestImpl>
    implements _$$UpdateProfileRequestImplCopyWith<$Res> {
  __$$UpdateProfileRequestImplCopyWithImpl(_$UpdateProfileRequestImpl _value,
      $Res Function(_$UpdateProfileRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
  }) {
    return _then(_$UpdateProfileRequestImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateProfileRequestImpl implements _UpdateProfileRequest {
  const _$UpdateProfileRequestImpl(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone});

  factory _$UpdateProfileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateProfileRequestImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String phone;

  @override
  String toString() {
    return 'UpdateProfileRequest(firstName: $firstName, lastName: $lastName, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileRequestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, email, phone);

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileRequestImplCopyWith<_$UpdateProfileRequestImpl>
      get copyWith =>
          __$$UpdateProfileRequestImplCopyWithImpl<_$UpdateProfileRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateProfileRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateProfileRequest implements UpdateProfileRequest {
  const factory _UpdateProfileRequest(
      {required final String firstName,
      required final String lastName,
      required final String email,
      required final String phone}) = _$UpdateProfileRequestImpl;

  factory _UpdateProfileRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateProfileRequestImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get phone;

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProfileRequestImplCopyWith<_$UpdateProfileRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChangePasswordRequest _$ChangePasswordRequestFromJson(
    Map<String, dynamic> json) {
  return _ChangePasswordRequest.fromJson(json);
}

/// @nodoc
mixin _$ChangePasswordRequest {
  String get currentPassword => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;

  /// Serializes this ChangePasswordRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangePasswordRequestCopyWith<ChangePasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordRequestCopyWith<$Res> {
  factory $ChangePasswordRequestCopyWith(ChangePasswordRequest value,
          $Res Function(ChangePasswordRequest) then) =
      _$ChangePasswordRequestCopyWithImpl<$Res, ChangePasswordRequest>;
  @useResult
  $Res call({String currentPassword, String newPassword});
}

/// @nodoc
class _$ChangePasswordRequestCopyWithImpl<$Res,
        $Val extends ChangePasswordRequest>
    implements $ChangePasswordRequestCopyWith<$Res> {
  _$ChangePasswordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_value.copyWith(
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePasswordRequestImplCopyWith<$Res>
    implements $ChangePasswordRequestCopyWith<$Res> {
  factory _$$ChangePasswordRequestImplCopyWith(
          _$ChangePasswordRequestImpl value,
          $Res Function(_$ChangePasswordRequestImpl) then) =
      __$$ChangePasswordRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentPassword, String newPassword});
}

/// @nodoc
class __$$ChangePasswordRequestImplCopyWithImpl<$Res>
    extends _$ChangePasswordRequestCopyWithImpl<$Res,
        _$ChangePasswordRequestImpl>
    implements _$$ChangePasswordRequestImplCopyWith<$Res> {
  __$$ChangePasswordRequestImplCopyWithImpl(_$ChangePasswordRequestImpl _value,
      $Res Function(_$ChangePasswordRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_$ChangePasswordRequestImpl(
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePasswordRequestImpl implements _ChangePasswordRequest {
  const _$ChangePasswordRequestImpl(
      {required this.currentPassword, required this.newPassword});

  factory _$ChangePasswordRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePasswordRequestImplFromJson(json);

  @override
  final String currentPassword;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'ChangePasswordRequest(currentPassword: $currentPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordRequestImpl &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPassword, newPassword);

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordRequestImplCopyWith<_$ChangePasswordRequestImpl>
      get copyWith => __$$ChangePasswordRequestImplCopyWithImpl<
          _$ChangePasswordRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePasswordRequestImplToJson(
      this,
    );
  }
}

abstract class _ChangePasswordRequest implements ChangePasswordRequest {
  const factory _ChangePasswordRequest(
      {required final String currentPassword,
      required final String newPassword}) = _$ChangePasswordRequestImpl;

  factory _ChangePasswordRequest.fromJson(Map<String, dynamic> json) =
      _$ChangePasswordRequestImpl.fromJson;

  @override
  String get currentPassword;
  @override
  String get newPassword;

  /// Create a copy of ChangePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordRequestImplCopyWith<_$ChangePasswordRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
