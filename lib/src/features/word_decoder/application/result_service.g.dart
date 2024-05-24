// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$resultsListStreamHash() => r'2d7aaa0a1037459957737708380f479d9173d5da';

/// See also [resultsListStream].
@ProviderFor(resultsListStream)
final resultsListStreamProvider =
    AutoDisposeStreamProvider<List<Result>>.internal(
  resultsListStream,
  name: r'resultsListStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$resultsListStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ResultsListStreamRef = AutoDisposeStreamProviderRef<List<Result>>;
String _$resultStreamHash() => r'c098d13013ef15064dda993c91b049e4bb6d6ec0';

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

/// See also [resultStream].
@ProviderFor(resultStream)
const resultStreamProvider = ResultStreamFamily();

/// See also [resultStream].
class ResultStreamFamily extends Family<AsyncValue<Result?>> {
  /// See also [resultStream].
  const ResultStreamFamily();

  /// See also [resultStream].
  ResultStreamProvider call(
    String id,
  ) {
    return ResultStreamProvider(
      id,
    );
  }

  @override
  ResultStreamProvider getProviderOverride(
    covariant ResultStreamProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'resultStreamProvider';
}

/// See also [resultStream].
class ResultStreamProvider extends AutoDisposeStreamProvider<Result?> {
  /// See also [resultStream].
  ResultStreamProvider(
    String id,
  ) : this._internal(
          (ref) => resultStream(
            ref as ResultStreamRef,
            id,
          ),
          from: resultStreamProvider,
          name: r'resultStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resultStreamHash,
          dependencies: ResultStreamFamily._dependencies,
          allTransitiveDependencies:
              ResultStreamFamily._allTransitiveDependencies,
          id: id,
        );

  ResultStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    Stream<Result?> Function(ResultStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ResultStreamProvider._internal(
        (ref) => create(ref as ResultStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Result?> createElement() {
    return _ResultStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResultStreamProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ResultStreamRef on AutoDisposeStreamProviderRef<Result?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ResultStreamProviderElement
    extends AutoDisposeStreamProviderElement<Result?> with ResultStreamRef {
  _ResultStreamProviderElement(super.provider);

  @override
  String get id => (origin as ResultStreamProvider).id;
}

String _$resultHash() => r'e7b240e2b37f9d5c1bdba1957f129513389c8e2f';

/// See also [result].
@ProviderFor(result)
const resultProvider = ResultFamily();

/// See also [result].
class ResultFamily extends Family<AsyncValue<Result?>> {
  /// See also [result].
  const ResultFamily();

  /// See also [result].
  ResultProvider call(
    String id,
  ) {
    return ResultProvider(
      id,
    );
  }

  @override
  ResultProvider getProviderOverride(
    covariant ResultProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'resultProvider';
}

/// See also [result].
class ResultProvider extends AutoDisposeFutureProvider<Result?> {
  /// See also [result].
  ResultProvider(
    String id,
  ) : this._internal(
          (ref) => result(
            ref as ResultRef,
            id,
          ),
          from: resultProvider,
          name: r'resultProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resultHash,
          dependencies: ResultFamily._dependencies,
          allTransitiveDependencies: ResultFamily._allTransitiveDependencies,
          id: id,
        );

  ResultProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Result?> Function(ResultRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ResultProvider._internal(
        (ref) => create(ref as ResultRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Result?> createElement() {
    return _ResultProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResultProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ResultRef on AutoDisposeFutureProviderRef<Result?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ResultProviderElement extends AutoDisposeFutureProviderElement<Result?>
    with ResultRef {
  _ResultProviderElement(super.provider);

  @override
  String get id => (origin as ResultProvider).id;
}

String _$resultServiceHash() => r'625c599de1c6b22da30175422af180cad3baf134';

/// See also [resultService].
@ProviderFor(resultService)
final resultServiceProvider = AutoDisposeProvider<ResultService>.internal(
  resultService,
  name: r'resultServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$resultServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ResultServiceRef = AutoDisposeProviderRef<ResultService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
