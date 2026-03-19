// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myAvailabilitiesHash() => r'52cb85a5d8c3fb9df08d13b963e3bdc71e2193b7';

/// See also [myAvailabilities].
@ProviderFor(myAvailabilities)
final myAvailabilitiesProvider =
    AutoDisposeFutureProvider<List<AvailabilityDto>>.internal(
  myAvailabilities,
  name: r'myAvailabilitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myAvailabilitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MyAvailabilitiesRef
    = AutoDisposeFutureProviderRef<List<AvailabilityDto>>;
String _$saveAvailabilitiesHash() =>
    r'e1051f6ef697a8feb702fdd20582ae9fa8865e81';

/// See also [SaveAvailabilities].
@ProviderFor(SaveAvailabilities)
final saveAvailabilitiesProvider =
    AutoDisposeNotifierProvider<SaveAvailabilities, AsyncValue<void>>.internal(
  SaveAvailabilities.new,
  name: r'saveAvailabilitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$saveAvailabilitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SaveAvailabilities = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
