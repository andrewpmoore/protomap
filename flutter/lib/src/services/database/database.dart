import 'package:drift/drift.dart';

part 'database.g.dart';

@DataClassName('DataStore')
class DataStores extends Table{
  TextColumn get key => text()();
  TextColumn get type => text()();
  TextColumn get createdAt => text().nullable()();
  TextColumn get forDate => text().nullable()();
  TextColumn get json => text().nullable()();
  TextColumn get basicValue => text().nullable()();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('WeatherLocation')
class WeatherLocations extends Table{
  TextColumn get uid => text()();
  TextColumn get name => text()();
  TextColumn get lat => text()();
  TextColumn get lng => text()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  TextColumn get todayForecastJson => text().nullable()();
  TextColumn get todayPWSDataJson => text().nullable()();
  BoolColumn get favourite => boolean()();
  BoolColumn get recent => boolean()();

  @override
  Set<Column> get primaryKey => {uid};
}


@DataClassName('WeatherHistoryEntry')
class WeatherHistoryEntries extends Table{
  TextColumn get uid => text()();
  TextColumn get weatherLocationUid => text()();
  DateTimeColumn get weatherDate => dateTime()();
  TextColumn get todayForecastJson => text().nullable()();
  TextColumn get todayPWSDataJson => text().nullable()();

  @override
  Set<Column> get primaryKey => {uid};
}


@DriftDatabase(tables: [DataStores, WeatherLocations, WeatherHistoryEntries ])
class AppDatabase extends _$AppDatabase {
  // we tell the database where to store the data with this constructor
  AppDatabase(LazyDatabase lazyDatabase) : super(lazyDatabase);

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;


  //data stores
  Future<int> addDataStoreEntry(DataStore data) {
    return into(dataStores).insertOnConflictUpdate(data);
  }

  void deleteDataStoreEntry(String key) {
    delete(dataStores).where((tbl) => tbl.key.equals(key));
  }

  Stream<DataStore> watchDataStoreByKey(String key) {
    return (select(dataStores)..where((t) => t.key.equals(key))).watchSingle();
  }

  Stream<List<DataStore>> watchDataStoreByType(String type) {
    return (select(dataStores)..where((t) => t.type.equals(type))).watch();
  }


  Future<DataStore> getDataStoreByKey(String key) {
    return (select(dataStores)..where((t) => t.key.equals(key))).getSingle();
  }

  Future<List<DataStore>> getDataStoreByType(String type) {
    return (select(dataStores)..where((t) => t.type.equals(type))).get();
  }


  //weather location
  Future<int> addWeatherLocationEntry(WeatherLocation data) {
    return into(weatherLocations).insertOnConflictUpdate(data);
  }

  void deleteWeatherLocationEntry(String uid) {
    delete(weatherLocations).where((tbl) => tbl.uid.equals(uid));
  }

  Stream<WeatherLocation> watchWeatherLocationByUid(String uid) {
    return (select(weatherLocations)..where((t) => t.uid.equals(uid))).watchSingle();
  }

  Stream<List<WeatherLocation>> watchWeatherLocations() {
    return (select(weatherLocations).watch());
  }

  Future<List<WeatherLocation>> getWeatherLocations() {
    return (select(weatherLocations).get());
  }

  Future<WeatherLocation> getWeatherLocationByUid(String uid) {
    return (select(weatherLocations)..where((t) => t.uid.equals(uid))).getSingle();
  }


  //weather location
  Future<int> addWeatherHistoryEntry(WeatherHistoryEntry data) {
    return into(weatherHistoryEntries).insertOnConflictUpdate(data);
  }

  void deleteWeatherHistoryEntries(String weatherLocationUid) {
    delete(weatherHistoryEntries).where((tbl) => tbl.weatherLocationUid.equals(weatherLocationUid));
  }

  Stream<List<WeatherHistoryEntry>> getWeatherHistoryEntriesForLocation(String weatherLocationUid) {
    return (select(weatherHistoryEntries)..where((t) => t.weatherLocationUid.equals(weatherLocationUid))).watch();
  }





}

