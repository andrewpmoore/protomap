import 'dart:convert';
import 'package:beautyforms/database/database.dart';
import 'package:material_symbols_icons/symbols_map.dart';

import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../main.dart';
import '../models/question_set_model.dart';
import 'customer_details_screen.dart';
import 'dynamic_form_screen.dart'; // Import the file where DynamicFormScreen is defined

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<CustomerStoreData> _searchResults = [];
  bool _searchComplete = false;


  @override
  void initState() {
    super.initState();

    var allIcons = materialSymbolsMap;
    // listenToCustomerChanges();
    // fetchAllCustomerData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchComplete = true;
        _searchResults = [];
      });
      return;
    }

    // Perform the search and update the search results
    final results = await db.searchCustomers(query);

    setState(() {
      _searchComplete = true;
      _searchResults = results;
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _searchResults = []); // Clear search results
  }





  Future<int> saveCustomerData(Map<String, dynamic> customerData) async {
    return db.saveCustomerData(customerData);
  }

  // void saveFormData(Map<String, dynamic> formData) async {
  //   //
  //   // // Use a unique key for each form submission, e.g., timestamp
  //   // final uniqueKey = DateTime.now().toIso8601String();
  //   // await formBox.put(uniqueKey, formData);
  //   //
  //   // print("Form data saved with key: $uniqueKey");
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(tooltip: 'Add new client', onPressed: () async {
                  // Load and parse the JSON data
                  NavigatorState nav = Navigator.of(context);
                  final form = await loadFormData('assets/customer_form.json');
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
                  print('form result $result');
                  if (result!=null) {
                    int customerId = await saveCustomerData(result);
                    CustomerStoreData customer = await db.getCustomer(customerId);
                    navigateToCustomer(nav, customer);
                  }
      }, child: const Icon(Symbols.person_add_alt_rounded)),
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DriftDbViewer(db)));
              },
              icon: const Icon(Symbols.data_object_rounded))
        ],
      ),
      body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          labelText: 'Search Customers',
                          border: const OutlineInputBorder(),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                            icon: const Icon(Symbols.clear_rounded),
                            onPressed: _clearSearch,
                          )
                              : null,
                        ),
                        onChanged: (value) => setState(() {
                          _searchComplete = false;
                        }), // Refreshes suffixIcon state
                        onSubmitted: _performSearch,
                      ),
                    ),
                    const SizedBox(width: 8,),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // Set the radius here
                            ),
                          ),
                          onPressed: _searchController.text.isEmpty ? null : ()=> _performSearch(_searchController.text), child: const Row(children: [
                        Icon(Symbols.search_rounded),
                        Text('Search')
                      ],)),
                    )
                  ],
                ),
              ),
              if (_searchResults.isEmpty&&_searchComplete) const Center(child: Text('No details found')),
              if (_searchResults.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final customer = _searchResults[index];
                    return ListTile(
                      onTap: () async{
                        navigateToCustomer(Navigator.of(context), customer);
                      },
                      title: Text('${customer.firstName} ${customer.lastName}'),
                      subtitle: Text(customer.mobile ?? 'No mobile'),
                      trailing: Text(customer.email ?? 'No email'),
                    );
                  },
                ),
              ),
            ],
          )

          ),
    );
  }

  void navigateToCustomer(NavigatorState nav, CustomerStoreData customer) async {
    // Navigate to the form screen with the parsed form data
    await nav.push(
      MaterialPageRoute(
        builder: (context) => CustomerDetailsScreen(
          customer: customer,
        ),
      ),
    );
    _performSearch(_searchController.text);
  }
}
