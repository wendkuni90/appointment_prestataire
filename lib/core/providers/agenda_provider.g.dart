// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agenda_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appointmentsByStatusHash() =>
    r'045e84f4fbd12e9a07e8e8260b2beefc194f2972';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [appointmentsByStatus].
@ProviderFor(appointmentsByStatus)
const appointmentsByStatusProvider = AppointmentsByStatusFamily();

/// See also [appointmentsByStatus].
class AppointmentsByStatusFamily
    extends Family<AsyncValue<List<AppointmentResponse>>> {
  /// See also [appointmentsByStatus].
  const AppointmentsByStatusFamily();

  /// See also [appointmentsByStatus].
  AppointmentsByStatusProvider call(
    AppointmentStatus status,
  ) {
    return AppointmentsByStatusProvider(
      status,
    );
  }

  @override
  AppointmentsByStatusProvider getProviderOverride(
    covariant AppointmentsByStatusProvider provider,
  ) {
    return call(
      provider.status,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'appointmentsByStatusProvider';
}

/// See also [appointmentsByStatus].
class AppointmentsByStatusProvider
    extends AutoDisposeFutureProvider<List<AppointmentResponse>> {
  /// See also [appointmentsByStatus].
  AppointmentsByStatusProvider(
    AppointmentStatus status,
  ) : this._internal(
          (ref) => appointmentsByStatus(
            ref as AppointmentsByStatusRef,
            status,
          ),
          from: appointmentsByStatusProvider,
          name: r'appointmentsByStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appointmentsByStatusHash,
          dependencies: AppointmentsByStatusFamily._dependencies,
          allTransitiveDependencies:
              AppointmentsByStatusFamily._allTransitiveDependencies,
          status: status,
        );

  AppointmentsByStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final AppointmentStatus status;

  @override
  Override overrideWith(
    FutureOr<List<AppointmentResponse>> Function(
            AppointmentsByStatusRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AppointmentsByStatusProvider._internal(
        (ref) => create(ref as AppointmentsByStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<AppointmentResponse>> createElement() {
    return _AppointmentsByStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppointmentsByStatusProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppointmentsByStatusRef
    on AutoDisposeFutureProviderRef<List<AppointmentResponse>> {
  /// The parameter `status` of this provider.
  AppointmentStatus get status;
}

class _AppointmentsByStatusProviderElement
    extends AutoDisposeFutureProviderElement<List<AppointmentResponse>>
    with AppointmentsByStatusRef {
  _AppointmentsByStatusProviderElement(super.provider);

  @override
  AppointmentStatus get status =>
      (origin as AppointmentsByStatusProvider).status;
}

String _$historyAppointmentsHash() =>
    r'66ca89fed9a2ca32977583dd80a88a6d428a4799';

/// See also [historyAppointments].
@ProviderFor(historyAppointments)
final historyAppointmentsProvider =
    AutoDisposeFutureProvider<List<AppointmentResponse>>.internal(
  historyAppointments,
  name: r'historyAppointmentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$historyAppointmentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HistoryAppointmentsRef
    = AutoDisposeFutureProviderRef<List<AppointmentResponse>>;
String _$appointmentActionsHash() =>
    r'2fda8b68ba5544fd4fbb7973d9b165ea9ed20b08';

/// See also [AppointmentActions].
@ProviderFor(AppointmentActions)
final appointmentActionsProvider =
    AutoDisposeNotifierProvider<AppointmentActions, AsyncValue<void>>.internal(
  AppointmentActions.new,
  name: r'appointmentActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appointmentActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppointmentActions = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
