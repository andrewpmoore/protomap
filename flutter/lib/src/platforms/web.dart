


import 'package:drift/drift.dart';
import 'package:drift/native.dart';

LazyDatabase platformOpenDatabaseConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    return NativeDatabase.memory();
  });
}