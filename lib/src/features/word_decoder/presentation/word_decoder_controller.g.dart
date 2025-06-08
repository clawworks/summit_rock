// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_decoder_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$specialIndexesHash() => r'5e6f165194a089d1937fe38e826c0e08189c7013';

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

/// See also [specialIndexes].
@ProviderFor(specialIndexes)
const specialIndexesProvider = SpecialIndexesFamily();

/// See also [specialIndexes].
class SpecialIndexesFamily extends Family<List<int>> {
  /// See also [specialIndexes].
  const SpecialIndexesFamily();

  /// See also [specialIndexes].
  SpecialIndexesProvider call({
    required SummitRockYear year,
  }) {
    return SpecialIndexesProvider(
      year: year,
    );
  }

  @override
  SpecialIndexesProvider getProviderOverride(
    covariant SpecialIndexesProvider provider,
  ) {
    return call(
      year: provider.year,
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
  String? get name => r'specialIndexesProvider';
}

/// See also [specialIndexes].
class SpecialIndexesProvider extends AutoDisposeProvider<List<int>> {
  /// See also [specialIndexes].
  SpecialIndexesProvider({
    required SummitRockYear year,
  }) : this._internal(
          (ref) => specialIndexes(
            ref as SpecialIndexesRef,
            year: year,
          ),
          from: specialIndexesProvider,
          name: r'specialIndexesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$specialIndexesHash,
          dependencies: SpecialIndexesFamily._dependencies,
          allTransitiveDependencies:
              SpecialIndexesFamily._allTransitiveDependencies,
          year: year,
        );

  SpecialIndexesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.year,
  }) : super.internal();

  final SummitRockYear year;

  @override
  Override overrideWith(
    List<int> Function(SpecialIndexesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SpecialIndexesProvider._internal(
        (ref) => create(ref as SpecialIndexesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        year: year,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<int>> createElement() {
    return _SpecialIndexesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SpecialIndexesProvider && other.year == year;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SpecialIndexesRef on AutoDisposeProviderRef<List<int>> {
  /// The parameter `year` of this provider.
  SummitRockYear get year;
}

class _SpecialIndexesProviderElement
    extends AutoDisposeProviderElement<List<int>> with SpecialIndexesRef {
  _SpecialIndexesProviderElement(super.provider);

  @override
  SummitRockYear get year => (origin as SpecialIndexesProvider).year;
}

String _$wordDecoderControllerHash() =>
    r'7699979913f4e5002fdabfa328df6470562b6ad8';

/// See also [WordDecoderController].
@ProviderFor(WordDecoderController)
final wordDecoderControllerProvider =
    AsyncNotifierProvider<WordDecoderController, void>.internal(
  WordDecoderController.new,
  name: r'wordDecoderControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$wordDecoderControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WordDecoderController = AsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
