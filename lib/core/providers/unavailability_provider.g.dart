// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unavailability_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myUnavailabilitiesHash() =>
    r'878f81ab33bf23c49ab42d0b72668e588d7272dc';

/// See also [myUnavailabilities].
@ProviderFor(myUnavailabilities)
final myUnavailabilitiesProvider =
    AutoDisposeFutureProvider<List<UnavailabilityResponse>>.internal(
  myUnavailabilities,
  name: r'myUnavailabilitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myUnavailabilitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MyUnavailabilitiesRef
    = AutoDisposeFutureProviderRef<List<UnavailabilityResponse>>;
String _$createUnavailabilityHash() =>
    r'1cd16461b21c362aa954987ec18bcd46fb440621';

/// See also [CreateUnavailability].
@ProviderFor(CreateUnavailability)
final createUnavailabilityProvider = AutoDisposeNotifierProvider<
    CreateUnavailability, AsyncValue<void>>.internal(
  CreateUnavailability.new,
  name: r'createUnavailabilityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createUnavailabilityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CreateUnavailability = AutoDisposeNotifier<AsyncValue<void>>;
String _$deleteUnavailabilityHash() =>
    r'2aec386af4ddb52365d9d28f23aadbd939b96946';

/// See also [DeleteUnavailability].
@ProviderFor(DeleteUnavailability)
final deleteUnavailabilityProvider = AutoDisposeNotifierProvider<
    DeleteUnavailability, AsyncValue<void>>.internal(
  DeleteUnavailability.new,
  name: r'deleteUnavailabilityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deleteUnavailabilityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeleteUnavailability = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
