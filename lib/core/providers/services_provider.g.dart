// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myServicesHash() => r'aff544fae483c31194773e6db10edc7fe7ba563a';

/// See also [myServices].
@ProviderFor(myServices)
final myServicesProvider =
    AutoDisposeFutureProvider<List<ServiceResponse>>.internal(
  myServices,
  name: r'myServicesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$myServicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MyServicesRef = AutoDisposeFutureProviderRef<List<ServiceResponse>>;
String _$serviceActionsHash() => r'4ac56541fd57c2d06a2ada38323de47ed6924523';

/// See also [ServiceActions].
@ProviderFor(ServiceActions)
final serviceActionsProvider =
    AutoDisposeNotifierProvider<ServiceActions, AsyncValue<void>>.internal(
  ServiceActions.new,
  name: r'serviceActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$serviceActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ServiceActions = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
