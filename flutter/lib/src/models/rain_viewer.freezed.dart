// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rain_viewer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RainViewer _$RainViewerFromJson(Map<String, dynamic> json) {
  return _RainViewer.fromJson(json);
}

/// @nodoc
mixin _$RainViewer {
  String get version => throw _privateConstructorUsedError;
  int get generated => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  Radar get radar => throw _privateConstructorUsedError;
  Satellite get satellite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RainViewerCopyWith<RainViewer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RainViewerCopyWith<$Res> {
  factory $RainViewerCopyWith(
          RainViewer value, $Res Function(RainViewer) then) =
      _$RainViewerCopyWithImpl<$Res, RainViewer>;
  @useResult
  $Res call(
      {String version,
      int generated,
      String host,
      Radar radar,
      Satellite satellite});

  $RadarCopyWith<$Res> get radar;
  $SatelliteCopyWith<$Res> get satellite;
}

/// @nodoc
class _$RainViewerCopyWithImpl<$Res, $Val extends RainViewer>
    implements $RainViewerCopyWith<$Res> {
  _$RainViewerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? generated = null,
    Object? host = null,
    Object? radar = null,
    Object? satellite = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      generated: null == generated
          ? _value.generated
          : generated // ignore: cast_nullable_to_non_nullable
              as int,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      radar: null == radar
          ? _value.radar
          : radar // ignore: cast_nullable_to_non_nullable
              as Radar,
      satellite: null == satellite
          ? _value.satellite
          : satellite // ignore: cast_nullable_to_non_nullable
              as Satellite,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RadarCopyWith<$Res> get radar {
    return $RadarCopyWith<$Res>(_value.radar, (value) {
      return _then(_value.copyWith(radar: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SatelliteCopyWith<$Res> get satellite {
    return $SatelliteCopyWith<$Res>(_value.satellite, (value) {
      return _then(_value.copyWith(satellite: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RainViewerCopyWith<$Res>
    implements $RainViewerCopyWith<$Res> {
  factory _$$_RainViewerCopyWith(
          _$_RainViewer value, $Res Function(_$_RainViewer) then) =
      __$$_RainViewerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String version,
      int generated,
      String host,
      Radar radar,
      Satellite satellite});

  @override
  $RadarCopyWith<$Res> get radar;
  @override
  $SatelliteCopyWith<$Res> get satellite;
}

/// @nodoc
class __$$_RainViewerCopyWithImpl<$Res>
    extends _$RainViewerCopyWithImpl<$Res, _$_RainViewer>
    implements _$$_RainViewerCopyWith<$Res> {
  __$$_RainViewerCopyWithImpl(
      _$_RainViewer _value, $Res Function(_$_RainViewer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? generated = null,
    Object? host = null,
    Object? radar = null,
    Object? satellite = null,
  }) {
    return _then(_$_RainViewer(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      generated: null == generated
          ? _value.generated
          : generated // ignore: cast_nullable_to_non_nullable
              as int,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      radar: null == radar
          ? _value.radar
          : radar // ignore: cast_nullable_to_non_nullable
              as Radar,
      satellite: null == satellite
          ? _value.satellite
          : satellite // ignore: cast_nullable_to_non_nullable
              as Satellite,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RainViewer implements _RainViewer {
  const _$_RainViewer(
      {required this.version,
      required this.generated,
      required this.host,
      required this.radar,
      required this.satellite});

  factory _$_RainViewer.fromJson(Map<String, dynamic> json) =>
      _$$_RainViewerFromJson(json);

  @override
  final String version;
  @override
  final int generated;
  @override
  final String host;
  @override
  final Radar radar;
  @override
  final Satellite satellite;

  @override
  String toString() {
    return 'RainViewer(version: $version, generated: $generated, host: $host, radar: $radar, satellite: $satellite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RainViewer &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.generated, generated) ||
                other.generated == generated) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.radar, radar) || other.radar == radar) &&
            (identical(other.satellite, satellite) ||
                other.satellite == satellite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, version, generated, host, radar, satellite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RainViewerCopyWith<_$_RainViewer> get copyWith =>
      __$$_RainViewerCopyWithImpl<_$_RainViewer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RainViewerToJson(
      this,
    );
  }
}

abstract class _RainViewer implements RainViewer {
  const factory _RainViewer(
      {required final String version,
      required final int generated,
      required final String host,
      required final Radar radar,
      required final Satellite satellite}) = _$_RainViewer;

  factory _RainViewer.fromJson(Map<String, dynamic> json) =
      _$_RainViewer.fromJson;

  @override
  String get version;
  @override
  int get generated;
  @override
  String get host;
  @override
  Radar get radar;
  @override
  Satellite get satellite;
  @override
  @JsonKey(ignore: true)
  _$$_RainViewerCopyWith<_$_RainViewer> get copyWith =>
      throw _privateConstructorUsedError;
}

Radar _$RadarFromJson(Map<String, dynamic> json) {
  return _Radar.fromJson(json);
}

/// @nodoc
mixin _$Radar {
  List<Nowcast> get past => throw _privateConstructorUsedError;
  List<Nowcast> get nowcast => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RadarCopyWith<Radar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadarCopyWith<$Res> {
  factory $RadarCopyWith(Radar value, $Res Function(Radar) then) =
      _$RadarCopyWithImpl<$Res, Radar>;
  @useResult
  $Res call({List<Nowcast> past, List<Nowcast> nowcast});
}

/// @nodoc
class _$RadarCopyWithImpl<$Res, $Val extends Radar>
    implements $RadarCopyWith<$Res> {
  _$RadarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? past = null,
    Object? nowcast = null,
  }) {
    return _then(_value.copyWith(
      past: null == past
          ? _value.past
          : past // ignore: cast_nullable_to_non_nullable
              as List<Nowcast>,
      nowcast: null == nowcast
          ? _value.nowcast
          : nowcast // ignore: cast_nullable_to_non_nullable
              as List<Nowcast>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RadarCopyWith<$Res> implements $RadarCopyWith<$Res> {
  factory _$$_RadarCopyWith(_$_Radar value, $Res Function(_$_Radar) then) =
      __$$_RadarCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Nowcast> past, List<Nowcast> nowcast});
}

/// @nodoc
class __$$_RadarCopyWithImpl<$Res> extends _$RadarCopyWithImpl<$Res, _$_Radar>
    implements _$$_RadarCopyWith<$Res> {
  __$$_RadarCopyWithImpl(_$_Radar _value, $Res Function(_$_Radar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? past = null,
    Object? nowcast = null,
  }) {
    return _then(_$_Radar(
      past: null == past
          ? _value._past
          : past // ignore: cast_nullable_to_non_nullable
              as List<Nowcast>,
      nowcast: null == nowcast
          ? _value._nowcast
          : nowcast // ignore: cast_nullable_to_non_nullable
              as List<Nowcast>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Radar implements _Radar {
  const _$_Radar(
      {required final List<Nowcast> past, required final List<Nowcast> nowcast})
      : _past = past,
        _nowcast = nowcast;

  factory _$_Radar.fromJson(Map<String, dynamic> json) =>
      _$$_RadarFromJson(json);

  final List<Nowcast> _past;
  @override
  List<Nowcast> get past {
    if (_past is EqualUnmodifiableListView) return _past;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_past);
  }

  final List<Nowcast> _nowcast;
  @override
  List<Nowcast> get nowcast {
    if (_nowcast is EqualUnmodifiableListView) return _nowcast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nowcast);
  }

  @override
  String toString() {
    return 'Radar(past: $past, nowcast: $nowcast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Radar &&
            const DeepCollectionEquality().equals(other._past, _past) &&
            const DeepCollectionEquality().equals(other._nowcast, _nowcast));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_past),
      const DeepCollectionEquality().hash(_nowcast));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RadarCopyWith<_$_Radar> get copyWith =>
      __$$_RadarCopyWithImpl<_$_Radar>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RadarToJson(
      this,
    );
  }
}

abstract class _Radar implements Radar {
  const factory _Radar(
      {required final List<Nowcast> past,
      required final List<Nowcast> nowcast}) = _$_Radar;

  factory _Radar.fromJson(Map<String, dynamic> json) = _$_Radar.fromJson;

  @override
  List<Nowcast> get past;
  @override
  List<Nowcast> get nowcast;
  @override
  @JsonKey(ignore: true)
  _$$_RadarCopyWith<_$_Radar> get copyWith =>
      throw _privateConstructorUsedError;
}

Nowcast _$NowcastFromJson(Map<String, dynamic> json) {
  return _Nowcast.fromJson(json);
}

/// @nodoc
mixin _$Nowcast {
  int get time => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NowcastCopyWith<Nowcast> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NowcastCopyWith<$Res> {
  factory $NowcastCopyWith(Nowcast value, $Res Function(Nowcast) then) =
      _$NowcastCopyWithImpl<$Res, Nowcast>;
  @useResult
  $Res call({int time, String path});
}

/// @nodoc
class _$NowcastCopyWithImpl<$Res, $Val extends Nowcast>
    implements $NowcastCopyWith<$Res> {
  _$NowcastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NowcastCopyWith<$Res> implements $NowcastCopyWith<$Res> {
  factory _$$_NowcastCopyWith(
          _$_Nowcast value, $Res Function(_$_Nowcast) then) =
      __$$_NowcastCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int time, String path});
}

/// @nodoc
class __$$_NowcastCopyWithImpl<$Res>
    extends _$NowcastCopyWithImpl<$Res, _$_Nowcast>
    implements _$$_NowcastCopyWith<$Res> {
  __$$_NowcastCopyWithImpl(_$_Nowcast _value, $Res Function(_$_Nowcast) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? path = null,
  }) {
    return _then(_$_Nowcast(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Nowcast implements _Nowcast {
  const _$_Nowcast({required this.time, required this.path});

  factory _$_Nowcast.fromJson(Map<String, dynamic> json) =>
      _$$_NowcastFromJson(json);

  @override
  final int time;
  @override
  final String path;

  @override
  String toString() {
    return 'Nowcast(time: $time, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Nowcast &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NowcastCopyWith<_$_Nowcast> get copyWith =>
      __$$_NowcastCopyWithImpl<_$_Nowcast>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NowcastToJson(
      this,
    );
  }
}

abstract class _Nowcast implements Nowcast {
  const factory _Nowcast(
      {required final int time, required final String path}) = _$_Nowcast;

  factory _Nowcast.fromJson(Map<String, dynamic> json) = _$_Nowcast.fromJson;

  @override
  int get time;
  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$_NowcastCopyWith<_$_Nowcast> get copyWith =>
      throw _privateConstructorUsedError;
}

Satellite _$SatelliteFromJson(Map<String, dynamic> json) {
  return _Satellite.fromJson(json);
}

/// @nodoc
mixin _$Satellite {
  List<Nowcast> get infrared => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SatelliteCopyWith<Satellite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SatelliteCopyWith<$Res> {
  factory $SatelliteCopyWith(Satellite value, $Res Function(Satellite) then) =
      _$SatelliteCopyWithImpl<$Res, Satellite>;
  @useResult
  $Res call({List<Nowcast> infrared});
}

/// @nodoc
class _$SatelliteCopyWithImpl<$Res, $Val extends Satellite>
    implements $SatelliteCopyWith<$Res> {
  _$SatelliteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? infrared = null,
  }) {
    return _then(_value.copyWith(
      infrared: null == infrared
          ? _value.infrared
          : infrared // ignore: cast_nullable_to_non_nullable
              as List<Nowcast>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SatelliteCopyWith<$Res> implements $SatelliteCopyWith<$Res> {
  factory _$$_SatelliteCopyWith(
          _$_Satellite value, $Res Function(_$_Satellite) then) =
      __$$_SatelliteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Nowcast> infrared});
}

/// @nodoc
class __$$_SatelliteCopyWithImpl<$Res>
    extends _$SatelliteCopyWithImpl<$Res, _$_Satellite>
    implements _$$_SatelliteCopyWith<$Res> {
  __$$_SatelliteCopyWithImpl(
      _$_Satellite _value, $Res Function(_$_Satellite) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? infrared = null,
  }) {
    return _then(_$_Satellite(
      infrared: null == infrared
          ? _value._infrared
          : infrared // ignore: cast_nullable_to_non_nullable
              as List<Nowcast>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Satellite implements _Satellite {
  const _$_Satellite({required final List<Nowcast> infrared})
      : _infrared = infrared;

  factory _$_Satellite.fromJson(Map<String, dynamic> json) =>
      _$$_SatelliteFromJson(json);

  final List<Nowcast> _infrared;
  @override
  List<Nowcast> get infrared {
    if (_infrared is EqualUnmodifiableListView) return _infrared;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_infrared);
  }

  @override
  String toString() {
    return 'Satellite(infrared: $infrared)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Satellite &&
            const DeepCollectionEquality().equals(other._infrared, _infrared));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_infrared));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SatelliteCopyWith<_$_Satellite> get copyWith =>
      __$$_SatelliteCopyWithImpl<_$_Satellite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SatelliteToJson(
      this,
    );
  }
}

abstract class _Satellite implements Satellite {
  const factory _Satellite({required final List<Nowcast> infrared}) =
      _$_Satellite;

  factory _Satellite.fromJson(Map<String, dynamic> json) =
      _$_Satellite.fromJson;

  @override
  List<Nowcast> get infrared;
  @override
  @JsonKey(ignore: true)
  _$$_SatelliteCopyWith<_$_Satellite> get copyWith =>
      throw _privateConstructorUsedError;
}
