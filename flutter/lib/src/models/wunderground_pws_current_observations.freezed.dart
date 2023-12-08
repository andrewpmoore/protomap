// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wunderground_pws_current_observations.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WundergroundPwsCurrentObservations _$WundergroundPwsCurrentObservationsFromJson(
    Map<String, dynamic> json) {
  return _WundergroundPwsCurrentObservations.fromJson(json);
}

/// @nodoc
mixin _$WundergroundPwsCurrentObservations {
  List<Observation> get observations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WundergroundPwsCurrentObservationsCopyWith<
          WundergroundPwsCurrentObservations>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WundergroundPwsCurrentObservationsCopyWith<$Res> {
  factory $WundergroundPwsCurrentObservationsCopyWith(
          WundergroundPwsCurrentObservations value,
          $Res Function(WundergroundPwsCurrentObservations) then) =
      _$WundergroundPwsCurrentObservationsCopyWithImpl<$Res,
          WundergroundPwsCurrentObservations>;
  @useResult
  $Res call({List<Observation> observations});
}

/// @nodoc
class _$WundergroundPwsCurrentObservationsCopyWithImpl<$Res,
        $Val extends WundergroundPwsCurrentObservations>
    implements $WundergroundPwsCurrentObservationsCopyWith<$Res> {
  _$WundergroundPwsCurrentObservationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? observations = null,
  }) {
    return _then(_value.copyWith(
      observations: null == observations
          ? _value.observations
          : observations // ignore: cast_nullable_to_non_nullable
              as List<Observation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WundergroundPwsCurrentObservationsCopyWith<$Res>
    implements $WundergroundPwsCurrentObservationsCopyWith<$Res> {
  factory _$$_WundergroundPwsCurrentObservationsCopyWith(
          _$_WundergroundPwsCurrentObservations value,
          $Res Function(_$_WundergroundPwsCurrentObservations) then) =
      __$$_WundergroundPwsCurrentObservationsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Observation> observations});
}

/// @nodoc
class __$$_WundergroundPwsCurrentObservationsCopyWithImpl<$Res>
    extends _$WundergroundPwsCurrentObservationsCopyWithImpl<$Res,
        _$_WundergroundPwsCurrentObservations>
    implements _$$_WundergroundPwsCurrentObservationsCopyWith<$Res> {
  __$$_WundergroundPwsCurrentObservationsCopyWithImpl(
      _$_WundergroundPwsCurrentObservations _value,
      $Res Function(_$_WundergroundPwsCurrentObservations) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? observations = null,
  }) {
    return _then(_$_WundergroundPwsCurrentObservations(
      observations: null == observations
          ? _value._observations
          : observations // ignore: cast_nullable_to_non_nullable
              as List<Observation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WundergroundPwsCurrentObservations
    implements _WundergroundPwsCurrentObservations {
  const _$_WundergroundPwsCurrentObservations(
      {required final List<Observation> observations})
      : _observations = observations;

  factory _$_WundergroundPwsCurrentObservations.fromJson(
          Map<String, dynamic> json) =>
      _$$_WundergroundPwsCurrentObservationsFromJson(json);

  final List<Observation> _observations;
  @override
  List<Observation> get observations {
    if (_observations is EqualUnmodifiableListView) return _observations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_observations);
  }

  @override
  String toString() {
    return 'WundergroundPwsCurrentObservations(observations: $observations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WundergroundPwsCurrentObservations &&
            const DeepCollectionEquality()
                .equals(other._observations, _observations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_observations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WundergroundPwsCurrentObservationsCopyWith<
          _$_WundergroundPwsCurrentObservations>
      get copyWith => __$$_WundergroundPwsCurrentObservationsCopyWithImpl<
          _$_WundergroundPwsCurrentObservations>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WundergroundPwsCurrentObservationsToJson(
      this,
    );
  }
}

abstract class _WundergroundPwsCurrentObservations
    implements WundergroundPwsCurrentObservations {
  const factory _WundergroundPwsCurrentObservations(
          {required final List<Observation> observations}) =
      _$_WundergroundPwsCurrentObservations;

  factory _WundergroundPwsCurrentObservations.fromJson(
          Map<String, dynamic> json) =
      _$_WundergroundPwsCurrentObservations.fromJson;

  @override
  List<Observation> get observations;
  @override
  @JsonKey(ignore: true)
  _$$_WundergroundPwsCurrentObservationsCopyWith<
          _$_WundergroundPwsCurrentObservations>
      get copyWith => throw _privateConstructorUsedError;
}

Observation _$ObservationFromJson(Map<String, dynamic> json) {
  return _Observation.fromJson(json);
}

/// @nodoc
mixin _$Observation {
  @JsonKey(name: 'stationID')
  String? get stationId => throw _privateConstructorUsedError;
  DateTime? get obsTimeUtc => throw _privateConstructorUsedError;
  DateTime? get obsTimeLocal => throw _privateConstructorUsedError;
  String? get neighborhood => throw _privateConstructorUsedError;
  String? get softwareType => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  double? get solarRadiation => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;
  int? get realtimeFrequency => throw _privateConstructorUsedError;
  int? get epoch => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get uv => throw _privateConstructorUsedError;
  int? get winddir => throw _privateConstructorUsedError;
  int? get humidity => throw _privateConstructorUsedError;
  int? get qcStatus => throw _privateConstructorUsedError;
  Map<String, double>? get metric => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObservationCopyWith<Observation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObservationCopyWith<$Res> {
  factory $ObservationCopyWith(
          Observation value, $Res Function(Observation) then) =
      _$ObservationCopyWithImpl<$Res, Observation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'stationID') String? stationId,
      DateTime? obsTimeUtc,
      DateTime? obsTimeLocal,
      String? neighborhood,
      String? softwareType,
      String? country,
      double? solarRadiation,
      double? lon,
      int? realtimeFrequency,
      int? epoch,
      double? lat,
      double? uv,
      int? winddir,
      int? humidity,
      int? qcStatus,
      Map<String, double>? metric});
}

/// @nodoc
class _$ObservationCopyWithImpl<$Res, $Val extends Observation>
    implements $ObservationCopyWith<$Res> {
  _$ObservationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationId = freezed,
    Object? obsTimeUtc = freezed,
    Object? obsTimeLocal = freezed,
    Object? neighborhood = freezed,
    Object? softwareType = freezed,
    Object? country = freezed,
    Object? solarRadiation = freezed,
    Object? lon = freezed,
    Object? realtimeFrequency = freezed,
    Object? epoch = freezed,
    Object? lat = freezed,
    Object? uv = freezed,
    Object? winddir = freezed,
    Object? humidity = freezed,
    Object? qcStatus = freezed,
    Object? metric = freezed,
  }) {
    return _then(_value.copyWith(
      stationId: freezed == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String?,
      obsTimeUtc: freezed == obsTimeUtc
          ? _value.obsTimeUtc
          : obsTimeUtc // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      obsTimeLocal: freezed == obsTimeLocal
          ? _value.obsTimeLocal
          : obsTimeLocal // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      neighborhood: freezed == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String?,
      softwareType: freezed == softwareType
          ? _value.softwareType
          : softwareType // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      solarRadiation: freezed == solarRadiation
          ? _value.solarRadiation
          : solarRadiation // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      realtimeFrequency: freezed == realtimeFrequency
          ? _value.realtimeFrequency
          : realtimeFrequency // ignore: cast_nullable_to_non_nullable
              as int?,
      epoch: freezed == epoch
          ? _value.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      uv: freezed == uv
          ? _value.uv
          : uv // ignore: cast_nullable_to_non_nullable
              as double?,
      winddir: freezed == winddir
          ? _value.winddir
          : winddir // ignore: cast_nullable_to_non_nullable
              as int?,
      humidity: freezed == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int?,
      qcStatus: freezed == qcStatus
          ? _value.qcStatus
          : qcStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      metric: freezed == metric
          ? _value.metric
          : metric // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ObservationCopyWith<$Res>
    implements $ObservationCopyWith<$Res> {
  factory _$$_ObservationCopyWith(
          _$_Observation value, $Res Function(_$_Observation) then) =
      __$$_ObservationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'stationID') String? stationId,
      DateTime? obsTimeUtc,
      DateTime? obsTimeLocal,
      String? neighborhood,
      String? softwareType,
      String? country,
      double? solarRadiation,
      double? lon,
      int? realtimeFrequency,
      int? epoch,
      double? lat,
      double? uv,
      int? winddir,
      int? humidity,
      int? qcStatus,
      Map<String, double>? metric});
}

/// @nodoc
class __$$_ObservationCopyWithImpl<$Res>
    extends _$ObservationCopyWithImpl<$Res, _$_Observation>
    implements _$$_ObservationCopyWith<$Res> {
  __$$_ObservationCopyWithImpl(
      _$_Observation _value, $Res Function(_$_Observation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationId = freezed,
    Object? obsTimeUtc = freezed,
    Object? obsTimeLocal = freezed,
    Object? neighborhood = freezed,
    Object? softwareType = freezed,
    Object? country = freezed,
    Object? solarRadiation = freezed,
    Object? lon = freezed,
    Object? realtimeFrequency = freezed,
    Object? epoch = freezed,
    Object? lat = freezed,
    Object? uv = freezed,
    Object? winddir = freezed,
    Object? humidity = freezed,
    Object? qcStatus = freezed,
    Object? metric = freezed,
  }) {
    return _then(_$_Observation(
      stationId: freezed == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String?,
      obsTimeUtc: freezed == obsTimeUtc
          ? _value.obsTimeUtc
          : obsTimeUtc // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      obsTimeLocal: freezed == obsTimeLocal
          ? _value.obsTimeLocal
          : obsTimeLocal // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      neighborhood: freezed == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String?,
      softwareType: freezed == softwareType
          ? _value.softwareType
          : softwareType // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      solarRadiation: freezed == solarRadiation
          ? _value.solarRadiation
          : solarRadiation // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      realtimeFrequency: freezed == realtimeFrequency
          ? _value.realtimeFrequency
          : realtimeFrequency // ignore: cast_nullable_to_non_nullable
              as int?,
      epoch: freezed == epoch
          ? _value.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      uv: freezed == uv
          ? _value.uv
          : uv // ignore: cast_nullable_to_non_nullable
              as double?,
      winddir: freezed == winddir
          ? _value.winddir
          : winddir // ignore: cast_nullable_to_non_nullable
              as int?,
      humidity: freezed == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int?,
      qcStatus: freezed == qcStatus
          ? _value.qcStatus
          : qcStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      metric: freezed == metric
          ? _value._metric
          : metric // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Observation implements _Observation {
  const _$_Observation(
      {@JsonKey(name: 'stationID') this.stationId,
      this.obsTimeUtc,
      this.obsTimeLocal,
      this.neighborhood,
      this.softwareType,
      this.country,
      this.solarRadiation,
      this.lon,
      this.realtimeFrequency,
      this.epoch,
      this.lat,
      this.uv,
      this.winddir,
      this.humidity,
      this.qcStatus,
      final Map<String, double>? metric})
      : _metric = metric;

  factory _$_Observation.fromJson(Map<String, dynamic> json) =>
      _$$_ObservationFromJson(json);

  @override
  @JsonKey(name: 'stationID')
  final String? stationId;
  @override
  final DateTime? obsTimeUtc;
  @override
  final DateTime? obsTimeLocal;
  @override
  final String? neighborhood;
  @override
  final String? softwareType;
  @override
  final String? country;
  @override
  final double? solarRadiation;
  @override
  final double? lon;
  @override
  final int? realtimeFrequency;
  @override
  final int? epoch;
  @override
  final double? lat;
  @override
  final double? uv;
  @override
  final int? winddir;
  @override
  final int? humidity;
  @override
  final int? qcStatus;
  final Map<String, double>? _metric;
  @override
  Map<String, double>? get metric {
    final value = _metric;
    if (value == null) return null;
    if (_metric is EqualUnmodifiableMapView) return _metric;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Observation(stationId: $stationId, obsTimeUtc: $obsTimeUtc, obsTimeLocal: $obsTimeLocal, neighborhood: $neighborhood, softwareType: $softwareType, country: $country, solarRadiation: $solarRadiation, lon: $lon, realtimeFrequency: $realtimeFrequency, epoch: $epoch, lat: $lat, uv: $uv, winddir: $winddir, humidity: $humidity, qcStatus: $qcStatus, metric: $metric)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Observation &&
            (identical(other.stationId, stationId) ||
                other.stationId == stationId) &&
            (identical(other.obsTimeUtc, obsTimeUtc) ||
                other.obsTimeUtc == obsTimeUtc) &&
            (identical(other.obsTimeLocal, obsTimeLocal) ||
                other.obsTimeLocal == obsTimeLocal) &&
            (identical(other.neighborhood, neighborhood) ||
                other.neighborhood == neighborhood) &&
            (identical(other.softwareType, softwareType) ||
                other.softwareType == softwareType) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.solarRadiation, solarRadiation) ||
                other.solarRadiation == solarRadiation) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.realtimeFrequency, realtimeFrequency) ||
                other.realtimeFrequency == realtimeFrequency) &&
            (identical(other.epoch, epoch) || other.epoch == epoch) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.uv, uv) || other.uv == uv) &&
            (identical(other.winddir, winddir) || other.winddir == winddir) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.qcStatus, qcStatus) ||
                other.qcStatus == qcStatus) &&
            const DeepCollectionEquality().equals(other._metric, _metric));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      stationId,
      obsTimeUtc,
      obsTimeLocal,
      neighborhood,
      softwareType,
      country,
      solarRadiation,
      lon,
      realtimeFrequency,
      epoch,
      lat,
      uv,
      winddir,
      humidity,
      qcStatus,
      const DeepCollectionEquality().hash(_metric));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ObservationCopyWith<_$_Observation> get copyWith =>
      __$$_ObservationCopyWithImpl<_$_Observation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ObservationToJson(
      this,
    );
  }
}

abstract class _Observation implements Observation {
  const factory _Observation(
      {@JsonKey(name: 'stationID') final String? stationId,
      final DateTime? obsTimeUtc,
      final DateTime? obsTimeLocal,
      final String? neighborhood,
      final String? softwareType,
      final String? country,
      final double? solarRadiation,
      final double? lon,
      final int? realtimeFrequency,
      final int? epoch,
      final double? lat,
      final double? uv,
      final int? winddir,
      final int? humidity,
      final int? qcStatus,
      final Map<String, double>? metric}) = _$_Observation;

  factory _Observation.fromJson(Map<String, dynamic> json) =
      _$_Observation.fromJson;

  @override
  @JsonKey(name: 'stationID')
  String? get stationId;
  @override
  DateTime? get obsTimeUtc;
  @override
  DateTime? get obsTimeLocal;
  @override
  String? get neighborhood;
  @override
  String? get softwareType;
  @override
  String? get country;
  @override
  double? get solarRadiation;
  @override
  double? get lon;
  @override
  int? get realtimeFrequency;
  @override
  int? get epoch;
  @override
  double? get lat;
  @override
  double? get uv;
  @override
  int? get winddir;
  @override
  int? get humidity;
  @override
  int? get qcStatus;
  @override
  Map<String, double>? get metric;
  @override
  @JsonKey(ignore: true)
  _$$_ObservationCopyWith<_$_Observation> get copyWith =>
      throw _privateConstructorUsedError;
}
