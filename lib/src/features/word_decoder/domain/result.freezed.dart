// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Result {
  ResultId get id;
  SummitRockYear get year;
  List<int> get numbers;
  Map<int, String> get letterMap;
  List<String> get favorites;
  Map<DecodedList, List<String>> get decodedWords;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResultCopyWith<Result> get copyWith =>
      _$ResultCopyWithImpl<Result>(this as Result, _$identity);

  /// Serializes this Result to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Result &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.year, year) || other.year == year) &&
            const DeepCollectionEquality().equals(other.numbers, numbers) &&
            const DeepCollectionEquality().equals(other.letterMap, letterMap) &&
            const DeepCollectionEquality().equals(other.favorites, favorites) &&
            const DeepCollectionEquality()
                .equals(other.decodedWords, decodedWords) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      year,
      const DeepCollectionEquality().hash(numbers),
      const DeepCollectionEquality().hash(letterMap),
      const DeepCollectionEquality().hash(favorites),
      const DeepCollectionEquality().hash(decodedWords),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Result(id: $id, year: $year, numbers: $numbers, letterMap: $letterMap, favorites: $favorites, decodedWords: $decodedWords, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) _then) =
      _$ResultCopyWithImpl;
  @useResult
  $Res call(
      {ResultId id,
      SummitRockYear year,
      List<int> numbers,
      Map<int, String> letterMap,
      List<String> favorites,
      Map<DecodedList, List<String>> decodedWords,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ResultCopyWithImpl<$Res> implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._self, this._then);

  final Result _self;
  final $Res Function(Result) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? year = null,
    Object? numbers = null,
    Object? letterMap = null,
    Object? favorites = null,
    Object? decodedWords = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as ResultId,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as SummitRockYear,
      numbers: null == numbers
          ? _self.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      letterMap: null == letterMap
          ? _self.letterMap
          : letterMap // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      favorites: null == favorites
          ? _self.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<String>,
      decodedWords: null == decodedWords
          ? _self.decodedWords
          : decodedWords // ignore: cast_nullable_to_non_nullable
              as Map<DecodedList, List<String>>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Result extends Result {
  const _Result(
      {required this.id,
      this.year = SummitRockYear.twentyFour,
      required final List<int> numbers,
      required final Map<int, String> letterMap,
      required final List<String> favorites,
      required final Map<DecodedList, List<String>> decodedWords,
      required this.createdAt,
      required this.updatedAt})
      : _numbers = numbers,
        _letterMap = letterMap,
        _favorites = favorites,
        _decodedWords = decodedWords,
        super._();
  factory _Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  @override
  final ResultId id;
  @override
  @JsonKey()
  final SummitRockYear year;
  final List<int> _numbers;
  @override
  List<int> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  final Map<int, String> _letterMap;
  @override
  Map<int, String> get letterMap {
    if (_letterMap is EqualUnmodifiableMapView) return _letterMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_letterMap);
  }

  final List<String> _favorites;
  @override
  List<String> get favorites {
    if (_favorites is EqualUnmodifiableListView) return _favorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  final Map<DecodedList, List<String>> _decodedWords;
  @override
  Map<DecodedList, List<String>> get decodedWords {
    if (_decodedWords is EqualUnmodifiableMapView) return _decodedWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_decodedWords);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResultCopyWith<_Result> get copyWith =>
      __$ResultCopyWithImpl<_Result>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Result &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.year, year) || other.year == year) &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            const DeepCollectionEquality()
                .equals(other._letterMap, _letterMap) &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites) &&
            const DeepCollectionEquality()
                .equals(other._decodedWords, _decodedWords) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      year,
      const DeepCollectionEquality().hash(_numbers),
      const DeepCollectionEquality().hash(_letterMap),
      const DeepCollectionEquality().hash(_favorites),
      const DeepCollectionEquality().hash(_decodedWords),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Result(id: $id, year: $year, numbers: $numbers, letterMap: $letterMap, favorites: $favorites, decodedWords: $decodedWords, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$ResultCopyWith(_Result value, $Res Function(_Result) _then) =
      __$ResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ResultId id,
      SummitRockYear year,
      List<int> numbers,
      Map<int, String> letterMap,
      List<String> favorites,
      Map<DecodedList, List<String>> decodedWords,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$ResultCopyWithImpl<$Res> implements _$ResultCopyWith<$Res> {
  __$ResultCopyWithImpl(this._self, this._then);

  final _Result _self;
  final $Res Function(_Result) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? year = null,
    Object? numbers = null,
    Object? letterMap = null,
    Object? favorites = null,
    Object? decodedWords = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_Result(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as ResultId,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as SummitRockYear,
      numbers: null == numbers
          ? _self._numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      letterMap: null == letterMap
          ? _self._letterMap
          : letterMap // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      favorites: null == favorites
          ? _self._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<String>,
      decodedWords: null == decodedWords
          ? _self._decodedWords
          : decodedWords // ignore: cast_nullable_to_non_nullable
              as Map<DecodedList, List<String>>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
