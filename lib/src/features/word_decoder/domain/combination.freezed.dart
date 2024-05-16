// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Combination _$CombinationFromJson(Map<String, dynamic> json) {
  return _Combination.fromJson(json);
}

/// @nodoc
mixin _$Combination {
  String get word => throw _privateConstructorUsedError;
  bool get favorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CombinationCopyWith<Combination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CombinationCopyWith<$Res> {
  factory $CombinationCopyWith(
          Combination value, $Res Function(Combination) then) =
      _$CombinationCopyWithImpl<$Res, Combination>;
  @useResult
  $Res call({String word, bool favorite});
}

/// @nodoc
class _$CombinationCopyWithImpl<$Res, $Val extends Combination>
    implements $CombinationCopyWith<$Res> {
  _$CombinationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? favorite = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CombinationImplCopyWith<$Res>
    implements $CombinationCopyWith<$Res> {
  factory _$$CombinationImplCopyWith(
          _$CombinationImpl value, $Res Function(_$CombinationImpl) then) =
      __$$CombinationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String word, bool favorite});
}

/// @nodoc
class __$$CombinationImplCopyWithImpl<$Res>
    extends _$CombinationCopyWithImpl<$Res, _$CombinationImpl>
    implements _$$CombinationImplCopyWith<$Res> {
  __$$CombinationImplCopyWithImpl(
      _$CombinationImpl _value, $Res Function(_$CombinationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? favorite = null,
  }) {
    return _then(_$CombinationImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CombinationImpl implements _Combination {
  const _$CombinationImpl({required this.word, required this.favorite});

  factory _$CombinationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CombinationImplFromJson(json);

  @override
  final String word;
  @override
  final bool favorite;

  @override
  String toString() {
    return 'Combination(word: $word, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CombinationImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, word, favorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CombinationImplCopyWith<_$CombinationImpl> get copyWith =>
      __$$CombinationImplCopyWithImpl<_$CombinationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CombinationImplToJson(
      this,
    );
  }
}

abstract class _Combination implements Combination {
  const factory _Combination(
      {required final String word,
      required final bool favorite}) = _$CombinationImpl;

  factory _Combination.fromJson(Map<String, dynamic> json) =
      _$CombinationImpl.fromJson;

  @override
  String get word;
  @override
  bool get favorite;
  @override
  @JsonKey(ignore: true)
  _$$CombinationImplCopyWith<_$CombinationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
