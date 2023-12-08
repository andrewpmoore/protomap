// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wunderground_today_observations.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WundergroundTodayObservations _$WundergroundTodayObservationsFromJson(
    Map<String, dynamic> json) {
  return _WundergroundTodayObservations.fromJson(json);
}

/// @nodoc
mixin _$WundergroundTodayObservations {
  List<Observation> get observations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WundergroundTodayObservationsCopyWith<WundergroundTodayObservations>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WundergroundTodayObservationsCopyWith<$Res> {
  factory $WundergroundTodayObservationsCopyWith(
          WundergroundTodayObservations value,
          $Res Function(WundergroundTodayObservations) then) =
      _$WundergroundTodayObservationsCopyWithImpl<$Res,
          WundergroundTodayObservations>;
  @useResult
  $Res call({List<Observation> observations});
}

/// @nodoc
class _$WundergroundTodayObservationsCopyWithImpl<$Res,
        $Val extends WundergroundTodayObservations>
    implements $WundergroundTodayObservationsCopyWith<$Res> {
  _$WundergroundTodayObservationsCopyWithImpl(this._value, this._then);

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
abstract class _$$_WundergroundTodayObservationsCopyWith<$Res>
    implements $WundergroundTodayObservationsCopyWith<$Res> {
  factory _$$_WundergroundTodayObservationsCopyWith(
          _$_WundergroundTodayObservations value,
          $Res Function(_$_WundergroundTodayObservations) then) =
      __$$_WundergroundTodayObservationsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Observation> observations});
}

/// @nodoc
class __$$_WundergroundTodayObservationsCopyWithImpl<$Res>
    extends _$WundergroundTodayObservationsCopyWithImpl<$Res,
        _$_WundergroundTodayObservations>
    implements _$$_WundergroundTodayObservationsCopyWith<$Res> {
  __$$_WundergroundTodayObservationsCopyWithImpl(
      _$_WundergroundTodayObservations _value,
      $Res Function(_$_WundergroundTodayObservations) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? observations = null,
  }) {
    return _then(_$_WundergroundTodayObservations(
      observations: null == observations
          ? _value._observations
          : observations // ignore: cast_nullable_to_non_nullable
              as List<Observation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WundergroundTodayObservations
    implements _WundergroundTodayObservations {
  const _$_WundergroundTodayObservations(
      {required final List<Observation> observations})
      : _observations = observations;

  factory _$_WundergroundTodayObservations.fromJson(
          Map<String, dynamic> json) =>
      _$$_WundergroundTodayObservationsFromJson(json);

  final List<Observation> _observations;
  @override
  List<Observation> get observations {
    if (_observations is EqualUnmodifiableListView) return _observations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_observations);
  }

  @override
  String toString() {
    return 'WundergroundTodayObservations(observations: $observations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WundergroundTodayObservations &&
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
  _$$_WundergroundTodayObservationsCopyWith<_$_WundergroundTodayObservations>
      get copyWith => __$$_WundergroundTodayObservationsCopyWithImpl<
          _$_WundergroundTodayObservations>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WundergroundTodayObservationsToJson(
      this,
    );
  }
}

abstract class _WundergroundTodayObservations
    implements WundergroundTodayObservations {
  const factory _WundergroundTodayObservations(
          {required final List<Observation> observations}) =
      _$_WundergroundTodayObservations;

  factory _WundergroundTodayObservations.fromJson(Map<String, dynamic> json) =
      _$_WundergroundTodayObservations.fromJson;

  @override
  List<Observation> get observations;
  @override
  @JsonKey(ignore: true)
  _$$_WundergroundTodayObservationsCopyWith<_$_WundergroundTodayObservations>
      get copyWith => throw _privateConstructorUsedError;
}

Observation _$ObservationFromJson(Map<String, dynamic> json) {
  return _Observation.fromJson(json);
}

/// @nodoc
mixin _$Observation {
  @JsonKey(name: 'stationID')
  String get stationId => throw _privateConstructorUsedError;
  String get tz => throw _privateConstructorUsedError;
  DateTime get obsTimeUtc => throw _privateConstructorUsedError;
  DateTime get obsTimeLocal => throw _privateConstructorUsedError;
  int get epoch => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  double? get solarRadiationHigh => throw _privateConstructorUsedError;
  double? get uvHigh => throw _privateConstructorUsedError;
  double? get winddirAvg => throw _privateConstructorUsedError;
  double? get humidityHigh => throw _privateConstructorUsedError;
  double? get humidityLow => throw _privateConstructorUsedError;
  double? get humidityAvg => throw _privateConstructorUsedError;
  double? get qcStatus => throw _privateConstructorUsedError;
  Map<String, double?>? get metric => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'stationID') String stationId,
      String tz,
      DateTime obsTimeUtc,
      DateTime obsTimeLocal,
      int epoch,
      double lat,
      double lon,
      double? solarRadiationHigh,
      double? uvHigh,
      double? winddirAvg,
      double? humidityHigh,
      double? humidityLow,
      double? humidityAvg,
      double? qcStatus,
      Map<String, double?>? metric});
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
    Object? stationId = null,
    Object? tz = null,
    Object? obsTimeUtc = null,
    Object? obsTimeLocal = null,
    Object? epoch = null,
    Object? lat = null,
    Object? lon = null,
    Object? solarRadiationHigh = freezed,
    Object? uvHigh = freezed,
    Object? winddirAvg = freezed,
    Object? humidityHigh = freezed,
    Object? humidityLow = freezed,
    Object? humidityAvg = freezed,
    Object? qcStatus = freezed,
    Object? metric = freezed,
  }) {
    return _then(_value.copyWith(
      stationId: null == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      tz: null == tz
          ? _value.tz
          : tz // ignore: cast_nullable_to_non_nullable
              as String,
      obsTimeUtc: null == obsTimeUtc
          ? _value.obsTimeUtc
          : obsTimeUtc // ignore: cast_nullable_to_non_nullable
              as DateTime,
      obsTimeLocal: null == obsTimeLocal
          ? _value.obsTimeLocal
          : obsTimeLocal // ignore: cast_nullable_to_non_nullable
              as DateTime,
      epoch: null == epoch
          ? _value.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as int,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      solarRadiationHigh: freezed == solarRadiationHigh
          ? _value.solarRadiationHigh
          : solarRadiationHigh // ignore: cast_nullable_to_non_nullable
              as double?,
      uvHigh: freezed == uvHigh
          ? _value.uvHigh
          : uvHigh // ignore: cast_nullable_to_non_nullable
              as double?,
      winddirAvg: freezed == winddirAvg
          ? _value.winddirAvg
          : winddirAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      humidityHigh: freezed == humidityHigh
          ? _value.humidityHigh
          : humidityHigh // ignore: cast_nullable_to_non_nullable
              as double?,
      humidityLow: freezed == humidityLow
          ? _value.humidityLow
          : humidityLow // ignore: cast_nullable_to_non_nullable
              as double?,
      humidityAvg: freezed == humidityAvg
          ? _value.humidityAvg
          : humidityAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      qcStatus: freezed == qcStatus
          ? _value.qcStatus
          : qcStatus // ignore: cast_nullable_to_non_nullable
              as double?,
      metric: freezed == metric
          ? _value.metric
          : metric // ignore: cast_nullable_to_non_nullable
              as Map<String, double?>?,
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
      {@JsonKey(name: 'stationID') String stationId,
      String tz,
      DateTime obsTimeUtc,
      DateTime obsTimeLocal,
      int epoch,
      double lat,
      double lon,
      double? solarRadiationHigh,
      double? uvHigh,
      double? winddirAvg,
      double? humidityHigh,
      double? humidityLow,
      double? humidityAvg,
      double? qcStatus,
      Map<String, double?>? metric});
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
    Object? stationId = null,
    Object? tz = null,
    Object? obsTimeUtc = null,
    Object? obsTimeLocal = null,
    Object? epoch = null,
    Object? lat = null,
    Object? lon = null,
    Object? solarRadiationHigh = freezed,
    Object? uvHigh = freezed,
    Object? winddirAvg = freezed,
    Object? humidityHigh = freezed,
    Object? humidityLow = freezed,
    Object? humidityAvg = freezed,
    Object? qcStatus = freezed,
    Object? metric = freezed,
  }) {
    return _then(_$_Observation(
      stationId: null == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      tz: null == tz
          ? _value.tz
          : tz // ignore: cast_nullable_to_non_nullable
              as String,
      obsTimeUtc: null == obsTimeUtc
          ? _value.obsTimeUtc
          : obsTimeUtc // ignore: cast_nullable_to_non_nullable
              as DateTime,
      obsTimeLocal: null == obsTimeLocal
          ? _value.obsTimeLocal
          : obsTimeLocal // ignore: cast_nullable_to_non_nullable
              as DateTime,
      epoch: null == epoch
          ? _value.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as int,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      solarRadiationHigh: freezed == solarRadiationHigh
          ? _value.solarRadiationHigh
          : solarRadiationHigh // ignore: cast_nullable_to_non_nullable
              as double?,
      uvHigh: freezed == uvHigh
          ? _value.uvHigh
          : uvHigh // ignore: cast_nullable_to_non_nullable
              as double?,
      winddirAvg: freezed == winddirAvg
          ? _value.winddirAvg
          : winddirAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      humidityHigh: freezed == humidityHigh
          ? _value.humidityHigh
          : humidityHigh // ignore: cast_nullable_to_non_nullable
              as double?,
      humidityLow: freezed == humidityLow
          ? _value.humidityLow
          : humidityLow // ignore: cast_nullable_to_non_nullable
              as double?,
      humidityAvg: freezed == humidityAvg
          ? _value.humidityAvg
          : humidityAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      qcStatus: freezed == qcStatus
          ? _value.qcStatus
          : qcStatus // ignore: cast_nullable_to_non_nullable
              as double?,
      metric: freezed == metric
          ? _value._metric
          : metric // ignore: cast_nullable_to_non_nullable
              as Map<String, double?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Observation implements _Observation {
  const _$_Observation(
      {@JsonKey(name: 'stationID') required this.stationId,
      required this.tz,
      required this.obsTimeUtc,
      required this.obsTimeLocal,
      required this.epoch,
      required this.lat,
      required this.lon,
      this.solarRadiationHigh,
      this.uvHigh,
      this.winddirAvg,
      this.humidityHigh,
      this.humidityLow,
      this.humidityAvg,
      this.qcStatus,
      final Map<String, double?>? metric})
      : _metric = metric;

  factory _$_Observation.fromJson(Map<String, dynamic> json) =>
      _$$_ObservationFromJson(json);

  @override
  @JsonKey(name: 'stationID')
  final String stationId;
  @override
  final String tz;
  @override
  final DateTime obsTimeUtc;
  @override
  final DateTime obsTimeLocal;
  @override
  final int epoch;
  @override
  final double lat;
  @override
  final double lon;
  @override
  final double? solarRadiationHigh;
  @override
  final double? uvHigh;
  @override
  final double? winddirAvg;
  @override
  final double? humidityHigh;
  @override
  final double? humidityLow;
  @override
  final double? humidityAvg;
  @override
  final double? qcStatus;
  final Map<String, double?>? _metric;
  @override
  Map<String, double?>? get metric {
    final value = _metric;
    if (value == null) return null;
    if (_metric is EqualUnmodifiableMapView) return _metric;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Observation(stationId: $stationId, tz: $tz, obsTimeUtc: $obsTimeUtc, obsTimeLocal: $obsTimeLocal, epoch: $epoch, lat: $lat, lon: $lon, solarRadiationHigh: $solarRadiationHigh, uvHigh: $uvHigh, winddirAvg: $winddirAvg, humidityHigh: $humidityHigh, humidityLow: $humidityLow, humidityAvg: $humidityAvg, qcStatus: $qcStatus, metric: $metric)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Observation &&
            (identical(other.stationId, stationId) ||
                other.stationId == stationId) &&
            (identical(other.tz, tz) || other.tz == tz) &&
            (identical(other.obsTimeUtc, obsTimeUtc) ||
                other.obsTimeUtc == obsTimeUtc) &&
            (identical(other.obsTimeLocal, obsTimeLocal) ||
                other.obsTimeLocal == obsTimeLocal) &&
            (identical(other.epoch, epoch) || other.epoch == epoch) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.solarRadiationHigh, solarRadiationHigh) ||
                other.solarRadiationHigh == solarRadiationHigh) &&
            (identical(other.uvHigh, uvHigh) || other.uvHigh == uvHigh) &&
            (identical(other.winddirAvg, winddirAvg) ||
                other.winddirAvg == winddirAvg) &&
            (identical(other.humidityHigh, humidityHigh) ||
                other.humidityHigh == humidityHigh) &&
            (identical(other.humidityLow, humidityLow) ||
                other.humidityLow == humidityLow) &&
            (identical(other.humidityAvg, humidityAvg) ||
                other.humidityAvg == humidityAvg) &&
            (identical(other.qcStatus, qcStatus) ||
                other.qcStatus == qcStatus) &&
            const DeepCollectionEquality().equals(other._metric, _metric));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      stationId,
      tz,
      obsTimeUtc,
      obsTimeLocal,
      epoch,
      lat,
      lon,
      solarRadiationHigh,
      uvHigh,
      winddirAvg,
      humidityHigh,
      humidityLow,
      humidityAvg,
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
      {@JsonKey(name: 'stationID') required final String stationId,
      required final String tz,
      required final DateTime obsTimeUtc,
      required final DateTime obsTimeLocal,
      required final int epoch,
      required final double lat,
      required final double lon,
      final double? solarRadiationHigh,
      final double? uvHigh,
      final double? winddirAvg,
      final double? humidityHigh,
      final double? humidityLow,
      final double? humidityAvg,
      final double? qcStatus,
      final Map<String, double?>? metric}) = _$_Observation;

  factory _Observation.fromJson(Map<String, dynamic> json) =
      _$_Observation.fromJson;

  @override
  @JsonKey(name: 'stationID')
  String get stationId;
  @override
  String get tz;
  @override
  DateTime get obsTimeUtc;
  @override
  DateTime get obsTimeLocal;
  @override
  int get epoch;
  @override
  double get lat;
  @override
  double get lon;
  @override
  double? get solarRadiationHigh;
  @override
  double? get uvHigh;
  @override
  double? get winddirAvg;
  @override
  double? get humidityHigh;
  @override
  double? get humidityLow;
  @override
  double? get humidityAvg;
  @override
  double? get qcStatus;
  @override
  Map<String, double?>? get metric;
  @override
  @JsonKey(ignore: true)
  _$$_ObservationCopyWith<_$_Observation> get copyWith =>
      throw _privateConstructorUsedError;
}
