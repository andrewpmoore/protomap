import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:material_symbols_icons/get.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../database/database.dart';
import '../models/question_set_model.dart';

class DynamicFormScreen extends StatefulWidget {
  final QuestionSet form; // Parsed Form object passed from HomePage
  final FormStoreData? formStore;
  final bool readOnly;
  final bool showAsSinglePage;
  final Function onDelete;

  const DynamicFormScreen({super.key, required this.form, this.formStore, required this.readOnly, required this.showAsSinglePage, required this.onDelete});

  @override
  DynamicFormScreenState createState() => DynamicFormScreenState();
}

class DynamicFormScreenState extends State<DynamicFormScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _maxPageReached = 0;
  Map<String, dynamic> _formData = {};
  bool _readOnly = false;


  @override
  void initState() {
    super.initState();
    _readOnly = widget.readOnly;
    if (widget.formStore!=null){
    _formData = jsonDecode(widget.formStore!.toJson()['data']);
    }


  } // Calculate progress based on maximum page viewed
  double get _progress => widget.form.sections.isNotEmpty
      ? (_maxPageReached + 1) / widget.form.sections.length
      : 0;



  // Helper to build validators from 'rules'
  List<FormFieldValidator> _buildValidators(List<Rule>? rules) {
    if (rules == null) return [];
    return rules.map((rule) {
      if (rule.required == true) {
        return FormBuilderValidators.required(errorText: rule.message);
      }
      if (rule.min != null) {
        return FormBuilderValidators.minLength(rule.min!, errorText: rule.message);
      }
      if (rule.max != null) {
        return FormBuilderValidators.maxLength(rule.max!, errorText: rule.message);
      }
      return (_) => null;
    }).toList();
  }

  String convertToCommaSeparatedString(dynamic dynamicFieldData) {
    // Cast the dynamic field data to List<String> and join with commas
    if (dynamicFieldData is List<dynamic>) {
      return (dynamicFieldData.cast<String>()).join(', ');
    }
    return '';
  }


  // Method to render each field dynamically
// Method to render each field dynamically
  Widget _buildField(Question field, dynamic formValue, bool readOnly) {
    final validators = _buildValidators(field.rules);

    final fieldState = FormBuilder.of(context)?.fields[field.title];
    final titleColor = fieldState?.hasError == true ? Colors.red : Colors.black;

    switch (field.type) {
      case 'text':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: titleColor),),
            if (readOnly) Text(formValue),
            if (!readOnly) FormBuilderTextField(
              name: field.id,
              initialValue: formValue==null ? null :formValue as String,
              decoration: InputDecoration(
                labelText: field.title,
                  floatingLabelBehavior:FloatingLabelBehavior.never,
                // labelStyle: TextStyle(color: Colors.grey[700]),  // Static label style
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: field.placeholder,
              ),
              validator: FormBuilderValidators.compose(validators),
            ),
          ],
        );
      case 'textArea':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: titleColor),),
            if (readOnly) Text(formValue??''),
            if (!readOnly) FormBuilderTextField(
              name: field.id,
              initialValue: formValue==null ? null : formValue as String,
              decoration: InputDecoration(
                // labelText: field.title,
                labelStyle: TextStyle(color: Colors.grey[700]),
                // Static label style
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: field.placeholder,
              ),
              maxLines: 5,
              validator: FormBuilderValidators.compose(validators),
            ),
          ],
        );
      case 'radio':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: titleColor)),
            const SizedBox(height: 4,),
            if (readOnly) Text(formValue??''),
            if (!readOnly) FormBuilderRadioGroup<String>(
              name: field.id,
              initialValue: formValue==null ? null : formValue as String,
              decoration: const InputDecoration(border: InputBorder.none),
              validator: FormBuilderValidators.compose(validators),
              options: field.items?.map((item) => FormBuilderFieldOption(value: item.value, child: Text(item.label, style: Theme.of(context).textTheme.titleSmall,))).toList() ?? [],
            ),
          ],
        );
      case 'signature':
        return FormBuilderSignaturePad(
          enabled: !readOnly,
          clearButtonText: readOnly ? '' : 'Clear',
          initialValue: formValue!=null ? Uint8List.fromList((formValue as List<dynamic>).cast<int>()) : null,
          decoration: const InputDecoration(
            labelText: 'Signature Pad',
          ),
          name: 'signature',
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          // onChanged: _onChanged,
        );

      case 'checkbox':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: titleColor)),
            const SizedBox(height: 4,),
            if (readOnly) Text(convertToCommaSeparatedString(formValue)),
            if (!readOnly) FormBuilderCheckboxGroup<String>(
              name: field.id,
              initialValue: formValue==null ? null : (formValue as List<dynamic>).cast<String>(),
              decoration: const InputDecoration(border: InputBorder.none,
                ),
              validator: FormBuilderValidators.compose(validators),
              options: field.items?.map((item) => FormBuilderFieldOption(value: item.value, child: Text(item.label, style: Theme.of(context).textTheme.titleSmall))).toList() ?? [],
            ),
          ],
        );
      case 'dropdown':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: titleColor)),
            const SizedBox(height: 4,),
            if (readOnly) Text(formValue??''),
            if (!readOnly) FormBuilderDropdown<String>(
              name: field.id,
              initialValue: formValue==null ? null : formValue as String,
              decoration: const InputDecoration(
                // labelText: field.title,
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                // label: Text('hello'),
                filled: false,
                fillColor: Colors.white,
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(8.0),
                // ),
              ),
              validator: FormBuilderValidators.compose(validators),
              items: field.items?.map((item) => DropdownMenuItem(value: item.value, child: Text(item.label))).toList() ?? [],
            ),
          ],
        );

      case 'choiceChip':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: titleColor)),
            const SizedBox(height: 4,),
            if (readOnly) Text(formValue??''),
            if (!readOnly) FormBuilderChoiceChip<String>(
              name: field.id,
              initialValue: formValue==null ? null : formValue as String,
              decoration: const InputDecoration(border: InputBorder.none, ),
              showCheckmark: false,
              spacing: 8,
              runSpacing: 8,
              validator: FormBuilderValidators.compose(validators),
              options: field.items?.map((item) {
                return FormBuilderChipOption<String>(
                  value: item.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Adjust padding as needed
                    child: Text(item.label),
                  ),
                );
              }).toList() ?? [],
              // selectedChipColor: Colors.blueAccent.withOpacity(0.3), // Adjust selected color if needed
              labelStyle: const TextStyle(color: Colors.black),
            ),
          ],
        );

      case 'filterChip':
        print('formValue $formValue ${formValue.runtimeType}');
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: titleColor)),
            const SizedBox(height: 4,),
            if (readOnly) Text(convertToCommaSeparatedString(formValue)),
            if (!readOnly) FormBuilderFilterChip<String>(
              name: field.id,
              initialValue: formValue==null ? null : (formValue as List<dynamic>).cast<String>(),
              // backgroundColor: Colors.red,
              showCheckmark: true,
              spacing: 8,
              runSpacing: 8,
              decoration: const InputDecoration(border: InputBorder.none,
              ),
              validator: FormBuilderValidators.compose(validators),
              options: field.items?.map((item) {
                return FormBuilderChipOption<String>(
                  value: item.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Adjust padding as needed
                    child: Text(item.label),
                  ),
                );
              }).toList() ?? [],
              // selectedChipColor: Colors.greenAccent.withOpacity(0.3), // Adjust selected color if needed
              labelStyle: const TextStyle(color: Colors.black),
            ),
          ],
        );
      case 'switch':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (readOnly) Text(field.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: titleColor)),
            if (readOnly) Text(formValue?.toString()??''),
            if (!readOnly )FormBuilderSwitch(
              name: field.id,
              initialValue: formValue as bool?,
              decoration: const InputDecoration(border: InputBorder.none),
              title: Text(field.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: titleColor)),
            ),
          ],
        );
      case 'information':
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            field.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  // Helper method to navigate between pages
  void _goToPage(int index) {
    if (index >= 0 && index < widget.form.sections.length) {
      setState(() {
        _currentPage = index;
        if (index > _maxPageReached) {
          _maxPageReached = index; // Update max page reached
        }
      });
      _pageController.jumpToPage(index);
    }
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: const Text("Are you sure you want to delete this form?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                widget.onDelete(); // Perform delete action
                Navigator.of(context).pop(); //close the actual form
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Row(
        children: [
          if (widget.form.icon!=null) Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(SymbolsGet.get(widget.form.icon!,SymbolStyle.rounded,), color: Theme.of(context).colorScheme.primary,),
          ),
          Text(widget.form.title, style: Theme.of(context).textTheme.titleMedium,),
        ],
      ), actions: [
        if (!_readOnly&&widget.formStore!=null) IconButton(onPressed: (){
          _showDeleteConfirmationDialog();
        }, icon: const Icon(Symbols.delete_outline_rounded)),
        if (widget.formStore!=null) IconButton(onPressed: (){
        setState(() {
          _readOnly = !_readOnly;
        });
      }, icon: Icon(_readOnly ? Symbols.edit_rounded : Symbols.edit_off_rounded))],),
      body: FormBuilder(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        // initialValue: widget.formStore!=null ?jsonDecode(widget.formStore!.toJson()['data']) : {},
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _readOnly||widget.showAsSinglePage ? 1 : widget.form.sections.length,
                itemBuilder: (context, index) {
                  List<Section> sectionList = [];
                  if (_readOnly||widget.showAsSinglePage){
                    sectionList = widget.form.sections;
                  }
                  else{
                    sectionList = [widget.form.sections[index]];
                  }
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        for (var section in sectionList)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                section.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            ...section.questions.map((field) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: _buildField(field, _formData[field.id], _readOnly)))
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            if (!_readOnly)Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // if (_currentPage > 0)
                    Opacity(
                      opacity: _currentPage > 0 ? 1 : 0,
                      child: ElevatedButton(
                        onPressed: _currentPage > 0 ? () => _goToPage(_currentPage - 1) : null,
                        child: const Text('Back'),
                      ),
                    ),
                  const Expanded(child: SizedBox(),),
                  if (!_readOnly && !widget.showAsSinglePage && widget.form.sections.length>1) Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(8),
                      value: _progress,
                      minHeight: 8.0,
                      color: Colors.blue,
                      backgroundColor: Colors.grey[300],
                    ),
                  ),),
                  const Expanded(child: SizedBox(),),
                  if (!widget.showAsSinglePage && _currentPage < widget.form.sections.length - 1)
                    ElevatedButton(
                      onPressed: () {
                        _goToPage(_currentPage + 1);
                      },
                      child: const Text('Next'),
                    ),
                  if (!_readOnly && _currentPage == widget.form.sections.length - 1 || widget.showAsSinglePage)
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          Navigator.of(context).pop(_formKey.currentState?.value);
                        } else {
                          print("Validation failed");
                        }
                      },
                      child: const Text('Save'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
