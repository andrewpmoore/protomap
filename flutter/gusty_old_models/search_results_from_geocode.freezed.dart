// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_results_from_geocode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchResultsFromGeocode _$SearchResultsFromGeocodeFromJson(
    Map<String, dynamic> json) {
  return _SearchResultsFromGeocode.fromJson(json);
}

/// @nodoc
mixin _$SearchResultsFromGeocode {
  String get lat => throw _privateConstructorUsedError;
  String get lon => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_id')
  int get placeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchResultsFromGeocodeCopyWith<SearchResultsFromGeocode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultsFromGeocodeCopyWith<$Res> {
  factory $SearchResultsFromGeocodeCopyWith(SearchResultsFromGeocode value,
          $Res Function(SearchResultsFromGeocode) then) =
      _$SearchResultsFromGeocodeCopyWithImpl<$Res, SearchResultsFromGeocode>;
  @useResult
  $Res call(
      {String lat,
      String lon,
      @JsonKey(name: 'display_name') String displayName,
      @JsonKey(name: 'place_id') int placeId});
}

/// @nodoc
class _$SearchResultsFromGeocodeCopyWithImpl<$Res,
        $Val extends SearchResultsFromGeocode>
    implements $SearchResultsFromGeocodeCopyWith<$Res> {
  _$SearchResultsFromGeocodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
    Object? displayName = null,
    Object? placeId = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchResultsFromGeocodeCopyWith<$Res>
    implements $SearchResultsFromGeocodeCopyWith<$Res> {
  factory _$$_SearchResultsFromGeocodeCopyWith(
          _$_SearchResultsFromGeocode value,
          $Res Function(_$_SearchResultsFromGeocode) then) =
      __$$_SearchResultsFromGeocodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String lat,
      String lon,
      @JsonKey(name: 'display_name') String displayName,
      @JsonKey(name: 'place_id') int placeId});
}

/// @nodoc
class __$$_SearchResultsFromGeocodeCopyWithImpl<$Res>
    extends _$SearchResultsFromGeocodeCopyWithImpl<$Res,
        _$_SearchResultsFromGeocode>
    implements _$$_SearchResultsFromGeocodeCopyWith<$Res> {
  __$$_SearchResultsFromGeocodeCopyWithImpl(_$_SearchResultsFromGeocode _value,
      $Res Function(_$_SearchResultsFromGeocode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
    Object? displayName = null,
    Object? placeId = null,
  }) {
    return _then(_$_SearchResultsFromGeocode(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchResultsFromGeocode implements _SearchResultsFromGeocode {
  const _$_SearchResultsFromGeocode(
      {required this.lat,
      required this.lon,
      @JsonKey(name: 'display_name') required this.displayName,
      @JsonKey(name: 'place_id') required this.placeId});

  factory _$_SearchResultsFromGeocode.fromJson(Map<String, dynamic> json) =>
      _$$_SearchResultsFromGeocodeFromJson(json);

  @override
  final String lat;
  @override
  final String lon;
  @override
  @JsonKey(name: 'display_name')
  final String displayName;
  @override
  @JsonKey(name: 'place_id')
  final int placeId;

  @override
  String toString() {
    return 'SearchResultsFromGeocode(lat: $lat, lon: $lon, displayName: $displayName, placeId: $placeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchResultsFromGeocode &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.placeId, placeId) || other.placeId == placeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lon, displayName, placeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchResultsFromGeocodeCopyWith<_$_SearchResultsFromGeocode>
      get copyWith => __$$_SearchResultsFromGeocodeCopyWithImpl<
          _$_SearchResultsFromGeocode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchResultsFromGeocodeToJson(
      this,
    );
  }
}

abstract class _SearchResultsFromGeocode implements SearchResultsFromGeocode {
  const factory _SearchResultsFromGeocode(
          {required final String lat,
          required final String lon,
          @JsonKey(name: 'display_name') required final String displayName,
          @JsonKey(name: 'place_id') required final int placeId}) =
      _$_SearchResultsFromGeocode;

  factory _SearchResultsFromGeocode.fromJson(Map<String, dynamic> json) =
      _$_SearchResultsFromGeocode.fromJson;

  @override
  String get lat;
  @override
  String get lon;
  @override
  @JsonKey(name: 'display_name')
  String get displayName;
  @override
  @JsonKey(name: 'place_id')
  int get placeId;
  @override
  @JsonKey(ignore: true)
  _$$_SearchResultsFromGeocodeCopyWith<_$_SearchResultsFromGeocode>
      get copyWith => throw _privateConstructorUsedError;
}
