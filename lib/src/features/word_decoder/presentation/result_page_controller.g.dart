// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_page_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isWordFavoriteHash() => r'd29516d206a465e77fcdb25d320eb20b4ef2da32';

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

/// See also [isWordFavorite].
@ProviderFor(isWordFavorite)
const isWordFavoriteProvider = IsWordFavoriteFamily();

/// See also [isWordFavorite].
class IsWordFavoriteFamily extends Family<AsyncValue<bool>> {
  /// See also [isWordFavorite].
  const IsWordFavoriteFamily();

  /// See also [isWordFavorite].
  IsWordFavoriteProvider call(
    String resultId,
    String word,
  ) {
    return IsWordFavoriteProvider(
      resultId,
      word,
    );
  }

  @override
  IsWordFavoriteProvider getProviderOverride(
    covariant IsWordFavoriteProvider provider,
  ) {
    return call(
      provider.resultId,
      provider.word,
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
  String? get name => r'isWordFavoriteProvider';
}

/// See also [isWordFavorite].
class IsWordFavoriteProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [isWordFavorite].
  IsWordFavoriteProvider(
    String resultId,
    String word,
  ) : this._internal(
          (ref) => isWordFavorite(
            ref as IsWordFavoriteRef,
            resultId,
            word,
          ),
          from: isWordFavoriteProvider,
          name: r'isWordFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isWordFavoriteHash,
          dependencies: IsWordFavoriteFamily._dependencies,
          allTransitiveDependencies:
              IsWordFavoriteFamily._allTransitiveDependencies,
          resultId: resultId,
          word: word,
        );

  IsWordFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.resultId,
    required this.word,
  }) : super.internal();

  final String resultId;
  final String word;

  @override
  Override overrideWith(
    FutureOr<bool> Function(IsWordFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsWordFavoriteProvider._internal(
        (ref) => create(ref as IsWordFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        resultId: resultId,
        word: word,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _IsWordFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsWordFavoriteProvider &&
        other.resultId == resultId &&
        other.word == word;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, resultId.hashCode);
    hash = _SystemHash.combine(hash, word.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsWordFavoriteRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `resultId` of this provider.
  String get resultId;

  /// The parameter `word` of this provider.
  String get word;
}

class _IsWordFavoriteProviderElement
    extends AutoDisposeFutureProviderElement<bool> with IsWordFavoriteRef {
  _IsWordFavoriteProviderElement(super.provider);

  @override
  String get resultId => (origin as IsWordFavoriteProvider).resultId;
  @override
  String get word => (origin as IsWordFavoriteProvider).word;
}

String _$resultPageControllerHash() =>
    r'709955ae99789954632dde7a76d758e52d946d6e';

abstract class _$ResultPageController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String resultId;

  FutureOr<void> build(
    String resultId,
  );
}

/// See also [ResultPageController].
@ProviderFor(ResultPageController)
const resultPageControllerProvider = ResultPageControllerFamily();

/// See also [ResultPageController].
class ResultPageControllerFamily extends Family<AsyncValue<void>> {
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
class ResultPageControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ResultPageController, void> {
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
  FutureOr<void> runNotifierBuild(
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
  AutoDisposeAsyncNotifierProviderElement<ResultPageController, void>
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ResultPageControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `resultId` of this provider.
  String get resultId;
}

class _ResultPageControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ResultPageController, void>
    with ResultPageControllerRef {
  _ResultPageControllerProviderElement(super.provider);

  @override
  String get resultId => (origin as ResultPageControllerProvider).resultId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
