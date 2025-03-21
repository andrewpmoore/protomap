import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/services.dart';

part 'question_set_model.mapper.dart';

// Root form class
@MappableClass()
class QuestionSet with QuestionSetMappable {
  final String title;
  final String type;
  final List<Section> sections;
  final bool? requiresSignature;
  final String? color;
  final String? icon;

  QuestionSet({required this.title, required this.sections, required this.type, this.requiresSignature, this.color, this.icon});
}

// Section class
@MappableClass()
class Section with SectionMappable {
  final String title;
  final List<Question> questions;

  Section({required this.title, required this.questions});
}

// Field class
@MappableClass()
class Question with QuestionMappable {
  final String id;
  final String title;
  final String? answer;
  final String type;
  final List<Rule>? rules;
  final String? placeholder;
  final List<Item>? items;

  Question({
    required this.id,
    required this.title,
    this.answer,
    required this.type,
    this.rules,
    this.placeholder,
    this.items,
  });
}

// Rule class
@MappableClass()
class Rule with RuleMappable {
  final bool? required;
  final int? min;
  final int? max;
  final String message;

  Rule({this.required, this.min, this.max, required this.message});
}

// Item class for radio button and segmented controller options
@MappableClass()
class Item with ItemMappable {
  final String label;
  final String value;

  Item({required this.label, required this.value});
}


Future<QuestionSet> loadFormData(String templateName) async {
  // Load JSON from assets
  final String jsonString = await rootBundle.loadString(templateName);
  // Parse JSON and map to Form object
  final Map<String, dynamic> jsonData = jsonDecode(jsonString);
  return QuestionSetMapper.fromMap(jsonData);
}