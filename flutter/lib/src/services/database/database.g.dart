// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DataStoresTable extends DataStores
    with TableInfo<$DataStoresTable, DataStore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DataStoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _forDateMeta =
      const VerificationMeta('forDate');
  @override
  late final GeneratedColumn<String> forDate = GeneratedColumn<String>(
      'for_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _jsonMeta = const VerificationMeta('json');
  @override
  late final GeneratedColumn<String> json = GeneratedColumn<String>(
      'json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _basicValueMeta =
      const VerificationMeta('basicValue');
  @override
  late final GeneratedColumn<String> basicValue = GeneratedColumn<String>(
      'basic_value', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [key, type, createdAt, forDate, json, basicValue];
  @override
  String get aliasedName => _alias ?? 'data_stores';
  @override
  String get actualTableName => 'data_stores';
  @override
  VerificationContext validateIntegrity(Insertable<DataStore> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('for_date')) {
      context.handle(_forDateMeta,
          forDate.isAcceptableOrUnknown(data['for_date']!, _forDateMeta));
    }
    if (data.containsKey('json')) {
      context.handle(
          _jsonMeta, json.isAcceptableOrUnknown(data['json']!, _jsonMeta));
    }
    if (data.containsKey('basic_value')) {
      context.handle(
          _basicValueMeta,
          basicValue.isAcceptableOrUnknown(
              data['basic_value']!, _basicValueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  DataStore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DataStore(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      forDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}for_date']),
      json: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}json']),
      basicValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}basic_value']),
    );
  }

  @override
  $DataStoresTable createAlias(String alias) {
    return $DataStoresTable(attachedDatabase, alias);
  }
}

class DataStore extends DataClass implements Insertable<DataStore> {
  final String key;
  final String type;
  final String? createdAt;
  final String? forDate;
  final String? json;
  final String? basicValue;
  const DataStore(
      {required this.key,
      required this.type,
      this.createdAt,
      this.forDate,
      this.json,
      this.basicValue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || forDate != null) {
      map['for_date'] = Variable<String>(forDate);
    }
    if (!nullToAbsent || json != null) {
      map['json'] = Variable<String>(json);
    }
    if (!nullToAbsent || basicValue != null) {
      map['basic_value'] = Variable<String>(basicValue);
    }
    return map;
  }

  DataStoresCompanion toCompanion(bool nullToAbsent) {
    return DataStoresCompanion(
      key: Value(key),
      type: Value(type),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      forDate: forDate == null && nullToAbsent
          ? const Value.absent()
          : Value(forDate),
      json: json == null && nullToAbsent ? const Value.absent() : Value(json),
      basicValue: basicValue == null && nullToAbsent
          ? const Value.absent()
          : Value(basicValue),
    );
  }

  factory DataStore.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DataStore(
      key: serializer.fromJson<String>(json['key']),
      type: serializer.fromJson<String>(json['type']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      forDate: serializer.fromJson<String?>(json['forDate']),
      json: serializer.fromJson<String?>(json['json']),
      basicValue: serializer.fromJson<String?>(json['basicValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'type': serializer.toJson<String>(type),
      'createdAt': serializer.toJson<String?>(createdAt),
      'forDate': serializer.toJson<String?>(forDate),
      'json': serializer.toJson<String?>(json),
      'basicValue': serializer.toJson<String?>(basicValue),
    };
  }

  DataStore copyWith(
          {String? key,
          String? type,
          Value<String?> createdAt = const Value.absent(),
          Value<String?> forDate = const Value.absent(),
          Value<String?> json = const Value.absent(),
          Value<String?> basicValue = const Value.absent()}) =>
      DataStore(
        key: key ?? this.key,
        type: type ?? this.type,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        forDate: forDate.present ? forDate.value : this.forDate,
        json: json.present ? json.value : this.json,
        basicValue: basicValue.present ? basicValue.value : this.basicValue,
      );
  @override
  String toString() {
    return (StringBuffer('DataStore(')
          ..write('key: $key, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('forDate: $forDate, ')
          ..write('json: $json, ')
          ..write('basicValue: $basicValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(key, type, createdAt, forDate, json, basicValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DataStore &&
          other.key == this.key &&
          other.type == this.type &&
          other.createdAt == this.createdAt &&
          other.forDate == this.forDate &&
          other.json == this.json &&
          other.basicValue == this.basicValue);
}

class DataStoresCompanion extends UpdateCompanion<DataStore> {
  final Value<String> key;
  final Value<String> type;
  final Value<String?> createdAt;
  final Value<String?> forDate;
  final Value<String?> json;
  final Value<String?> basicValue;
  const DataStoresCompanion({
    this.key = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.forDate = const Value.absent(),
    this.json = const Value.absent(),
    this.basicValue = const Value.absent(),
  });
  DataStoresCompanion.insert({
    required String key,
    required String type,
    this.createdAt = const Value.absent(),
    this.forDate = const Value.absent(),
    this.json = const Value.absent(),
    this.basicValue = const Value.absent(),
  })  : key = Value(key),
        type = Value(type);
  static Insertable<DataStore> custom({
    Expression<String>? key,
    Expression<String>? type,
    Expression<String>? createdAt,
    Expression<String>? forDate,
    Expression<String>? json,
    Expression<String>? basicValue,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
      if (forDate != null) 'for_date': forDate,
      if (json != null) 'json': json,
      if (basicValue != null) 'basic_value': basicValue,
    });
  }

  DataStoresCompanion copyWith(
      {Value<String>? key,
      Value<String>? type,
      Value<String?>? createdAt,
      Value<String?>? forDate,
      Value<String?>? json,
      Value<String?>? basicValue}) {
    return DataStoresCompanion(
      key: key ?? this.key,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      forDate: forDate ?? this.forDate,
      json: json ?? this.json,
      basicValue: basicValue ?? this.basicValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (forDate.present) {
      map['for_date'] = Variable<String>(forDate.value);
    }
    if (json.present) {
      map['json'] = Variable<String>(json.value);
    }
    if (basicValue.present) {
      map['basic_value'] = Variable<String>(basicValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DataStoresCompanion(')
          ..write('key: $key, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('forDate: $forDate, ')
          ..write('json: $json, ')
          ..write('basicValue: $basicValue')
          ..write(')'))
        .toString();
  }
}

class $WeatherLocationsTable extends WeatherLocations
    with TableInfo<$WeatherLocationsTable, WeatherLocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeatherLocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<String> lat = GeneratedColumn<String>(
      'lat', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<String> lng = GeneratedColumn<String>(
      'lng', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _todayForecastJsonMeta =
      const VerificationMeta('todayForecastJson');
  @override
  late final GeneratedColumn<String> todayForecastJson =
      GeneratedColumn<String>('today_forecast_json', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _todayPWSDataJsonMeta =
      const VerificationMeta('todayPWSDataJson');
  @override
  late final GeneratedColumn<String> todayPWSDataJson = GeneratedColumn<String>(
      'today_p_w_s_data_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _favouriteMeta =
      const VerificationMeta('favourite');
  @override
  late final GeneratedColumn<bool> favourite =
      GeneratedColumn<bool>('favourite', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("favourite" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _recentMeta = const VerificationMeta('recent');
  @override
  late final GeneratedColumn<bool> recent =
      GeneratedColumn<bool>('recent', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("recent" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        uid,
        name,
        lat,
        lng,
        updatedAt,
        todayForecastJson,
        todayPWSDataJson,
        favourite,
        recent
      ];
  @override
  String get aliasedName => _alias ?? 'weather_locations';
  @override
  String get actualTableName => 'weather_locations';
  @override
  VerificationContext validateIntegrity(Insertable<WeatherLocation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng']!, _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('today_forecast_json')) {
      context.handle(
          _todayForecastJsonMeta,
          todayForecastJson.isAcceptableOrUnknown(
              data['today_forecast_json']!, _todayForecastJsonMeta));
    }
    if (data.containsKey('today_p_w_s_data_json')) {
      context.handle(
          _todayPWSDataJsonMeta,
          todayPWSDataJson.isAcceptableOrUnknown(
              data['today_p_w_s_data_json']!, _todayPWSDataJsonMeta));
    }
    if (data.containsKey('favourite')) {
      context.handle(_favouriteMeta,
          favourite.isAcceptableOrUnknown(data['favourite']!, _favouriteMeta));
    } else if (isInserting) {
      context.missing(_favouriteMeta);
    }
    if (data.containsKey('recent')) {
      context.handle(_recentMeta,
          recent.isAcceptableOrUnknown(data['recent']!, _recentMeta));
    } else if (isInserting) {
      context.missing(_recentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  WeatherLocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeatherLocation(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lat'])!,
      lng: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lng'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      todayForecastJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}today_forecast_json']),
      todayPWSDataJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}today_p_w_s_data_json']),
      favourite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}favourite'])!,
      recent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}recent'])!,
    );
  }

  @override
  $WeatherLocationsTable createAlias(String alias) {
    return $WeatherLocationsTable(attachedDatabase, alias);
  }
}

class WeatherLocation extends DataClass implements Insertable<WeatherLocation> {
  final String uid;
  final String name;
  final String lat;
  final String lng;
  final DateTime? updatedAt;
  final String? todayForecastJson;
  final String? todayPWSDataJson;
  final bool favourite;
  final bool recent;
  const WeatherLocation(
      {required this.uid,
      required this.name,
      required this.lat,
      required this.lng,
      this.updatedAt,
      this.todayForecastJson,
      this.todayPWSDataJson,
      required this.favourite,
      required this.recent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['name'] = Variable<String>(name);
    map['lat'] = Variable<String>(lat);
    map['lng'] = Variable<String>(lng);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || todayForecastJson != null) {
      map['today_forecast_json'] = Variable<String>(todayForecastJson);
    }
    if (!nullToAbsent || todayPWSDataJson != null) {
      map['today_p_w_s_data_json'] = Variable<String>(todayPWSDataJson);
    }
    map['favourite'] = Variable<bool>(favourite);
    map['recent'] = Variable<bool>(recent);
    return map;
  }

  WeatherLocationsCompanion toCompanion(bool nullToAbsent) {
    return WeatherLocationsCompanion(
      uid: Value(uid),
      name: Value(name),
      lat: Value(lat),
      lng: Value(lng),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      todayForecastJson: todayForecastJson == null && nullToAbsent
          ? const Value.absent()
          : Value(todayForecastJson),
      todayPWSDataJson: todayPWSDataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(todayPWSDataJson),
      favourite: Value(favourite),
      recent: Value(recent),
    );
  }

  factory WeatherLocation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeatherLocation(
      uid: serializer.fromJson<String>(json['uid']),
      name: serializer.fromJson<String>(json['name']),
      lat: serializer.fromJson<String>(json['lat']),
      lng: serializer.fromJson<String>(json['lng']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      todayForecastJson:
          serializer.fromJson<String?>(json['todayForecastJson']),
      todayPWSDataJson: serializer.fromJson<String?>(json['todayPWSDataJson']),
      favourite: serializer.fromJson<bool>(json['favourite']),
      recent: serializer.fromJson<bool>(json['recent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'name': serializer.toJson<String>(name),
      'lat': serializer.toJson<String>(lat),
      'lng': serializer.toJson<String>(lng),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'todayForecastJson': serializer.toJson<String?>(todayForecastJson),
      'todayPWSDataJson': serializer.toJson<String?>(todayPWSDataJson),
      'favourite': serializer.toJson<bool>(favourite),
      'recent': serializer.toJson<bool>(recent),
    };
  }

  WeatherLocation copyWith(
          {String? uid,
          String? name,
          String? lat,
          String? lng,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<String?> todayForecastJson = const Value.absent(),
          Value<String?> todayPWSDataJson = const Value.absent(),
          bool? favourite,
          bool? recent}) =>
      WeatherLocation(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        todayForecastJson: todayForecastJson.present
            ? todayForecastJson.value
            : this.todayForecastJson,
        todayPWSDataJson: todayPWSDataJson.present
            ? todayPWSDataJson.value
            : this.todayPWSDataJson,
        favourite: favourite ?? this.favourite,
        recent: recent ?? this.recent,
      );
  @override
  String toString() {
    return (StringBuffer('WeatherLocation(')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('todayForecastJson: $todayForecastJson, ')
          ..write('todayPWSDataJson: $todayPWSDataJson, ')
          ..write('favourite: $favourite, ')
          ..write('recent: $recent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, name, lat, lng, updatedAt,
      todayForecastJson, todayPWSDataJson, favourite, recent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherLocation &&
          other.uid == this.uid &&
          other.name == this.name &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.updatedAt == this.updatedAt &&
          other.todayForecastJson == this.todayForecastJson &&
          other.todayPWSDataJson == this.todayPWSDataJson &&
          other.favourite == this.favourite &&
          other.recent == this.recent);
}

class WeatherLocationsCompanion extends UpdateCompanion<WeatherLocation> {
  final Value<String> uid;
  final Value<String> name;
  final Value<String> lat;
  final Value<String> lng;
  final Value<DateTime?> updatedAt;
  final Value<String?> todayForecastJson;
  final Value<String?> todayPWSDataJson;
  final Value<bool> favourite;
  final Value<bool> recent;
  const WeatherLocationsCompanion({
    this.uid = const Value.absent(),
    this.name = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.todayForecastJson = const Value.absent(),
    this.todayPWSDataJson = const Value.absent(),
    this.favourite = const Value.absent(),
    this.recent = const Value.absent(),
  });
  WeatherLocationsCompanion.insert({
    required String uid,
    required String name,
    required String lat,
    required String lng,
    this.updatedAt = const Value.absent(),
    this.todayForecastJson = const Value.absent(),
    this.todayPWSDataJson = const Value.absent(),
    required bool favourite,
    required bool recent,
  })  : uid = Value(uid),
        name = Value(name),
        lat = Value(lat),
        lng = Value(lng),
        favourite = Value(favourite),
        recent = Value(recent);
  static Insertable<WeatherLocation> custom({
    Expression<String>? uid,
    Expression<String>? name,
    Expression<String>? lat,
    Expression<String>? lng,
    Expression<DateTime>? updatedAt,
    Expression<String>? todayForecastJson,
    Expression<String>? todayPWSDataJson,
    Expression<bool>? favourite,
    Expression<bool>? recent,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (name != null) 'name': name,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (todayForecastJson != null) 'today_forecast_json': todayForecastJson,
      if (todayPWSDataJson != null) 'today_p_w_s_data_json': todayPWSDataJson,
      if (favourite != null) 'favourite': favourite,
      if (recent != null) 'recent': recent,
    });
  }

  WeatherLocationsCompanion copyWith(
      {Value<String>? uid,
      Value<String>? name,
      Value<String>? lat,
      Value<String>? lng,
      Value<DateTime?>? updatedAt,
      Value<String?>? todayForecastJson,
      Value<String?>? todayPWSDataJson,
      Value<bool>? favourite,
      Value<bool>? recent}) {
    return WeatherLocationsCompanion(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      updatedAt: updatedAt ?? this.updatedAt,
      todayForecastJson: todayForecastJson ?? this.todayForecastJson,
      todayPWSDataJson: todayPWSDataJson ?? this.todayPWSDataJson,
      favourite: favourite ?? this.favourite,
      recent: recent ?? this.recent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lat.present) {
      map['lat'] = Variable<String>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<String>(lng.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (todayForecastJson.present) {
      map['today_forecast_json'] = Variable<String>(todayForecastJson.value);
    }
    if (todayPWSDataJson.present) {
      map['today_p_w_s_data_json'] = Variable<String>(todayPWSDataJson.value);
    }
    if (favourite.present) {
      map['favourite'] = Variable<bool>(favourite.value);
    }
    if (recent.present) {
      map['recent'] = Variable<bool>(recent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeatherLocationsCompanion(')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('todayForecastJson: $todayForecastJson, ')
          ..write('todayPWSDataJson: $todayPWSDataJson, ')
          ..write('favourite: $favourite, ')
          ..write('recent: $recent')
          ..write(')'))
        .toString();
  }
}

class $WeatherHistoryEntriesTable extends WeatherHistoryEntries
    with TableInfo<$WeatherHistoryEntriesTable, WeatherHistoryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeatherHistoryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _weatherLocationUidMeta =
      const VerificationMeta('weatherLocationUid');
  @override
  late final GeneratedColumn<String> weatherLocationUid =
      GeneratedColumn<String>('weather_location_uid', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _weatherDateMeta =
      const VerificationMeta('weatherDate');
  @override
  late final GeneratedColumn<DateTime> weatherDate = GeneratedColumn<DateTime>(
      'weather_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _todayForecastJsonMeta =
      const VerificationMeta('todayForecastJson');
  @override
  late final GeneratedColumn<String> todayForecastJson =
      GeneratedColumn<String>('today_forecast_json', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _todayPWSDataJsonMeta =
      const VerificationMeta('todayPWSDataJson');
  @override
  late final GeneratedColumn<String> todayPWSDataJson = GeneratedColumn<String>(
      'today_p_w_s_data_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        uid,
        weatherLocationUid,
        weatherDate,
        todayForecastJson,
        todayPWSDataJson
      ];
  @override
  String get aliasedName => _alias ?? 'weather_history_entries';
  @override
  String get actualTableName => 'weather_history_entries';
  @override
  VerificationContext validateIntegrity(
      Insertable<WeatherHistoryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('weather_location_uid')) {
      context.handle(
          _weatherLocationUidMeta,
          weatherLocationUid.isAcceptableOrUnknown(
              data['weather_location_uid']!, _weatherLocationUidMeta));
    } else if (isInserting) {
      context.missing(_weatherLocationUidMeta);
    }
    if (data.containsKey('weather_date')) {
      context.handle(
          _weatherDateMeta,
          weatherDate.isAcceptableOrUnknown(
              data['weather_date']!, _weatherDateMeta));
    } else if (isInserting) {
      context.missing(_weatherDateMeta);
    }
    if (data.containsKey('today_forecast_json')) {
      context.handle(
          _todayForecastJsonMeta,
          todayForecastJson.isAcceptableOrUnknown(
              data['today_forecast_json']!, _todayForecastJsonMeta));
    }
    if (data.containsKey('today_p_w_s_data_json')) {
      context.handle(
          _todayPWSDataJsonMeta,
          todayPWSDataJson.isAcceptableOrUnknown(
              data['today_p_w_s_data_json']!, _todayPWSDataJsonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  WeatherHistoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeatherHistoryEntry(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      weatherLocationUid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}weather_location_uid'])!,
      weatherDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}weather_date'])!,
      todayForecastJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}today_forecast_json']),
      todayPWSDataJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}today_p_w_s_data_json']),
    );
  }

  @override
  $WeatherHistoryEntriesTable createAlias(String alias) {
    return $WeatherHistoryEntriesTable(attachedDatabase, alias);
  }
}

class WeatherHistoryEntry extends DataClass
    implements Insertable<WeatherHistoryEntry> {
  final String uid;
  final String weatherLocationUid;
  final DateTime weatherDate;
  final String? todayForecastJson;
  final String? todayPWSDataJson;
  const WeatherHistoryEntry(
      {required this.uid,
      required this.weatherLocationUid,
      required this.weatherDate,
      this.todayForecastJson,
      this.todayPWSDataJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['weather_location_uid'] = Variable<String>(weatherLocationUid);
    map['weather_date'] = Variable<DateTime>(weatherDate);
    if (!nullToAbsent || todayForecastJson != null) {
      map['today_forecast_json'] = Variable<String>(todayForecastJson);
    }
    if (!nullToAbsent || todayPWSDataJson != null) {
      map['today_p_w_s_data_json'] = Variable<String>(todayPWSDataJson);
    }
    return map;
  }

  WeatherHistoryEntriesCompanion toCompanion(bool nullToAbsent) {
    return WeatherHistoryEntriesCompanion(
      uid: Value(uid),
      weatherLocationUid: Value(weatherLocationUid),
      weatherDate: Value(weatherDate),
      todayForecastJson: todayForecastJson == null && nullToAbsent
          ? const Value.absent()
          : Value(todayForecastJson),
      todayPWSDataJson: todayPWSDataJson == null && nullToAbsent
          ? const Value.absent()
          : Value(todayPWSDataJson),
    );
  }

  factory WeatherHistoryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeatherHistoryEntry(
      uid: serializer.fromJson<String>(json['uid']),
      weatherLocationUid:
          serializer.fromJson<String>(json['weatherLocationUid']),
      weatherDate: serializer.fromJson<DateTime>(json['weatherDate']),
      todayForecastJson:
          serializer.fromJson<String?>(json['todayForecastJson']),
      todayPWSDataJson: serializer.fromJson<String?>(json['todayPWSDataJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'weatherLocationUid': serializer.toJson<String>(weatherLocationUid),
      'weatherDate': serializer.toJson<DateTime>(weatherDate),
      'todayForecastJson': serializer.toJson<String?>(todayForecastJson),
      'todayPWSDataJson': serializer.toJson<String?>(todayPWSDataJson),
    };
  }

  WeatherHistoryEntry copyWith(
          {String? uid,
          String? weatherLocationUid,
          DateTime? weatherDate,
          Value<String?> todayForecastJson = const Value.absent(),
          Value<String?> todayPWSDataJson = const Value.absent()}) =>
      WeatherHistoryEntry(
        uid: uid ?? this.uid,
        weatherLocationUid: weatherLocationUid ?? this.weatherLocationUid,
        weatherDate: weatherDate ?? this.weatherDate,
        todayForecastJson: todayForecastJson.present
            ? todayForecastJson.value
            : this.todayForecastJson,
        todayPWSDataJson: todayPWSDataJson.present
            ? todayPWSDataJson.value
            : this.todayPWSDataJson,
      );
  @override
  String toString() {
    return (StringBuffer('WeatherHistoryEntry(')
          ..write('uid: $uid, ')
          ..write('weatherLocationUid: $weatherLocationUid, ')
          ..write('weatherDate: $weatherDate, ')
          ..write('todayForecastJson: $todayForecastJson, ')
          ..write('todayPWSDataJson: $todayPWSDataJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, weatherLocationUid, weatherDate,
      todayForecastJson, todayPWSDataJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherHistoryEntry &&
          other.uid == this.uid &&
          other.weatherLocationUid == this.weatherLocationUid &&
          other.weatherDate == this.weatherDate &&
          other.todayForecastJson == this.todayForecastJson &&
          other.todayPWSDataJson == this.todayPWSDataJson);
}

class WeatherHistoryEntriesCompanion
    extends UpdateCompanion<WeatherHistoryEntry> {
  final Value<String> uid;
  final Value<String> weatherLocationUid;
  final Value<DateTime> weatherDate;
  final Value<String?> todayForecastJson;
  final Value<String?> todayPWSDataJson;
  const WeatherHistoryEntriesCompanion({
    this.uid = const Value.absent(),
    this.weatherLocationUid = const Value.absent(),
    this.weatherDate = const Value.absent(),
    this.todayForecastJson = const Value.absent(),
    this.todayPWSDataJson = const Value.absent(),
  });
  WeatherHistoryEntriesCompanion.insert({
    required String uid,
    required String weatherLocationUid,
    required DateTime weatherDate,
    this.todayForecastJson = const Value.absent(),
    this.todayPWSDataJson = const Value.absent(),
  })  : uid = Value(uid),
        weatherLocationUid = Value(weatherLocationUid),
        weatherDate = Value(weatherDate);
  static Insertable<WeatherHistoryEntry> custom({
    Expression<String>? uid,
    Expression<String>? weatherLocationUid,
    Expression<DateTime>? weatherDate,
    Expression<String>? todayForecastJson,
    Expression<String>? todayPWSDataJson,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (weatherLocationUid != null)
        'weather_location_uid': weatherLocationUid,
      if (weatherDate != null) 'weather_date': weatherDate,
      if (todayForecastJson != null) 'today_forecast_json': todayForecastJson,
      if (todayPWSDataJson != null) 'today_p_w_s_data_json': todayPWSDataJson,
    });
  }

  WeatherHistoryEntriesCompanion copyWith(
      {Value<String>? uid,
      Value<String>? weatherLocationUid,
      Value<DateTime>? weatherDate,
      Value<String?>? todayForecastJson,
      Value<String?>? todayPWSDataJson}) {
    return WeatherHistoryEntriesCompanion(
      uid: uid ?? this.uid,
      weatherLocationUid: weatherLocationUid ?? this.weatherLocationUid,
      weatherDate: weatherDate ?? this.weatherDate,
      todayForecastJson: todayForecastJson ?? this.todayForecastJson,
      todayPWSDataJson: todayPWSDataJson ?? this.todayPWSDataJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (weatherLocationUid.present) {
      map['weather_location_uid'] = Variable<String>(weatherLocationUid.value);
    }
    if (weatherDate.present) {
      map['weather_date'] = Variable<DateTime>(weatherDate.value);
    }
    if (todayForecastJson.present) {
      map['today_forecast_json'] = Variable<String>(todayForecastJson.value);
    }
    if (todayPWSDataJson.present) {
      map['today_p_w_s_data_json'] = Variable<String>(todayPWSDataJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeatherHistoryEntriesCompanion(')
          ..write('uid: $uid, ')
          ..write('weatherLocationUid: $weatherLocationUid, ')
          ..write('weatherDate: $weatherDate, ')
          ..write('todayForecastJson: $todayForecastJson, ')
          ..write('todayPWSDataJson: $todayPWSDataJson')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $DataStoresTable dataStores = $DataStoresTable(this);
  late final $WeatherLocationsTable weatherLocations =
      $WeatherLocationsTable(this);
  late final $WeatherHistoryEntriesTable weatherHistoryEntries =
      $WeatherHistoryEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [dataStores, weatherLocations, weatherHistoryEntries];
}
