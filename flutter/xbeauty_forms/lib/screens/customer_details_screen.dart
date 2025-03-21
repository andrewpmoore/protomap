import 'dart:async';

import 'package:beautyforms/screens/view_dynamic_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/get.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../database/database.dart';
import '../main.dart';
import '../models/question_set_model.dart';
import 'dynamic_form_screen.dart';

class CustomerDetailsScreen extends StatefulWidget {
  final CustomerStoreData customer; // Parsed Form object passed from HomePage

  const CustomerDetailsScreen({super.key, required this.customer});

  @override
  CustomerDetailsScreenState createState() => CustomerDetailsScreenState();
}



class CustomerDetailsScreenState extends State<CustomerDetailsScreen> {

  List<FormStoreData> historyForms = [];
  List<AvailableFormStoreData> availableForms = [];

  bool populated = false;

  StreamSubscription<List<FormStoreData>>? _historyFormsSubscription;
  StreamSubscription<List<AvailableFormStoreData>>? _availableFormsSubscription;


  void saveFormData(Map<String, dynamic> formData, {required formType, required formName, int? id}) async {
    db.saveFormData(formData, widget.customer.id, formName, formType, id );
    // updateHistory();
  }

  Future<bool> deleteFormData({required int id}) async {
    int deleteCount = await db.deleteCustomerForm(id);
    return deleteCount>0;
  }


  void _showDeleteClientConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: const Text("Are you sure you to remove this client and all of their data?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context);
                NavigatorState nav = Navigator.of(context);
                nav.pop(); // Close the dialog
                int deleteCount = await db.deleteCustomer(widget.customer.id);
                scaffold.showSnackBar(SnackBar(content: Text(deleteCount>0 ?'Customer deleted' : 'Could not remove customer')));
                nav.pop(deleteCount); //close the actual form
              },
              child: const Text("Delete user"),
            ),
          ],
        );
      },
    );
  }



  @override
  void initState() {
    super.initState();
    // updateHistory();
    // Set up the stream subscription
    _historyFormsSubscription = db.watchCustomerForms(widget.customer.id).listen((forms) {
      if (mounted) {
        setState(() {
          historyForms = forms;
          populated = true;
        });
      }
    });

    _availableFormsSubscription = db.watchAvailableForms().listen((forms) {
      if (mounted) {
        setState(() {
          availableForms = forms;
        });
      }
    });

  }


  @override
  void dispose() {
    _historyFormsSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () async {

            _showDeleteClientConfirmationDialog();

          }, icon: const Icon(Symbols.delete_outline_rounded))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('${widget.customer.firstName} ${widget.customer.lastName}'),
            isThreeLine: true,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.customer.mobile ?? 'No mobile'),
                if ((widget.customer.altNumber ?? '').isNotEmpty) Text(widget.customer.altNumber ?? ''),
                if ((widget.customer.notes ?? '').isNotEmpty)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notes',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(widget.customer.notes ?? '')
                    ],
                  ),
                if ((widget.customer.warningNotes ?? '').isNotEmpty)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Warnings',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(widget.customer.warningNotes ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.red),
                      )
                    ],
                  )

              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(widget.customer.email ?? 'No email'),
                Text(DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(widget.customer.createdAt!)),
              ],
            ),
          ),
          const SizedBox(height: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Add form'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 8,
                  spacing: 8,
                  children: [
                    for (AvailableFormStoreData availableForm in availableForms)
                      formSelectionButton(context, availableForm)
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('History', style: Theme.of(context).textTheme.titleMedium),
          ),
          Expanded(
            child: historyForms.isEmpty ? const Center(child: Text('No forms submitted')) : ListView.builder(
              itemCount: historyForms.length,
              itemBuilder:(context, index) {
                FormStoreData formStore = historyForms[index];

                // QuestionSet questionSet = QuestionSetMapper.fromJson(formStore.data??'');


                // print('questionSet $questionSet');


                return ListTile(
                  onTap: () async {
                    await captureFormAndSave(context, formStore);
                  },
                  title: Text(formStore.formName),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Symbols.draw_rounded)),
                      IconButton(onPressed: () async
                      {
                        await captureFormAndSave(context, formStore);
                      }, icon: const Icon(Symbols.view_agenda_rounded)),
                    ],
                  ),
                  subtitle: Text(DateFormat.yMMMd(Localizations.localeOf(context).toString())
                      .add_jm()
                      .format(formStore.createdAt!)),
                );
            },
            ),
          )
        ],
      ),
    );
  }

  Future<void> captureFormAndSave(BuildContext context, FormStoreData formStore) async {
    NavigatorState nav = Navigator.of(context);
    final form = await loadFormData('assets/${formStore.formType}.json');
    // Navigate to the form screen with the parsed form data
    Map<String, dynamic>? result = await nav.push(
      MaterialPageRoute(
        builder: (context) => DynamicFormScreen(
          form: form,
          formStore: formStore,
          readOnly: true,
          showAsSinglePage: true,
          onDelete: () async{
            ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context);
            bool success = await deleteFormData(id: formStore.id);
            scaffold.showSnackBar(SnackBar(content: Text(success ?'Form deleted' : 'Could not remove form')));

          },
        ),
      ),
    );
    if (result!=null) {
      print('form result $result');
      saveFormData(result, formType: form.type, formName: form.title, id: formStore.id);
    }
  }

  ElevatedButton formSelectionButton(BuildContext context, AvailableFormStoreData availableForm) {
    return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Set the radius here
                  ),
                ),
                onPressed: () async {
                  NavigatorState nav = Navigator.of(context);
                  final form = await loadFormData('assets/${availableForm.formType}.json');
                  // Navigate to the form screen with the parsed form data
                  Map<String, dynamic>? result = await nav.push(
                    MaterialPageRoute(
                      builder: (context) => DynamicFormScreen(
                        form: form,
                        readOnly: false,
                        showAsSinglePage: false,
                        onDelete: (){},
                      ),
                    ),
                  );
                  if (result!=null) {
                    saveFormData(result, formType: form.type, formName: form.title,);
                  }
                  print('form result $result');
                },
                child: SizedBox(
                  width: 75,
                  height: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 4,),
                      Icon(SymbolsGet.get(availableForm.icon!,SymbolStyle.rounded)),
                      Text(availableForm.formName, maxLines: 2, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelSmall,),
                      const SizedBox(height: 4,),
                    ],
                  ),
                ));
  }

}
