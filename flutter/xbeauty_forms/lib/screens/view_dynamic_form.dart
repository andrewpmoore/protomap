import 'package:beautyforms/database/database.dart';
import 'package:flutter/material.dart';

class ViewDynamicForm extends StatelessWidget {
  final CustomerStoreData customer;
  final FormStoreData form;
  const ViewDynamicForm({super.key, required this.customer, required this.form});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('details here ${customer.firstName} form ${form.formType}'),
    );
  }
}
