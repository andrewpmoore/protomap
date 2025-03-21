import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class CustomerStore extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text().withLength(min: 2, max: 200)();
  TextColumn get lastName => text().withLength(min: 2, max: 200)();
  TextColumn get mobile => text().nullable().withLength(min: 2, max: 20)();
  TextColumn get altNumber => text().nullable().withLength(min: 2, max: 20)();
  TextColumn get notes => text().nullable()();
  TextColumn get warningNotes => text().nullable()();
  TextColumn get email => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

class FormStore extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get data => text().nullable()();
  TextColumn get formType => text()();
  TextColumn get formName => text()();
  IntColumn get customer => integer().nullable().references(CustomerStore, #id)();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

class AvailableFormStore extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get formType => text()();
  TextColumn get formName => text()();
  TextColumn get icon => text().nullable()();
  IntColumn get sortOrder => integer()();
}



@DriftDatabase(tables: [CustomerStore, FormStore, AvailableFormStore])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;


  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async{
        await m.createAll();
        await createInitialData();
      },
      onUpgrade: (Migrator m, int from, int to) async {

    }
    );
  }

  static QueryExecutor _openConnection() {
    // driftDatabase from package:drift_flutter stores the database in
    // getApplicationDocumentsDirectory().
    return driftDatabase(name: 'beauty_database',);
  }




  //customer data operations
  Future<int> saveCustomerData(Map<String, dynamic> customerData) async {
    return await into(customerStore).insert(CustomerStoreCompanion.insert(
        firstName: customerData['firstName'],
        lastName: customerData['lastName'],
        mobile: Value(customerData['mobile']),
        altNumber: Value(customerData['altPhone']),
        createdAt: Value(DateTime.now()),
        email: Value(customerData['email']),
        notes: Value(customerData['notes']),
        warningNotes: Value(customerData['warningNotes'])
    ));
  }

  // Search function
  Future<List<CustomerStoreData>> searchCustomers(String query) async {
    final keyword = '%$query%'; // Wrap the query in '%' for partial matching

    return (select(customerStore)
      ..where((tbl) => tbl.firstName.like(keyword) |
      tbl.lastName.like(keyword) |
      tbl.mobile.like(keyword) |
      tbl.email.like(keyword)))
        .get();
  }

  Future<CustomerStoreData> getCustomer(int customerId) async {
    return (select(customerStore)
      ..where((tbl) => tbl.id.equals(customerId)))
        .getSingle();
  }

  Future<int> deleteCustomer(int customerId) async {
    return (delete(customerStore)..where((t) => t.id.equals(customerId))).go();
  }



  //form data operations
  void saveFormData(Map<String, dynamic> formData, int customerId, String formName, String formType, int? id) async {
    final formEntry = FormStoreCompanion(
      id: id != null ? Value(id) : const Value.absent(),
      formType: Value(formType),
      formName: Value(formName),
      createdAt: Value(DateTime.now()),
      customer: Value(customerId),
      data: Value(jsonEncode(formData)),
    );

    // Use insertOnConflictUpdate to either insert a new record or update if a conflict occurs
    await into(formStore).insertOnConflictUpdate(formEntry);
  }

  Future<List<FormStoreData>> getCustomerForms(int customerId) async {
    return (select(formStore)..where((tbl) => tbl.customer.equals(customerId))).get();
  }

  Stream<List<FormStoreData>> watchCustomerForms(int customerId) {
    return (select(formStore)
      ..where((tbl) => tbl.customer.equals(customerId))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.createdAt, mode: OrderingMode.desc)])
    ).watch();
  }


  Future<int> deleteCustomerForm(int formId) async {
    return (delete(formStore)..where((t) => t.id.equals(formId))).go();
  }

  Future<void> saveAvailableForm(int? id, String formType, String formName, String icon, int sortOrder) async {
    await into(availableFormStore).insert(AvailableFormStoreCompanion.insert(
      id: id != null ? Value(id) : const Value.absent(),
      formName: formName,
      formType: formType,
      sortOrder: sortOrder,
      icon: Value(icon),
    ));
  }

  Stream<List<AvailableFormStoreData>> watchAvailableForms() {
    return select(availableFormStore).watch();
  }



  Future<void> createInitialData() async {
    await saveAvailableForm(1, 'massage_form', 'Massage consent form', 'spa', 1);
    await saveAvailableForm(2, 'patch_test_form', 'Patch test form', 'health_and_beauty', 2);
  }

}