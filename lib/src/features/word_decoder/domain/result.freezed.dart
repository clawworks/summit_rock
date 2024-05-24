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
  List<String> get favorites => throw _privateConstructorUsedError;
  List<String> get outsideWords => throw _privateConstructorUsedError;
  List<String> get middleWords => throw _privateConstructorUsedError;
  List<String> get insideWords => throw _privateConstructorUsedError;
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
      List<String> favorites,
      List<String> outsideWords,
      List<String> middleWords,
      List<String> insideWords,
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
    Object? favorites = null,
    Object? outsideWords = null,
    Object? middleWords = null,
    Object? insideWords = null,
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
      favorites: null == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<String>,
      outsideWords: null == outsideWords
          ? _value.outsideWords
          : outsideWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      middleWords: null == middleWords
          ? _value.middleWords
          : middleWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      insideWords: null == insideWords
          ? _value.insideWords
          : insideWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      List<String> favorites,
      List<String> outsideWords,
      List<String> middleWords,
      List<String> insideWords,
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
    Object? favorites = null,
    Object? outsideWords = null,
    Object? middleWords = null,
    Object? insideWords = null,
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
      favorites: null == favorites
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<String>,
      outsideWords: null == outsideWords
          ? _value._outsideWords
          : outsideWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      middleWords: null == middleWords
          ? _value._middleWords
          : middleWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      insideWords: null == insideWords
          ? _value._insideWords
          : insideWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      required final List<String> favorites,
      required final List<String> outsideWords,
      required final List<String> middleWords,
      required final List<String> insideWords,
      required this.createdAt,
      required this.updatedAt})
      : _numbers = numbers,
        _favorites = favorites,
        _outsideWords = outsideWords,
        _middleWords = middleWords,
        _insideWords = insideWords;

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

  final List<String> _favorites;
  @override
  List<String> get favorites {
    if (_favorites is EqualUnmodifiableListView) return _favorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  final List<String> _outsideWords;
  @override
  List<String> get outsideWords {
    if (_outsideWords is EqualUnmodifiableListView) return _outsideWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outsideWords);
  }

  final List<String> _middleWords;
  @override
  List<String> get middleWords {
    if (_middleWords is EqualUnmodifiableListView) return _middleWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_middleWords);
  }

  final List<String> _insideWords;
  @override
  List<String> get insideWords {
    if (_insideWords is EqualUnmodifiableListView) return _insideWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insideWords);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Result(id: $id, numbers: $numbers, favorites: $favorites, outsideWords: $outsideWords, middleWords: $middleWords, insideWords: $insideWords, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites) &&
            const DeepCollectionEquality()
                .equals(other._outsideWords, _outsideWords) &&
            const DeepCollectionEquality()
                .equals(other._middleWords, _middleWords) &&
            const DeepCollectionEquality()
                .equals(other._insideWords, _insideWords) &&
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
      const DeepCollectionEquality().hash(_favorites),
      const DeepCollectionEquality().hash(_outsideWords),
      const DeepCollectionEquality().hash(_middleWords),
      const DeepCollectionEquality().hash(_insideWords),
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
      required final List<String> favorites,
      required final List<String> outsideWords,
      required final List<String> middleWords,
      required final List<String> insideWords,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$ResultImpl;

  factory _Result.fromJson(Map<String, dynamic> json) = _$ResultImpl.fromJson;

  @override
  String get id;
  @override
  List<int> get numbers;
  @override
  List<String> get favorites;
  @override
  List<String> get outsideWords;
  @override
  List<String> get middleWords;
  @override
  List<String> get insideWords;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
