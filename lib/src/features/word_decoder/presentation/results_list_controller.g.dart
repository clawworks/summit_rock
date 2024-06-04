// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listContainsFavoriteHash() =>
    r'fe2f30dc7f81ee3aef5603578e6be3c9208b1a3d';

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

/// See also [listContainsFavorite].
@ProviderFor(listContainsFavorite)
const listContainsFavoriteProvider = ListContainsFavoriteFamily();

/// See also [listContainsFavorite].
class ListContainsFavoriteFamily extends Family<bool> {
  /// See also [listContainsFavorite].
  const ListContainsFavoriteFamily();

  /// See also [listContainsFavorite].
  ListContainsFavoriteProvider call(
    List<String> words,
    List<String> favorites,
  ) {
    return ListContainsFavoriteProvider(
      words,
      favorites,
    );
  }

  @override
  ListContainsFavoriteProvider getProviderOverride(
    covariant ListContainsFavoriteProvider provider,
  ) {
    return call(
      provider.words,
      provider.favorites,
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
  String? get name => r'listContainsFavoriteProvider';
}

/// See also [listContainsFavorite].
class ListContainsFavoriteProvider extends AutoDisposeProvider<bool> {
  /// See also [listContainsFavorite].
  ListContainsFavoriteProvider(
    List<String> words,
    List<String> favorites,
  ) : this._internal(
          (ref) => listContainsFavorite(
            ref as ListContainsFavoriteRef,
            words,
            favorites,
          ),
          from: listContainsFavoriteProvider,
          name: r'listContainsFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listContainsFavoriteHash,
          dependencies: ListContainsFavoriteFamily._dependencies,
          allTransitiveDependencies:
              ListContainsFavoriteFamily._allTransitiveDependencies,
          words: words,
          favorites: favorites,
        );

  ListContainsFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.words,
    required this.favorites,
  }) : super.internal();

  final List<String> words;
  final List<String> favorites;

  @override
  Override overrideWith(
    bool Function(ListContainsFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListContainsFavoriteProvider._internal(
        (ref) => create(ref as ListContainsFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        words: words,
        favorites: favorites,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _ListContainsFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListContainsFavoriteProvider &&
        other.words == words &&
        other.favorites == favorites;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, words.hashCode);
    hash = _SystemHash.combine(hash, favorites.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListContainsFavoriteRef on AutoDisposeProviderRef<bool> {
  /// The parameter `words` of this provider.
  List<String> get words;

  /// The parameter `favorites` of this provider.
  List<String> get favorites;
}

class _ListContainsFavoriteProviderElement
    extends AutoDisposeProviderElement<bool> with ListContainsFavoriteRef {
  _ListContainsFavoriteProviderElement(super.provider);

  @override
  List<String> get words => (origin as ListContainsFavoriteProvider).words;
  @override
  List<String> get favorites =>
      (origin as ListContainsFavoriteProvider).favorites;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
