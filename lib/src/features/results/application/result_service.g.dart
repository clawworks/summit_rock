// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$resultTitleHash() => r'b22502380b753fe702c0b1a6f53e2bf8a29a59e1';

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

/// See also [resultTitle].
@ProviderFor(resultTitle)
const resultTitleProvider = ResultTitleFamily();

/// See also [resultTitle].
class ResultTitleFamily extends Family<String> {
  /// See also [resultTitle].
  const ResultTitleFamily();

  /// See also [resultTitle].
  ResultTitleProvider call(
    Result result,
  ) {
    return ResultTitleProvider(
      result,
    );
  }

  @override
  ResultTitleProvider getProviderOverride(
    covariant ResultTitleProvider provider,
  ) {
    return call(
      provider.result,
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
  String? get name => r'resultTitleProvider';
}

/// See also [resultTitle].
class ResultTitleProvider extends AutoDisposeProvider<String> {
  /// See also [resultTitle].
  ResultTitleProvider(
    Result result,
  ) : this._internal(
          (ref) => resultTitle(
            ref as ResultTitleRef,
            result,
          ),
          from: resultTitleProvider,
          name: r'resultTitleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resultTitleHash,
          dependencies: ResultTitleFamily._dependencies,
          allTransitiveDependencies:
              ResultTitleFamily._allTransitiveDependencies,
          result: result,
        );

  ResultTitleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.result,
  }) : super.internal();

  final Result result;

  @override
  Override overrideWith(
    String Function(ResultTitleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ResultTitleProvider._internal(
        (ref) => create(ref as ResultTitleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        result: result,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _ResultTitleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResultTitleProvider && other.result == result;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, result.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ResultTitleRef on AutoDisposeProviderRef<String> {
  /// The parameter `result` of this provider.
  Result get result;
}

class _ResultTitleProviderElement extends AutoDisposeProviderElement<String>
    with ResultTitleRef {
  _ResultTitleProviderElement(super.provider);

  @override
  Result get result => (origin as ResultTitleProvider).result;
}

String _$combinedListHash() => r'87d67a3edcd07bec30853304bf1c1a37ab3958bc';

/// See also [combinedList].
@ProviderFor(combinedList)
const combinedListProvider = CombinedListFamily();

/// See also [combinedList].
class CombinedListFamily extends Family<List<String>> {
  /// See also [combinedList].
  const CombinedListFamily();

  /// See also [combinedList].
  CombinedListProvider call({
    required List<int> numbers,
    required Map<int, String> letterMap,
  }) {
    return CombinedListProvider(
      numbers: numbers,
      letterMap: letterMap,
    );
  }

  @override
  CombinedListProvider getProviderOverride(
    covariant CombinedListProvider provider,
  ) {
    return call(
      numbers: provider.numbers,
      letterMap: provider.letterMap,
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
  String? get name => r'combinedListProvider';
}

/// See also [combinedList].
class CombinedListProvider extends AutoDisposeProvider<List<String>> {
  /// See also [combinedList].
  CombinedListProvider({
    required List<int> numbers,
    required Map<int, String> letterMap,
  }) : this._internal(
          (ref) => combinedList(
            ref as CombinedListRef,
            numbers: numbers,
            letterMap: letterMap,
          ),
          from: combinedListProvider,
          name: r'combinedListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$combinedListHash,
          dependencies: CombinedListFamily._dependencies,
          allTransitiveDependencies:
              CombinedListFamily._allTransitiveDependencies,
          numbers: numbers,
          letterMap: letterMap,
        );

  CombinedListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.numbers,
    required this.letterMap,
  }) : super.internal();

  final List<int> numbers;
  final Map<int, String> letterMap;

  @override
  Override overrideWith(
    List<String> Function(CombinedListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CombinedListProvider._internal(
        (ref) => create(ref as CombinedListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        numbers: numbers,
        letterMap: letterMap,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<String>> createElement() {
    return _CombinedListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CombinedListProvider &&
        other.numbers == numbers &&
        other.letterMap == letterMap;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, numbers.hashCode);
    hash = _SystemHash.combine(hash, letterMap.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CombinedListRef on AutoDisposeProviderRef<List<String>> {
  /// The parameter `numbers` of this provider.
  List<int> get numbers;

  /// The parameter `letterMap` of this provider.
  Map<int, String> get letterMap;
}

class _CombinedListProviderElement
    extends AutoDisposeProviderElement<List<String>> with CombinedListRef {
  _CombinedListProviderElement(super.provider);

  @override
  List<int> get numbers => (origin as CombinedListProvider).numbers;
  @override
  Map<int, String> get letterMap => (origin as CombinedListProvider).letterMap;
}

String _$getCrossAxisCountHash() => r'bdc676944c053dcff9659a2abdca69c8caedb4ee';

/// See also [getCrossAxisCount].
@ProviderFor(getCrossAxisCount)
const getCrossAxisCountProvider = GetCrossAxisCountFamily();

/// See also [getCrossAxisCount].
class GetCrossAxisCountFamily extends Family<int> {
  /// See also [getCrossAxisCount].
  const GetCrossAxisCountFamily();

  /// See also [getCrossAxisCount].
  GetCrossAxisCountProvider call({
    int? length = 10,
  }) {
    return GetCrossAxisCountProvider(
      length: length,
    );
  }

  @override
  GetCrossAxisCountProvider getProviderOverride(
    covariant GetCrossAxisCountProvider provider,
  ) {
    return call(
      length: provider.length,
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
  String? get name => r'getCrossAxisCountProvider';
}

/// See also [getCrossAxisCount].
class GetCrossAxisCountProvider extends AutoDisposeProvider<int> {
  /// See also [getCrossAxisCount].
  GetCrossAxisCountProvider({
    int? length = 10,
  }) : this._internal(
          (ref) => getCrossAxisCount(
            ref as GetCrossAxisCountRef,
            length: length,
          ),
          from: getCrossAxisCountProvider,
          name: r'getCrossAxisCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCrossAxisCountHash,
          dependencies: GetCrossAxisCountFamily._dependencies,
          allTransitiveDependencies:
              GetCrossAxisCountFamily._allTransitiveDependencies,
          length: length,
        );

  GetCrossAxisCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.length,
  }) : super.internal();

  final int? length;

  @override
  Override overrideWith(
    int Function(GetCrossAxisCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCrossAxisCountProvider._internal(
        (ref) => create(ref as GetCrossAxisCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        length: length,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<int> createElement() {
    return _GetCrossAxisCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCrossAxisCountProvider && other.length == length;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, length.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCrossAxisCountRef on AutoDisposeProviderRef<int> {
  /// The parameter `length` of this provider.
  int? get length;
}

class _GetCrossAxisCountProviderElement extends AutoDisposeProviderElement<int>
    with GetCrossAxisCountRef {
  _GetCrossAxisCountProviderElement(super.provider);

  @override
  int? get length => (origin as GetCrossAxisCountProvider).length;
}

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ResultsListStreamRef = AutoDisposeStreamProviderRef<List<Result>>;
String _$resultStreamHash() => r'c098d13013ef15064dda993c91b049e4bb6d6ec0';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ResultServiceRef = AutoDisposeProviderRef<ResultService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
