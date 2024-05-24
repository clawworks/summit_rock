// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_page_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$resultPageControllerHash() =>
    r'15d6fac548a62d41d4faa4004ea360758c762ab9';

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

abstract class _$ResultPageController
    extends BuildlessAutoDisposeAsyncNotifier<Result?> {
  late final String resultId;

  FutureOr<Result?> build(
    String resultId,
  );
}

/// See also [ResultPageController].
@ProviderFor(ResultPageController)
const resultPageControllerProvider = ResultPageControllerFamily();

/// See also [ResultPageController].
class ResultPageControllerFamily extends Family<AsyncValue<Result?>> {
  /// See also [ResultPageController].
  const ResultPageControllerFamily();

  /// See also [ResultPageController].
  ResultPageControllerProvider call(
    String resultId,
  ) {
    return ResultPageControllerProvider(
      resultId,
    );
  }

  @override
  ResultPageControllerProvider getProviderOverride(
    covariant ResultPageControllerProvider provider,
  ) {
    return call(
      provider.resultId,
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
  String? get name => r'resultPageControllerProvider';
}

/// See also [ResultPageController].
class ResultPageControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ResultPageController, Result?> {
  /// See also [ResultPageController].
  ResultPageControllerProvider(
    String resultId,
  ) : this._internal(
          () => ResultPageController()..resultId = resultId,
          from: resultPageControllerProvider,
          name: r'resultPageControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resultPageControllerHash,
          dependencies: ResultPageControllerFamily._dependencies,
          allTransitiveDependencies:
              ResultPageControllerFamily._allTransitiveDependencies,
          resultId: resultId,
        );

  ResultPageControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.resultId,
  }) : super.internal();

  final String resultId;

  @override
  FutureOr<Result?> runNotifierBuild(
    covariant ResultPageController notifier,
  ) {
    return notifier.build(
      resultId,
    );
  }

  @override
  Override overrideWith(ResultPageController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ResultPageControllerProvider._internal(
        () => create()..resultId = resultId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        resultId: resultId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ResultPageController, Result?>
      createElement() {
    return _ResultPageControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResultPageControllerProvider && other.resultId == resultId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, resultId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ResultPageControllerRef on AutoDisposeAsyncNotifierProviderRef<Result?> {
  /// The parameter `resultId` of this provider.
  String get resultId;
}

class _ResultPageControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ResultPageController,
        Result?> with ResultPageControllerRef {
  _ResultPageControllerProviderElement(super.provider);

  @override
  String get resultId => (origin as ResultPageControllerProvider).resultId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
