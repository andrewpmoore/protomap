// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wunderground_search_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WundergroundSearchResults _$WundergroundSearchResultsFromJson(
    Map<String, dynamic> json) {
  return _WundergroundSearchResults.fromJson(json);
}

/// @nodoc
mixin _$WundergroundSearchResults {
  Location get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WundergroundSearchResultsCopyWith<WundergroundSearchResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WundergroundSearchResultsCopyWith<$Res> {
  factory $WundergroundSearchResultsCopyWith(WundergroundSearchResults value,
          $Res Function(WundergroundSearchResults) then) =
      _$WundergroundSearchResultsCopyWithImpl<$Res, WundergroundSearchResults>;
  @useResult
  $Res call({Location location});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$WundergroundSearchResultsCopyWithImpl<$Res,
        $Val extends WundergroundSearchResults>
    implements $WundergroundSearchResultsCopyWith<$Res> {
  _$WundergroundSearchResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WundergroundSearchResultsCopyWith<$Res>
    implements $WundergroundSearchResultsCopyWith<$Res> {
  factory _$$_WundergroundSearchResultsCopyWith(
          _$_WundergroundSearchResults value,
          $Res Function(_$_WundergroundSearchResults) then) =
      __$$_WundergroundSearchResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Location location});

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_WundergroundSearchResultsCopyWithImpl<$Res>
    extends _$WundergroundSearchResultsCopyWithImpl<$Res,
        _$_WundergroundSearchResults>
    implements _$$_WundergroundSearchResultsCopyWith<$Res> {
  __$$_WundergroundSearchResultsCopyWithImpl(
      _$_WundergroundSearchResults _value,
      $Res Function(_$_WundergroundSearchResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
  }) {
    return _then(_$_WundergroundSearchResults(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WundergroundSearchResults implements _WundergroundSearchResults {
  const _$_WundergroundSearchResults({required this.location});

  factory _$_WundergroundSearchResults.fromJson(Map<String, dynamic> json) =>
      _$$_WundergroundSearchResultsFromJson(json);

  @override
  final Location location;

  @override
  String toString() {
    return 'WundergroundSearchResults(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WundergroundSearchResults &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WundergroundSearchResultsCopyWith<_$_WundergroundSearchResults>
      get copyWith => __$$_WundergroundSearchResultsCopyWithImpl<
          _$_WundergroundSearchResults>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WundergroundSearchResultsToJson(
      this,
    );
  }
}

abstract class _WundergroundSearchResults implements WundergroundSearchResults {
  const factory _WundergroundSearchResults({required final Location location}) =
      _$_WundergroundSearchResults;

  factory _WundergroundSearchResults.fromJson(Map<String, dynamic> json) =
      _$_WundergroundSearchResults.fromJson;

  @override
  Location get location;
  @override
  @JsonKey(ignore: true)
  _$$_WundergroundSearchResultsCopyWith<_$_WundergroundSearchResults>
      get copyWith => throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
// required List<String> address,
// required List<String> adminDistrict,
// required List<String> adminDistrictCode,
  List<String> get city => throw _privateConstructorUsedError;
  List<String> get country =>
      throw _privateConstructorUsedError; // required List<String> countryCode,
  List<String> get displayName =>
      throw _privateConstructorUsedError; // required List<String> ianaTimeZone,
  List<double> get latitude =>
      throw _privateConstructorUsedError; // required List<Locale> locale,
  List<double> get longitude =>
      throw _privateConstructorUsedError; // required List<String> neighborhood,
// required List<String> placeId,
// required List<String> postalCode,
// required List<String> postalKey,
// required List<bool> disputedArea,
// required List<dynamic> disputedCountries,
// required List<dynamic> disputedCountryCodes,
// required List<dynamic> disputedCustomers,
// required List<List<bool>> disputedShowCountry,
// required List<String> iataCode,
// required List<String> icaoCode,
// required List<String> locId,
// required List<dynamic> locationCategory,
  List<String> get pwsId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call(
      {List<String> city,
      List<String> country,
      List<String> displayName,
      List<double> latitude,
      List<double> longitude,
      List<String> pwsId});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? country = null,
    Object? displayName = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? pwsId = null,
  }) {
    return _then(_value.copyWith(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as List<String>,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as List<String>,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as List<double>,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as List<double>,
      pwsId: null == pwsId
          ? _value.pwsId
          : pwsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$$_LocationCopyWith(
          _$_Location value, $Res Function(_$_Location) then) =
      __$$_LocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> city,
      List<String> country,
      List<String> displayName,
      List<double> latitude,
      List<double> longitude,
      List<String> pwsId});
}

/// @nodoc
class __$$_LocationCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$_Location>
    implements _$$_LocationCopyWith<$Res> {
  __$$_LocationCopyWithImpl(
      _$_Location _value, $Res Function(_$_Location) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? country = null,
    Object? displayName = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? pwsId = null,
  }) {
    return _then(_$_Location(
      city: null == city
          ? _value._city
          : city // ignore: cast_nullable_to_non_nullable
              as List<String>,
      country: null == country
          ? _value._country
          : country // ignore: cast_nullable_to_non_nullable
              as List<String>,
      displayName: null == displayName
          ? _value._displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      latitude: null == latitude
          ? _value._latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as List<double>,
      longitude: null == longitude
          ? _value._longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as List<double>,
      pwsId: null == pwsId
          ? _value._pwsId
          : pwsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Location implements _Location {
  const _$_Location(
      {required final List<String> city,
      required final List<String> country,
      required final List<String> displayName,
      required final List<double> latitude,
      required final List<double> longitude,
      required final List<String> pwsId})
      : _city = city,
        _country = country,
        _displayName = displayName,
        _latitude = latitude,
        _longitude = longitude,
        _pwsId = pwsId;

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

// required List<String> address,
// required List<String> adminDistrict,
// required List<String> adminDistrictCode,
  final List<String> _city;
// required List<String> address,
// required List<String> adminDistrict,
// required List<String> adminDistrictCode,
  @override
  List<String> get city {
    if (_city is EqualUnmodifiableListView) return _city;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_city);
  }

  final List<String> _country;
  @override
  List<String> get country {
    if (_country is EqualUnmodifiableListView) return _country;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_country);
  }

// required List<String> countryCode,
  final List<String> _displayName;
// required List<String> countryCode,
  @override
  List<String> get displayName {
    if (_displayName is EqualUnmodifiableListView) return _displayName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_displayName);
  }

// required List<String> ianaTimeZone,
  final List<double> _latitude;
// required List<String> ianaTimeZone,
  @override
  List<double> get latitude {
    if (_latitude is EqualUnmodifiableListView) return _latitude;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latitude);
  }

// required List<Locale> locale,
  final List<double> _longitude;
// required List<Locale> locale,
  @override
  List<double> get longitude {
    if (_longitude is EqualUnmodifiableListView) return _longitude;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_longitude);
  }

// required List<String> neighborhood,
// required List<String> placeId,
// required List<String> postalCode,
// required List<String> postalKey,
// required List<bool> disputedArea,
// required List<dynamic> disputedCountries,
// required List<dynamic> disputedCountryCodes,
// required List<dynamic> disputedCustomers,
// required List<List<bool>> disputedShowCountry,
// required List<String> iataCode,
// required List<String> icaoCode,
// required List<String> locId,
// required List<dynamic> locationCategory,
  final List<String> _pwsId;
// required List<String> neighborhood,
// required List<String> placeId,
// required List<String> postalCode,
// required List<String> postalKey,
// required List<bool> disputedArea,
// required List<dynamic> disputedCountries,
// required List<dynamic> disputedCountryCodes,
// required List<dynamic> disputedCustomers,
// required List<List<bool>> disputedShowCountry,
// required List<String> iataCode,
// required List<String> icaoCode,
// required List<String> locId,
// required List<dynamic> locationCategory,
  @override
  List<String> get pwsId {
    if (_pwsId is EqualUnmodifiableListView) return _pwsId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pwsId);
  }

  @override
  String toString() {
    return 'Location(city: $city, country: $country, displayName: $displayName, latitude: $latitude, longitude: $longitude, pwsId: $pwsId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Location &&
            const DeepCollectionEquality().equals(other._city, _city) &&
            const DeepCollectionEquality().equals(other._country, _country) &&
            const DeepCollectionEquality()
                .equals(other._displayName, _displayName) &&
            const DeepCollectionEquality().equals(other._latitude, _latitude) &&
            const DeepCollectionEquality()
                .equals(other._longitude, _longitude) &&
            const DeepCollectionEquality().equals(other._pwsId, _pwsId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_city),
      const DeepCollectionEquality().hash(_country),
      const DeepCollectionEquality().hash(_displayName),
      const DeepCollectionEquality().hash(_latitude),
      const DeepCollectionEquality().hash(_longitude),
      const DeepCollectionEquality().hash(_pwsId));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      __$$_LocationCopyWithImpl<_$_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {required final List<String> city,
      required final List<String> country,
      required final List<String> displayName,
      required final List<double> latitude,
      required final List<double> longitude,
      required final List<String> pwsId}) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override // required List<String> address,
// required List<String> adminDistrict,
// required List<String> adminDistrictCode,
  List<String> get city;
  @override
  List<String> get country;
  @override // required List<String> countryCode,
  List<String> get displayName;
  @override // required List<String> ianaTimeZone,
  List<double> get latitude;
  @override // required List<Locale> locale,
  List<double> get longitude;
  @override // required List<String> neighborhood,
// required List<String> placeId,
// required List<String> postalCode,
// required List<String> postalKey,
// required List<bool> disputedArea,
// required List<dynamic> disputedCountries,
// required List<dynamic> disputedCountryCodes,
// required List<dynamic> disputedCustomers,
// required List<List<bool>> disputedShowCountry,
// required List<String> iataCode,
// required List<String> icaoCode,
// required List<String> locId,
// required List<dynamic> locationCategory,
  List<String> get pwsId;
  @override
  @JsonKey(ignore: true)
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      throw _privateConstructorUsedError;
}

Locale _$LocaleFromJson(Map<String, dynamic> json) {
  return _Locale.fromJson(json);
}

/// @nodoc
mixin _$Locale {
  dynamic get locale1 => throw _privateConstructorUsedError;
  String get locale2 => throw _privateConstructorUsedError;
  dynamic get locale3 => throw _privateConstructorUsedError;
  String get locale4 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocaleCopyWith<Locale> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaleCopyWith<$Res> {
  factory $LocaleCopyWith(Locale value, $Res Function(Locale) then) =
      _$LocaleCopyWithImpl<$Res, Locale>;
  @useResult
  $Res call({dynamic locale1, String locale2, dynamic locale3, String locale4});
}

/// @nodoc
class _$LocaleCopyWithImpl<$Res, $Val extends Locale>
    implements $LocaleCopyWith<$Res> {
  _$LocaleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale1 = freezed,
    Object? locale2 = null,
    Object? locale3 = freezed,
    Object? locale4 = null,
  }) {
    return _then(_value.copyWith(
      locale1: freezed == locale1
          ? _value.locale1
          : locale1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      locale2: null == locale2
          ? _value.locale2
          : locale2 // ignore: cast_nullable_to_non_nullable
              as String,
      locale3: freezed == locale3
          ? _value.locale3
          : locale3 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      locale4: null == locale4
          ? _value.locale4
          : locale4 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocaleCopyWith<$Res> implements $LocaleCopyWith<$Res> {
  factory _$$_LocaleCopyWith(_$_Locale value, $Res Function(_$_Locale) then) =
      __$$_LocaleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic locale1, String locale2, dynamic locale3, String locale4});
}

/// @nodoc
class __$$_LocaleCopyWithImpl<$Res>
    extends _$LocaleCopyWithImpl<$Res, _$_Locale>
    implements _$$_LocaleCopyWith<$Res> {
  __$$_LocaleCopyWithImpl(_$_Locale _value, $Res Function(_$_Locale) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale1 = freezed,
    Object? locale2 = null,
    Object? locale3 = freezed,
    Object? locale4 = null,
  }) {
    return _then(_$_Locale(
      locale1: freezed == locale1
          ? _value.locale1
          : locale1 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      locale2: null == locale2
          ? _value.locale2
          : locale2 // ignore: cast_nullable_to_non_nullable
              as String,
      locale3: freezed == locale3
          ? _value.locale3
          : locale3 // ignore: cast_nullable_to_non_nullable
              as dynamic,
      locale4: null == locale4
          ? _value.locale4
          : locale4 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Locale implements _Locale {
  const _$_Locale(
      {required this.locale1,
      required this.locale2,
      required this.locale3,
      required this.locale4});

  factory _$_Locale.fromJson(Map<String, dynamic> json) =>
      _$$_LocaleFromJson(json);

  @override
  final dynamic locale1;
  @override
  final String locale2;
  @override
  final dynamic locale3;
  @override
  final String locale4;

  @override
  String toString() {
    return 'Locale(locale1: $locale1, locale2: $locale2, locale3: $locale3, locale4: $locale4)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Locale &&
            const DeepCollectionEquality().equals(other.locale1, locale1) &&
            (identical(other.locale2, locale2) || other.locale2 == locale2) &&
            const DeepCollectionEquality().equals(other.locale3, locale3) &&
            (identical(other.locale4, locale4) || other.locale4 == locale4));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(locale1),
      locale2,
      const DeepCollectionEquality().hash(locale3),
      locale4);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocaleCopyWith<_$_Locale> get copyWith =>
      __$$_LocaleCopyWithImpl<_$_Locale>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocaleToJson(
      this,
    );
  }
}

abstract class _Locale implements Locale {
  const factory _Locale(
      {required final dynamic locale1,
      required final String locale2,
      required final dynamic locale3,
      required final String locale4}) = _$_Locale;

  factory _Locale.fromJson(Map<String, dynamic> json) = _$_Locale.fromJson;

  @override
  dynamic get locale1;
  @override
  String get locale2;
  @override
  dynamic get locale3;
  @override
  String get locale4;
  @override
  @JsonKey(ignore: true)
  _$$_LocaleCopyWith<_$_Locale> get copyWith =>
      throw _privateConstructorUsedError;
}
