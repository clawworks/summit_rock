// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  String get id => throw _privateConstructorUsedError;
  List<int> get numbers => throw _privateConstructorUsedError;
  List<Combination> get outsideCombinations =>
      throw _privateConstructorUsedError;
  List<Combination> get middleCombinations =>
      throw _privateConstructorUsedError;
  List<Combination> get insideCombinations =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call(
      {String id,
      List<int> numbers,
      List<Combination> outsideCombinations,
      List<Combination> middleCombinations,
      List<Combination> insideCombinations,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numbers = null,
    Object? outsideCombinations = null,
    Object? middleCombinations = null,
    Object? insideCombinations = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      numbers: null == numbers
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      outsideCombinations: null == outsideCombinations
          ? _value.outsideCombinations
          : outsideCombinations // ignore: cast_nullable_to_non_nullable
              as List<Combination>,
      middleCombinations: null == middleCombinations
          ? _value.middleCombinations
          : middleCombinations // ignore: cast_nullable_to_non_nullable
              as List<Combination>,
      insideCombinations: null == insideCombinations
          ? _value.insideCombinations
          : insideCombinations // ignore: cast_nullable_to_non_nullable
              as List<Combination>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultImplCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$ResultImplCopyWith(
          _$ResultImpl value, $Res Function(_$ResultImpl) then) =
      __$$ResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<int> numbers,
      List<Combination> outsideCombinations,
      List<Combination> middleCombinations,
      List<Combination> insideCombinations,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$ResultImplCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$ResultImpl>
    implements _$$ResultImplCopyWith<$Res> {
  __$$ResultImplCopyWithImpl(
      _$ResultImpl _value, $Res Function(_$ResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numbers = null,
    Object? outsideCombinations = null,
    Object? middleCombinations = null,
    Object? insideCombinations = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      numbers: null == numbers
          ? _value._numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      outsideCombinations: null == outsideCombinations
          ? _value._outsideCombinations
          : outsideCombinations // ignore: cast_nullable_to_non_nullable
              as List<Combination>,
      middleCombinations: null == middleCombinations
          ? _value._middleCombinations
          : middleCombinations // ignore: cast_nullable_to_non_nullable
              as List<Combination>,
      insideCombinations: null == insideCombinations
          ? _value._insideCombinations
          : insideCombinations // ignore: cast_nullable_to_non_nullable
              as List<Combination>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultImpl implements _Result {
  const _$ResultImpl(
      {required this.id,
      required final List<int> numbers,
      required final List<Combination> outsideCombinations,
      required final List<Combination> middleCombinations,
      required final List<Combination> insideCombinations,
      required this.createdAt,
      required this.updatedAt})
      : _numbers = numbers,
        _outsideCombinations = outsideCombinations,
        _middleCombinations = middleCombinations,
        _insideCombinations = insideCombinations;

  factory _$ResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultImplFromJson(json);

  @override
  final String id;
  final List<int> _numbers;
  @override
  List<int> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  final List<Combination> _outsideCombinations;
  @override
  List<Combination> get outsideCombinations {
    if (_outsideCombinations is EqualUnmodifiableListView)
      return _outsideCombinations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outsideCombinations);
  }

  final List<Combination> _middleCombinations;
  @override
  List<Combination> get middleCombinations {
    if (_middleCombinations is EqualUnmodifiableListView)
      return _middleCombinations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_middleCombinations);
  }

  final List<Combination> _insideCombinations;
  @override
  List<Combination> get insideCombinations {
    if (_insideCombinations is EqualUnmodifiableListView)
      return _insideCombinations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insideCombinations);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Result(id: $id, numbers: $numbers, outsideCombinations: $outsideCombinations, middleCombinations: $middleCombinations, insideCombinations: $insideCombinations, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            const DeepCollectionEquality()
                .equals(other._outsideCombinations, _outsideCombinations) &&
            const DeepCollectionEquality()
                .equals(other._middleCombinations, _middleCombinations) &&
            const DeepCollectionEquality()
                .equals(other._insideCombinations, _insideCombinations) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_numbers),
      const DeepCollectionEquality().hash(_outsideCombinations),
      const DeepCollectionEquality().hash(_middleCombinations),
      const DeepCollectionEquality().hash(_insideCombinations),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      __$$ResultImplCopyWithImpl<_$ResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultImplToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  const factory _Result(
      {required final String id,
      required final List<int> numbers,
      required final List<Combination> outsideCombinations,
      required final List<Combination> middleCombinations,
      required final List<Combination> insideCombinations,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$ResultImpl;

  factory _Result.fromJson(Map<String, dynamic> json) = _$ResultImpl.fromJson;

  @override
  String get id;
  @override
  List<int> get numbers;
  @override
  List<Combination> get outsideCombinations;
  @override
  List<Combination> get middleCombinations;
  @override
  List<Combination> get insideCombinations;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
