// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CustomerStoreTable extends CustomerStore
    with TableInfo<$CustomerStoreTable, CustomerStoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerStoreTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _mobileMeta = const VerificationMeta('mobile');
  @override
  late final GeneratedColumn<String> mobile = GeneratedColumn<String>(
      'mobile', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _altNumberMeta =
      const VerificationMeta('altNumber');
  @override
  late final GeneratedColumn<String> altNumber = GeneratedColumn<String>(
      'alt_number', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _warningNotesMeta =
      const VerificationMeta('warningNotes');
  @override
  late final GeneratedColumn<String> warningNotes = GeneratedColumn<String>(
      'warning_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        firstName,
        lastName,
        mobile,
        altNumber,
        notes,
        warningNotes,
        email,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customer_store';
  @override
  VerificationContext validateIntegrity(Insertable<CustomerStoreData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('mobile')) {
      context.handle(_mobileMeta,
          mobile.isAcceptableOrUnknown(data['mobile']!, _mobileMeta));
    }
    if (data.containsKey('alt_number')) {
      context.handle(_altNumberMeta,
          altNumber.isAcceptableOrUnknown(data['alt_number']!, _altNumberMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('warning_notes')) {
      context.handle(
          _warningNotesMeta,
          warningNotes.isAcceptableOrUnknown(
              data['warning_notes']!, _warningNotesMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerStoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerStoreData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      mobile: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mobile']),
      altNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}alt_number']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      warningNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}warning_notes']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $CustomerStoreTable createAlias(String alias) {
    return $CustomerStoreTable(attachedDatabase, alias);
  }
}

class CustomerStoreData extends DataClass
    implements Insertable<CustomerStoreData> {
  final int id;
  final String firstName;
  final String lastName;
  final String? mobile;
  final String? altNumber;
  final String? notes;
  final String? warningNotes;
  final String? email;
  final DateTime? createdAt;
  const CustomerStoreData(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.mobile,
      this.altNumber,
      this.notes,
      this.warningNotes,
      this.email,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    if (!nullToAbsent || mobile != null) {
      map['mobile'] = Variable<String>(mobile);
    }
    if (!nullToAbsent || altNumber != null) {
      map['alt_number'] = Variable<String>(altNumber);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || warningNotes != null) {
      map['warning_notes'] = Variable<String>(warningNotes);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  CustomerStoreCompanion toCompanion(bool nullToAbsent) {
    return CustomerStoreCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      mobile:
          mobile == null && nullToAbsent ? const Value.absent() : Value(mobile),
      altNumber: altNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(altNumber),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      warningNotes: warningNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(warningNotes),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory CustomerStoreData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerStoreData(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      mobile: serializer.fromJson<String?>(json['mobile']),
      altNumber: serializer.fromJson<String?>(json['altNumber']),
      notes: serializer.fromJson<String?>(json['notes']),
      warningNotes: serializer.fromJson<String?>(json['warningNotes']),
      email: serializer.fromJson<String?>(json['email']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'mobile': serializer.toJson<String?>(mobile),
      'altNumber': serializer.toJson<String?>(altNumber),
      'notes': serializer.toJson<String?>(notes),
      'warningNotes': serializer.toJson<String?>(warningNotes),
      'email': serializer.toJson<String?>(email),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  CustomerStoreData copyWith(
          {int? id,
          String? firstName,
          String? lastName,
          Value<String?> mobile = const Value.absent(),
          Value<String?> altNumber = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          Value<String?> warningNotes = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent()}) =>
      CustomerStoreData(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        mobile: mobile.present ? mobile.value : this.mobile,
        altNumber: altNumber.present ? altNumber.value : this.altNumber,
        notes: notes.present ? notes.value : this.notes,
        warningNotes:
            warningNotes.present ? warningNotes.value : this.warningNotes,
        email: email.present ? email.value : this.email,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  CustomerStoreData copyWithCompanion(CustomerStoreCompanion data) {
    return CustomerStoreData(
      id: data.id.present ? data.id.value : this.id,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      mobile: data.mobile.present ? data.mobile.value : this.mobile,
      altNumber: data.altNumber.present ? data.altNumber.value : this.altNumber,
      notes: data.notes.present ? data.notes.value : this.notes,
      warningNotes: data.warningNotes.present
          ? data.warningNotes.value
          : this.warningNotes,
      email: data.email.present ? data.email.value : this.email,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerStoreData(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('mobile: $mobile, ')
          ..write('altNumber: $altNumber, ')
          ..write('notes: $notes, ')
          ..write('warningNotes: $warningNotes, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, firstName, lastName, mobile, altNumber,
      notes, warningNotes, email, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerStoreData &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.mobile == this.mobile &&
          other.altNumber == this.altNumber &&
          other.notes == this.notes &&
          other.warningNotes == this.warningNotes &&
          other.email == this.email &&
          other.createdAt == this.createdAt);
}

class CustomerStoreCompanion extends UpdateCompanion<CustomerStoreData> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String?> mobile;
  final Value<String?> altNumber;
  final Value<String?> notes;
  final Value<String?> warningNotes;
  final Value<String?> email;
  final Value<DateTime?> createdAt;
  const CustomerStoreCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.mobile = const Value.absent(),
    this.altNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.warningNotes = const Value.absent(),
    this.email = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CustomerStoreCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String lastName,
    this.mobile = const Value.absent(),
    this.altNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.warningNotes = const Value.absent(),
    this.email = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : firstName = Value(firstName),
        lastName = Value(lastName);
  static Insertable<CustomerStoreData> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? mobile,
    Expression<String>? altNumber,
    Expression<String>? notes,
    Expression<String>? warningNotes,
    Expression<String>? email,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (mobile != null) 'mobile': mobile,
      if (altNumber != null) 'alt_number': altNumber,
      if (notes != null) 'notes': notes,
      if (warningNotes != null) 'warning_notes': warningNotes,
      if (email != null) 'email': email,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CustomerStoreCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String?>? mobile,
      Value<String?>? altNumber,
      Value<String?>? notes,
      Value<String?>? warningNotes,
      Value<String?>? email,
      Value<DateTime?>? createdAt}) {
    return CustomerStoreCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      mobile: mobile ?? this.mobile,
      altNumber: altNumber ?? this.altNumber,
      notes: notes ?? this.notes,
      warningNotes: warningNotes ?? this.warningNotes,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (mobile.present) {
      map['mobile'] = Variable<String>(mobile.value);
    }
    if (altNumber.present) {
      map['alt_number'] = Variable<String>(altNumber.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (warningNotes.present) {
      map['warning_notes'] = Variable<String>(warningNotes.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerStoreCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('mobile: $mobile, ')
          ..write('altNumber: $altNumber, ')
          ..write('notes: $notes, ')
          ..write('warningNotes: $warningNotes, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $FormStoreTable extends FormStore
    with TableInfo<$FormStoreTable, FormStoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FormStoreTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _formTypeMeta =
      const VerificationMeta('formType');
  @override
  late final GeneratedColumn<String> formType = GeneratedColumn<String>(
      'form_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _formNameMeta =
      const VerificationMeta('formName');
  @override
  late final GeneratedColumn<String> formName = GeneratedColumn<String>(
      'form_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _customerMeta =
      const VerificationMeta('customer');
  @override
  late final GeneratedColumn<int> customer = GeneratedColumn<int>(
      'customer', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES customer_store (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, data, formType, formName, customer, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'form_store';
  @override
  VerificationContext validateIntegrity(Insertable<FormStoreData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    }
    if (data.containsKey('form_type')) {
      context.handle(_formTypeMeta,
          formType.isAcceptableOrUnknown(data['form_type']!, _formTypeMeta));
    } else if (isInserting) {
      context.missing(_formTypeMeta);
    }
    if (data.containsKey('form_name')) {
      context.handle(_formNameMeta,
          formName.isAcceptableOrUnknown(data['form_name']!, _formNameMeta));
    } else if (isInserting) {
      context.missing(_formNameMeta);
    }
    if (data.containsKey('customer')) {
      context.handle(_customerMeta,
          customer.isAcceptableOrUnknown(data['customer']!, _customerMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FormStoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FormStoreData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data']),
      formType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}form_type'])!,
      formName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}form_name'])!,
      customer: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}customer']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $FormStoreTable createAlias(String alias) {
    return $FormStoreTable(attachedDatabase, alias);
  }
}

class FormStoreData extends DataClass implements Insertable<FormStoreData> {
  final int id;
  final String? data;
  final String formType;
  final String formName;
  final int? customer;
  final DateTime? createdAt;
  const FormStoreData(
      {required this.id,
      this.data,
      required this.formType,
      required this.formName,
      this.customer,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || data != null) {
      map['data'] = Variable<String>(data);
    }
    map['form_type'] = Variable<String>(formType);
    map['form_name'] = Variable<String>(formName);
    if (!nullToAbsent || customer != null) {
      map['customer'] = Variable<int>(customer);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  FormStoreCompanion toCompanion(bool nullToAbsent) {
    return FormStoreCompanion(
      id: Value(id),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
      formType: Value(formType),
      formName: Value(formName),
      customer: customer == null && nullToAbsent
          ? const Value.absent()
          : Value(customer),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory FormStoreData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FormStoreData(
      id: serializer.fromJson<int>(json['id']),
      data: serializer.fromJson<String?>(json['data']),
      formType: serializer.fromJson<String>(json['formType']),
      formName: serializer.fromJson<String>(json['formName']),
      customer: serializer.fromJson<int?>(json['customer']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'data': serializer.toJson<String?>(data),
      'formType': serializer.toJson<String>(formType),
      'formName': serializer.toJson<String>(formName),
      'customer': serializer.toJson<int?>(customer),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  FormStoreData copyWith(
          {int? id,
          Value<String?> data = const Value.absent(),
          String? formType,
          String? formName,
          Value<int?> customer = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent()}) =>
      FormStoreData(
        id: id ?? this.id,
        data: data.present ? data.value : this.data,
        formType: formType ?? this.formType,
        formName: formName ?? this.formName,
        customer: customer.present ? customer.value : this.customer,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  FormStoreData copyWithCompanion(FormStoreCompanion data) {
    return FormStoreData(
      id: data.id.present ? data.id.value : this.id,
      data: data.data.present ? data.data.value : this.data,
      formType: data.formType.present ? data.formType.value : this.formType,
      formName: data.formName.present ? data.formName.value : this.formName,
      customer: data.customer.present ? data.customer.value : this.customer,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FormStoreData(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('formType: $formType, ')
          ..write('formName: $formName, ')
          ..write('customer: $customer, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, data, formType, formName, customer, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FormStoreData &&
          other.id == this.id &&
          other.data == this.data &&
          other.formType == this.formType &&
          other.formName == this.formName &&
          other.customer == this.customer &&
          other.createdAt == this.createdAt);
}

class FormStoreCompanion extends UpdateCompanion<FormStoreData> {
  final Value<int> id;
  final Value<String?> data;
  final Value<String> formType;
  final Value<String> formName;
  final Value<int?> customer;
  final Value<DateTime?> createdAt;
  const FormStoreCompanion({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    this.formType = const Value.absent(),
    this.formName = const Value.absent(),
    this.customer = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FormStoreCompanion.insert({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    required String formType,
    required String formName,
    this.customer = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : formType = Value(formType),
        formName = Value(formName);
  static Insertable<FormStoreData> custom({
    Expression<int>? id,
    Expression<String>? data,
    Expression<String>? formType,
    Expression<String>? formName,
    Expression<int>? customer,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (data != null) 'data': data,
      if (formType != null) 'form_type': formType,
      if (formName != null) 'form_name': formName,
      if (customer != null) 'customer': customer,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FormStoreCompanion copyWith(
      {Value<int>? id,
      Value<String?>? data,
      Value<String>? formType,
      Value<String>? formName,
      Value<int?>? customer,
      Value<DateTime?>? createdAt}) {
    return FormStoreCompanion(
      id: id ?? this.id,
      data: data ?? this.data,
      formType: formType ?? this.formType,
      formName: formName ?? this.formName,
      customer: customer ?? this.customer,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (formType.present) {
      map['form_type'] = Variable<String>(formType.value);
    }
    if (formName.present) {
      map['form_name'] = Variable<String>(formName.value);
    }
    if (customer.present) {
      map['customer'] = Variable<int>(customer.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FormStoreCompanion(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('formType: $formType, ')
          ..write('formName: $formName, ')
          ..write('customer: $customer, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AvailableFormStoreTable extends AvailableFormStore
    with TableInfo<$AvailableFormStoreTable, AvailableFormStoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AvailableFormStoreTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _formTypeMeta =
      const VerificationMeta('formType');
  @override
  late final GeneratedColumn<String> formType = GeneratedColumn<String>(
      'form_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _formNameMeta =
      const VerificationMeta('formName');
  @override
  late final GeneratedColumn<String> formName = GeneratedColumn<String>(
      'form_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, formType, formName, icon, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'available_form_store';
  @override
  VerificationContext validateIntegrity(
      Insertable<AvailableFormStoreData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('form_type')) {
      context.handle(_formTypeMeta,
          formType.isAcceptableOrUnknown(data['form_type']!, _formTypeMeta));
    } else if (isInserting) {
      context.missing(_formTypeMeta);
    }
    if (data.containsKey('form_name')) {
      context.handle(_formNameMeta,
          formName.isAcceptableOrUnknown(data['form_name']!, _formNameMeta));
    } else if (isInserting) {
      context.missing(_formNameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AvailableFormStoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AvailableFormStoreData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      formType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}form_type'])!,
      formName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}form_name'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon']),
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
    );
  }

  @override
  $AvailableFormStoreTable createAlias(String alias) {
    return $AvailableFormStoreTable(attachedDatabase, alias);
  }
}

class AvailableFormStoreData extends DataClass
    implements Insertable<AvailableFormStoreData> {
  final int id;
  final String formType;
  final String formName;
  final String? icon;
  final int sortOrder;
  const AvailableFormStoreData(
      {required this.id,
      required this.formType,
      required this.formName,
      this.icon,
      required this.sortOrder});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['form_type'] = Variable<String>(formType);
    map['form_name'] = Variable<String>(formName);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  AvailableFormStoreCompanion toCompanion(bool nullToAbsent) {
    return AvailableFormStoreCompanion(
      id: Value(id),
      formType: Value(formType),
      formName: Value(formName),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      sortOrder: Value(sortOrder),
    );
  }

  factory AvailableFormStoreData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AvailableFormStoreData(
      id: serializer.fromJson<int>(json['id']),
      formType: serializer.fromJson<String>(json['formType']),
      formName: serializer.fromJson<String>(json['formName']),
      icon: serializer.fromJson<String?>(json['icon']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'formType': serializer.toJson<String>(formType),
      'formName': serializer.toJson<String>(formName),
      'icon': serializer.toJson<String?>(icon),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  AvailableFormStoreData copyWith(
          {int? id,
          String? formType,
          String? formName,
          Value<String?> icon = const Value.absent(),
          int? sortOrder}) =>
      AvailableFormStoreData(
        id: id ?? this.id,
        formType: formType ?? this.formType,
        formName: formName ?? this.formName,
        icon: icon.present ? icon.value : this.icon,
        sortOrder: sortOrder ?? this.sortOrder,
      );
  AvailableFormStoreData copyWithCompanion(AvailableFormStoreCompanion data) {
    return AvailableFormStoreData(
      id: data.id.present ? data.id.value : this.id,
      formType: data.formType.present ? data.formType.value : this.formType,
      formName: data.formName.present ? data.formName.value : this.formName,
      icon: data.icon.present ? data.icon.value : this.icon,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AvailableFormStoreData(')
          ..write('id: $id, ')
          ..write('formType: $formType, ')
          ..write('formName: $formName, ')
          ..write('icon: $icon, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, formType, formName, icon, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AvailableFormStoreData &&
          other.id == this.id &&
          other.formType == this.formType &&
          other.formName == this.formName &&
          other.icon == this.icon &&
          other.sortOrder == this.sortOrder);
}

class AvailableFormStoreCompanion
    extends UpdateCompanion<AvailableFormStoreData> {
  final Value<int> id;
  final Value<String> formType;
  final Value<String> formName;
  final Value<String?> icon;
  final Value<int> sortOrder;
  const AvailableFormStoreCompanion({
    this.id = const Value.absent(),
    this.formType = const Value.absent(),
    this.formName = const Value.absent(),
    this.icon = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  AvailableFormStoreCompanion.insert({
    this.id = const Value.absent(),
    required String formType,
    required String formName,
    this.icon = const Value.absent(),
    required int sortOrder,
  })  : formType = Value(formType),
        formName = Value(formName),
        sortOrder = Value(sortOrder);
  static Insertable<AvailableFormStoreData> custom({
    Expression<int>? id,
    Expression<String>? formType,
    Expression<String>? formName,
    Expression<String>? icon,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (formType != null) 'form_type': formType,
      if (formName != null) 'form_name': formName,
      if (icon != null) 'icon': icon,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  AvailableFormStoreCompanion copyWith(
      {Value<int>? id,
      Value<String>? formType,
      Value<String>? formName,
      Value<String?>? icon,
      Value<int>? sortOrder}) {
    return AvailableFormStoreCompanion(
      id: id ?? this.id,
      formType: formType ?? this.formType,
      formName: formName ?? this.formName,
      icon: icon ?? this.icon,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (formType.present) {
      map['form_type'] = Variable<String>(formType.value);
    }
    if (formName.present) {
      map['form_name'] = Variable<String>(formName.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AvailableFormStoreCompanion(')
          ..write('id: $id, ')
          ..write('formType: $formType, ')
          ..write('formName: $formName, ')
          ..write('icon: $icon, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CustomerStoreTable customerStore = $CustomerStoreTable(this);
  late final $FormStoreTable formStore = $FormStoreTable(this);
  late final $AvailableFormStoreTable availableFormStore =
      $AvailableFormStoreTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [customerStore, formStore, availableFormStore];
}

typedef $$CustomerStoreTableCreateCompanionBuilder = CustomerStoreCompanion
    Function({
  Value<int> id,
  required String firstName,
  required String lastName,
  Value<String?> mobile,
  Value<String?> altNumber,
  Value<String?> notes,
  Value<String?> warningNotes,
  Value<String?> email,
  Value<DateTime?> createdAt,
});
typedef $$CustomerStoreTableUpdateCompanionBuilder = CustomerStoreCompanion
    Function({
  Value<int> id,
  Value<String> firstName,
  Value<String> lastName,
  Value<String?> mobile,
  Value<String?> altNumber,
  Value<String?> notes,
  Value<String?> warningNotes,
  Value<String?> email,
  Value<DateTime?> createdAt,
});

final class $$CustomerStoreTableReferences extends BaseReferences<_$AppDatabase,
    $CustomerStoreTable, CustomerStoreData> {
  $$CustomerStoreTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FormStoreTable, List<FormStoreData>>
      _formStoreRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.formStore,
          aliasName:
              $_aliasNameGenerator(db.customerStore.id, db.formStore.customer));

  $$FormStoreTableProcessedTableManager get formStoreRefs {
    final manager = $$FormStoreTableTableManager($_db, $_db.formStore)
        .filter((f) => f.customer.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_formStoreRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CustomerStoreTableFilterComposer
    extends Composer<_$AppDatabase, $CustomerStoreTable> {
  $$CustomerStoreTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mobile => $composableBuilder(
      column: $table.mobile, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get altNumber => $composableBuilder(
      column: $table.altNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get warningNotes => $composableBuilder(
      column: $table.warningNotes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> formStoreRefs(
      Expression<bool> Function($$FormStoreTableFilterComposer f) f) {
    final $$FormStoreTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.formStore,
        getReferencedColumn: (t) => t.customer,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FormStoreTableFilterComposer(
              $db: $db,
              $table: $db.formStore,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CustomerStoreTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomerStoreTable> {
  $$CustomerStoreTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mobile => $composableBuilder(
      column: $table.mobile, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get altNumber => $composableBuilder(
      column: $table.altNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get warningNotes => $composableBuilder(
      column: $table.warningNotes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$CustomerStoreTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomerStoreTable> {
  $$CustomerStoreTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get mobile =>
      $composableBuilder(column: $table.mobile, builder: (column) => column);

  GeneratedColumn<String> get altNumber =>
      $composableBuilder(column: $table.altNumber, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get warningNotes => $composableBuilder(
      column: $table.warningNotes, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> formStoreRefs<T extends Object>(
      Expression<T> Function($$FormStoreTableAnnotationComposer a) f) {
    final $$FormStoreTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.formStore,
        getReferencedColumn: (t) => t.customer,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FormStoreTableAnnotationComposer(
              $db: $db,
              $table: $db.formStore,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CustomerStoreTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomerStoreTable,
    CustomerStoreData,
    $$CustomerStoreTableFilterComposer,
    $$CustomerStoreTableOrderingComposer,
    $$CustomerStoreTableAnnotationComposer,
    $$CustomerStoreTableCreateCompanionBuilder,
    $$CustomerStoreTableUpdateCompanionBuilder,
    (CustomerStoreData, $$CustomerStoreTableReferences),
    CustomerStoreData,
    PrefetchHooks Function({bool formStoreRefs})> {
  $$CustomerStoreTableTableManager(_$AppDatabase db, $CustomerStoreTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomerStoreTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomerStoreTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomerStoreTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String?> mobile = const Value.absent(),
            Value<String?> altNumber = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> warningNotes = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              CustomerStoreCompanion(
            id: id,
            firstName: firstName,
            lastName: lastName,
            mobile: mobile,
            altNumber: altNumber,
            notes: notes,
            warningNotes: warningNotes,
            email: email,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String firstName,
            required String lastName,
            Value<String?> mobile = const Value.absent(),
            Value<String?> altNumber = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> warningNotes = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              CustomerStoreCompanion.insert(
            id: id,
            firstName: firstName,
            lastName: lastName,
            mobile: mobile,
            altNumber: altNumber,
            notes: notes,
            warningNotes: warningNotes,
            email: email,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CustomerStoreTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({formStoreRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (formStoreRefs) db.formStore],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (formStoreRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CustomerStoreTableReferences
                            ._formStoreRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CustomerStoreTableReferences(db, table, p0)
                                .formStoreRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.customer == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CustomerStoreTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomerStoreTable,
    CustomerStoreData,
    $$CustomerStoreTableFilterComposer,
    $$CustomerStoreTableOrderingComposer,
    $$CustomerStoreTableAnnotationComposer,
    $$CustomerStoreTableCreateCompanionBuilder,
    $$CustomerStoreTableUpdateCompanionBuilder,
    (CustomerStoreData, $$CustomerStoreTableReferences),
    CustomerStoreData,
    PrefetchHooks Function({bool formStoreRefs})>;
typedef $$FormStoreTableCreateCompanionBuilder = FormStoreCompanion Function({
  Value<int> id,
  Value<String?> data,
  required String formType,
  required String formName,
  Value<int?> customer,
  Value<DateTime?> createdAt,
});
typedef $$FormStoreTableUpdateCompanionBuilder = FormStoreCompanion Function({
  Value<int> id,
  Value<String?> data,
  Value<String> formType,
  Value<String> formName,
  Value<int?> customer,
  Value<DateTime?> createdAt,
});

final class $$FormStoreTableReferences
    extends BaseReferences<_$AppDatabase, $FormStoreTable, FormStoreData> {
  $$FormStoreTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CustomerStoreTable _customerTable(_$AppDatabase db) =>
      db.customerStore.createAlias(
          $_aliasNameGenerator(db.formStore.customer, db.customerStore.id));

  $$CustomerStoreTableProcessedTableManager? get customer {
    if ($_item.customer == null) return null;
    final manager = $$CustomerStoreTableTableManager($_db, $_db.customerStore)
        .filter((f) => f.id($_item.customer!));
    final item = $_typedResult.readTableOrNull(_customerTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$FormStoreTableFilterComposer
    extends Composer<_$AppDatabase, $FormStoreTable> {
  $$FormStoreTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get formType => $composableBuilder(
      column: $table.formType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get formName => $composableBuilder(
      column: $table.formName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$CustomerStoreTableFilterComposer get customer {
    final $$CustomerStoreTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customer,
        referencedTable: $db.customerStore,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomerStoreTableFilterComposer(
              $db: $db,
              $table: $db.customerStore,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FormStoreTableOrderingComposer
    extends Composer<_$AppDatabase, $FormStoreTable> {
  $$FormStoreTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get formType => $composableBuilder(
      column: $table.formType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get formName => $composableBuilder(
      column: $table.formName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$CustomerStoreTableOrderingComposer get customer {
    final $$CustomerStoreTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customer,
        referencedTable: $db.customerStore,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomerStoreTableOrderingComposer(
              $db: $db,
              $table: $db.customerStore,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FormStoreTableAnnotationComposer
    extends Composer<_$AppDatabase, $FormStoreTable> {
  $$FormStoreTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<String> get formType =>
      $composableBuilder(column: $table.formType, builder: (column) => column);

  GeneratedColumn<String> get formName =>
      $composableBuilder(column: $table.formName, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CustomerStoreTableAnnotationComposer get customer {
    final $$CustomerStoreTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.customer,
        referencedTable: $db.customerStore,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CustomerStoreTableAnnotationComposer(
              $db: $db,
              $table: $db.customerStore,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FormStoreTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FormStoreTable,
    FormStoreData,
    $$FormStoreTableFilterComposer,
    $$FormStoreTableOrderingComposer,
    $$FormStoreTableAnnotationComposer,
    $$FormStoreTableCreateCompanionBuilder,
    $$FormStoreTableUpdateCompanionBuilder,
    (FormStoreData, $$FormStoreTableReferences),
    FormStoreData,
    PrefetchHooks Function({bool customer})> {
  $$FormStoreTableTableManager(_$AppDatabase db, $FormStoreTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FormStoreTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FormStoreTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FormStoreTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> data = const Value.absent(),
            Value<String> formType = const Value.absent(),
            Value<String> formName = const Value.absent(),
            Value<int?> customer = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              FormStoreCompanion(
            id: id,
            data: data,
            formType: formType,
            formName: formName,
            customer: customer,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> data = const Value.absent(),
            required String formType,
            required String formName,
            Value<int?> customer = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              FormStoreCompanion.insert(
            id: id,
            data: data,
            formType: formType,
            formName: formName,
            customer: customer,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$FormStoreTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({customer = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (customer) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.customer,
                    referencedTable:
                        $$FormStoreTableReferences._customerTable(db),
                    referencedColumn:
                        $$FormStoreTableReferences._customerTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$FormStoreTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FormStoreTable,
    FormStoreData,
    $$FormStoreTableFilterComposer,
    $$FormStoreTableOrderingComposer,
    $$FormStoreTableAnnotationComposer,
    $$FormStoreTableCreateCompanionBuilder,
    $$FormStoreTableUpdateCompanionBuilder,
    (FormStoreData, $$FormStoreTableReferences),
    FormStoreData,
    PrefetchHooks Function({bool customer})>;
typedef $$AvailableFormStoreTableCreateCompanionBuilder
    = AvailableFormStoreCompanion Function({
  Value<int> id,
  required String formType,
  required String formName,
  Value<String?> icon,
  required int sortOrder,
});
typedef $$AvailableFormStoreTableUpdateCompanionBuilder
    = AvailableFormStoreCompanion Function({
  Value<int> id,
  Value<String> formType,
  Value<String> formName,
  Value<String?> icon,
  Value<int> sortOrder,
});

class $$AvailableFormStoreTableFilterComposer
    extends Composer<_$AppDatabase, $AvailableFormStoreTable> {
  $$AvailableFormStoreTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get formType => $composableBuilder(
      column: $table.formType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get formName => $composableBuilder(
      column: $table.formName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));
}

class $$AvailableFormStoreTableOrderingComposer
    extends Composer<_$AppDatabase, $AvailableFormStoreTable> {
  $$AvailableFormStoreTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get formType => $composableBuilder(
      column: $table.formType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get formName => $composableBuilder(
      column: $table.formName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));
}

class $$AvailableFormStoreTableAnnotationComposer
    extends Composer<_$AppDatabase, $AvailableFormStoreTable> {
  $$AvailableFormStoreTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get formType =>
      $composableBuilder(column: $table.formType, builder: (column) => column);

  GeneratedColumn<String> get formName =>
      $composableBuilder(column: $table.formName, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$AvailableFormStoreTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AvailableFormStoreTable,
    AvailableFormStoreData,
    $$AvailableFormStoreTableFilterComposer,
    $$AvailableFormStoreTableOrderingComposer,
    $$AvailableFormStoreTableAnnotationComposer,
    $$AvailableFormStoreTableCreateCompanionBuilder,
    $$AvailableFormStoreTableUpdateCompanionBuilder,
    (
      AvailableFormStoreData,
      BaseReferences<_$AppDatabase, $AvailableFormStoreTable,
          AvailableFormStoreData>
    ),
    AvailableFormStoreData,
    PrefetchHooks Function()> {
  $$AvailableFormStoreTableTableManager(
      _$AppDatabase db, $AvailableFormStoreTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AvailableFormStoreTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AvailableFormStoreTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AvailableFormStoreTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> formType = const Value.absent(),
            Value<String> formName = const Value.absent(),
            Value<String?> icon = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
          }) =>
              AvailableFormStoreCompanion(
            id: id,
            formType: formType,
            formName: formName,
            icon: icon,
            sortOrder: sortOrder,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String formType,
            required String formName,
            Value<String?> icon = const Value.absent(),
            required int sortOrder,
          }) =>
              AvailableFormStoreCompanion.insert(
            id: id,
            formType: formType,
            formName: formName,
            icon: icon,
            sortOrder: sortOrder,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AvailableFormStoreTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AvailableFormStoreTable,
    AvailableFormStoreData,
    $$AvailableFormStoreTableFilterComposer,
    $$AvailableFormStoreTableOrderingComposer,
    $$AvailableFormStoreTableAnnotationComposer,
    $$AvailableFormStoreTableCreateCompanionBuilder,
    $$AvailableFormStoreTableUpdateCompanionBuilder,
    (
      AvailableFormStoreData,
      BaseReferences<_$AppDatabase, $AvailableFormStoreTable,
          AvailableFormStoreData>
    ),
    AvailableFormStoreData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CustomerStoreTableTableManager get customerStore =>
      $$CustomerStoreTableTableManager(_db, _db.customerStore);
  $$FormStoreTableTableManager get formStore =>
      $$FormStoreTableTableManager(_db, _db.formStore);
  $$AvailableFormStoreTableTableManager get availableFormStore =>
      $$AvailableFormStoreTableTableManager(_db, _db.availableFormStore);
}
