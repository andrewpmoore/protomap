// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'question_set_model.dart';

class QuestionSetMapper extends ClassMapperBase<QuestionSet> {
  QuestionSetMapper._();

  static QuestionSetMapper? _instance;
  static QuestionSetMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuestionSetMapper._());
      SectionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'QuestionSet';

  static String _$title(QuestionSet v) => v.title;
  static const Field<QuestionSet, String> _f$title = Field('title', _$title);
  static List<Section> _$sections(QuestionSet v) => v.sections;
  static const Field<QuestionSet, List<Section>> _f$sections =
      Field('sections', _$sections);
  static String _$type(QuestionSet v) => v.type;
  static const Field<QuestionSet, String> _f$type = Field('type', _$type);
  static bool? _$requiresSignature(QuestionSet v) => v.requiresSignature;
  static const Field<QuestionSet, bool> _f$requiresSignature =
      Field('requiresSignature', _$requiresSignature, opt: true);
  static String? _$color(QuestionSet v) => v.color;
  static const Field<QuestionSet, String> _f$color =
      Field('color', _$color, opt: true);
  static String? _$icon(QuestionSet v) => v.icon;
  static const Field<QuestionSet, String> _f$icon =
      Field('icon', _$icon, opt: true);

  @override
  final MappableFields<QuestionSet> fields = const {
    #title: _f$title,
    #sections: _f$sections,
    #type: _f$type,
    #requiresSignature: _f$requiresSignature,
    #color: _f$color,
    #icon: _f$icon,
  };

  static QuestionSet _instantiate(DecodingData data) {
    return QuestionSet(
        title: data.dec(_f$title),
        sections: data.dec(_f$sections),
        type: data.dec(_f$type),
        requiresSignature: data.dec(_f$requiresSignature),
        color: data.dec(_f$color),
        icon: data.dec(_f$icon));
  }

  @override
  final Function instantiate = _instantiate;

  static QuestionSet fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QuestionSet>(map);
  }

  static QuestionSet fromJson(String json) {
    return ensureInitialized().decodeJson<QuestionSet>(json);
  }
}

mixin QuestionSetMappable {
  String toJson() {
    return QuestionSetMapper.ensureInitialized()
        .encodeJson<QuestionSet>(this as QuestionSet);
  }

  Map<String, dynamic> toMap() {
    return QuestionSetMapper.ensureInitialized()
        .encodeMap<QuestionSet>(this as QuestionSet);
  }

  QuestionSetCopyWith<QuestionSet, QuestionSet, QuestionSet> get copyWith =>
      _QuestionSetCopyWithImpl(this as QuestionSet, $identity, $identity);
  @override
  String toString() {
    return QuestionSetMapper.ensureInitialized()
        .stringifyValue(this as QuestionSet);
  }

  @override
  bool operator ==(Object other) {
    return QuestionSetMapper.ensureInitialized()
        .equalsValue(this as QuestionSet, other);
  }

  @override
  int get hashCode {
    return QuestionSetMapper.ensureInitialized().hashValue(this as QuestionSet);
  }
}

extension QuestionSetValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuestionSet, $Out> {
  QuestionSetCopyWith<$R, QuestionSet, $Out> get $asQuestionSet =>
      $base.as((v, t, t2) => _QuestionSetCopyWithImpl(v, t, t2));
}

abstract class QuestionSetCopyWith<$R, $In extends QuestionSet, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Section, SectionCopyWith<$R, Section, Section>> get sections;
  $R call(
      {String? title,
      List<Section>? sections,
      String? type,
      bool? requiresSignature,
      String? color,
      String? icon});
  QuestionSetCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _QuestionSetCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuestionSet, $Out>
    implements QuestionSetCopyWith<$R, QuestionSet, $Out> {
  _QuestionSetCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuestionSet> $mapper =
      QuestionSetMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Section, SectionCopyWith<$R, Section, Section>>
      get sections => ListCopyWith($value.sections,
          (v, t) => v.copyWith.$chain(t), (v) => call(sections: v));
  @override
  $R call(
          {String? title,
          List<Section>? sections,
          String? type,
          Object? requiresSignature = $none,
          Object? color = $none,
          Object? icon = $none}) =>
      $apply(FieldCopyWithData({
        if (title != null) #title: title,
        if (sections != null) #sections: sections,
        if (type != null) #type: type,
        if (requiresSignature != $none) #requiresSignature: requiresSignature,
        if (color != $none) #color: color,
        if (icon != $none) #icon: icon
      }));
  @override
  QuestionSet $make(CopyWithData data) => QuestionSet(
      title: data.get(#title, or: $value.title),
      sections: data.get(#sections, or: $value.sections),
      type: data.get(#type, or: $value.type),
      requiresSignature:
          data.get(#requiresSignature, or: $value.requiresSignature),
      color: data.get(#color, or: $value.color),
      icon: data.get(#icon, or: $value.icon));

  @override
  QuestionSetCopyWith<$R2, QuestionSet, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _QuestionSetCopyWithImpl($value, $cast, t);
}

class SectionMapper extends ClassMapperBase<Section> {
  SectionMapper._();

  static SectionMapper? _instance;
  static SectionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SectionMapper._());
      QuestionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Section';

  static String _$title(Section v) => v.title;
  static const Field<Section, String> _f$title = Field('title', _$title);
  static List<Question> _$questions(Section v) => v.questions;
  static const Field<Section, List<Question>> _f$questions =
      Field('questions', _$questions);

  @override
  final MappableFields<Section> fields = const {
    #title: _f$title,
    #questions: _f$questions,
  };

  static Section _instantiate(DecodingData data) {
    return Section(
        title: data.dec(_f$title), questions: data.dec(_f$questions));
  }

  @override
  final Function instantiate = _instantiate;

  static Section fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Section>(map);
  }

  static Section fromJson(String json) {
    return ensureInitialized().decodeJson<Section>(json);
  }
}

mixin SectionMappable {
  String toJson() {
    return SectionMapper.ensureInitialized()
        .encodeJson<Section>(this as Section);
  }

  Map<String, dynamic> toMap() {
    return SectionMapper.ensureInitialized()
        .encodeMap<Section>(this as Section);
  }

  SectionCopyWith<Section, Section, Section> get copyWith =>
      _SectionCopyWithImpl(this as Section, $identity, $identity);
  @override
  String toString() {
    return SectionMapper.ensureInitialized().stringifyValue(this as Section);
  }

  @override
  bool operator ==(Object other) {
    return SectionMapper.ensureInitialized()
        .equalsValue(this as Section, other);
  }

  @override
  int get hashCode {
    return SectionMapper.ensureInitialized().hashValue(this as Section);
  }
}

extension SectionValueCopy<$R, $Out> on ObjectCopyWith<$R, Section, $Out> {
  SectionCopyWith<$R, Section, $Out> get $asSection =>
      $base.as((v, t, t2) => _SectionCopyWithImpl(v, t, t2));
}

abstract class SectionCopyWith<$R, $In extends Section, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Question, QuestionCopyWith<$R, Question, Question>>
      get questions;
  $R call({String? title, List<Question>? questions});
  SectionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SectionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Section, $Out>
    implements SectionCopyWith<$R, Section, $Out> {
  _SectionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Section> $mapper =
      SectionMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Question, QuestionCopyWith<$R, Question, Question>>
      get questions => ListCopyWith($value.questions,
          (v, t) => v.copyWith.$chain(t), (v) => call(questions: v));
  @override
  $R call({String? title, List<Question>? questions}) =>
      $apply(FieldCopyWithData({
        if (title != null) #title: title,
        if (questions != null) #questions: questions
      }));
  @override
  Section $make(CopyWithData data) => Section(
      title: data.get(#title, or: $value.title),
      questions: data.get(#questions, or: $value.questions));

  @override
  SectionCopyWith<$R2, Section, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SectionCopyWithImpl($value, $cast, t);
}

class QuestionMapper extends ClassMapperBase<Question> {
  QuestionMapper._();

  static QuestionMapper? _instance;
  static QuestionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuestionMapper._());
      RuleMapper.ensureInitialized();
      ItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Question';

  static String _$id(Question v) => v.id;
  static const Field<Question, String> _f$id = Field('id', _$id);
  static String _$title(Question v) => v.title;
  static const Field<Question, String> _f$title = Field('title', _$title);
  static String? _$answer(Question v) => v.answer;
  static const Field<Question, String> _f$answer =
      Field('answer', _$answer, opt: true);
  static String _$type(Question v) => v.type;
  static const Field<Question, String> _f$type = Field('type', _$type);
  static List<Rule>? _$rules(Question v) => v.rules;
  static const Field<Question, List<Rule>> _f$rules =
      Field('rules', _$rules, opt: true);
  static String? _$placeholder(Question v) => v.placeholder;
  static const Field<Question, String> _f$placeholder =
      Field('placeholder', _$placeholder, opt: true);
  static List<Item>? _$items(Question v) => v.items;
  static const Field<Question, List<Item>> _f$items =
      Field('items', _$items, opt: true);

  @override
  final MappableFields<Question> fields = const {
    #id: _f$id,
    #title: _f$title,
    #answer: _f$answer,
    #type: _f$type,
    #rules: _f$rules,
    #placeholder: _f$placeholder,
    #items: _f$items,
  };

  static Question _instantiate(DecodingData data) {
    return Question(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        answer: data.dec(_f$answer),
        type: data.dec(_f$type),
        rules: data.dec(_f$rules),
        placeholder: data.dec(_f$placeholder),
        items: data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;

  static Question fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Question>(map);
  }

  static Question fromJson(String json) {
    return ensureInitialized().decodeJson<Question>(json);
  }
}

mixin QuestionMappable {
  String toJson() {
    return QuestionMapper.ensureInitialized()
        .encodeJson<Question>(this as Question);
  }

  Map<String, dynamic> toMap() {
    return QuestionMapper.ensureInitialized()
        .encodeMap<Question>(this as Question);
  }

  QuestionCopyWith<Question, Question, Question> get copyWith =>
      _QuestionCopyWithImpl(this as Question, $identity, $identity);
  @override
  String toString() {
    return QuestionMapper.ensureInitialized().stringifyValue(this as Question);
  }

  @override
  bool operator ==(Object other) {
    return QuestionMapper.ensureInitialized()
        .equalsValue(this as Question, other);
  }

  @override
  int get hashCode {
    return QuestionMapper.ensureInitialized().hashValue(this as Question);
  }
}

extension QuestionValueCopy<$R, $Out> on ObjectCopyWith<$R, Question, $Out> {
  QuestionCopyWith<$R, Question, $Out> get $asQuestion =>
      $base.as((v, t, t2) => _QuestionCopyWithImpl(v, t, t2));
}

abstract class QuestionCopyWith<$R, $In extends Question, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Rule, RuleCopyWith<$R, Rule, Rule>>? get rules;
  ListCopyWith<$R, Item, ItemCopyWith<$R, Item, Item>>? get items;
  $R call(
      {String? id,
      String? title,
      String? answer,
      String? type,
      List<Rule>? rules,
      String? placeholder,
      List<Item>? items});
  QuestionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _QuestionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Question, $Out>
    implements QuestionCopyWith<$R, Question, $Out> {
  _QuestionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Question> $mapper =
      QuestionMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Rule, RuleCopyWith<$R, Rule, Rule>>? get rules =>
      $value.rules != null
          ? ListCopyWith($value.rules!, (v, t) => v.copyWith.$chain(t),
              (v) => call(rules: v))
          : null;
  @override
  ListCopyWith<$R, Item, ItemCopyWith<$R, Item, Item>>? get items =>
      $value.items != null
          ? ListCopyWith($value.items!, (v, t) => v.copyWith.$chain(t),
              (v) => call(items: v))
          : null;
  @override
  $R call(
          {String? id,
          String? title,
          Object? answer = $none,
          String? type,
          Object? rules = $none,
          Object? placeholder = $none,
          Object? items = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != null) #title: title,
        if (answer != $none) #answer: answer,
        if (type != null) #type: type,
        if (rules != $none) #rules: rules,
        if (placeholder != $none) #placeholder: placeholder,
        if (items != $none) #items: items
      }));
  @override
  Question $make(CopyWithData data) => Question(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      answer: data.get(#answer, or: $value.answer),
      type: data.get(#type, or: $value.type),
      rules: data.get(#rules, or: $value.rules),
      placeholder: data.get(#placeholder, or: $value.placeholder),
      items: data.get(#items, or: $value.items));

  @override
  QuestionCopyWith<$R2, Question, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _QuestionCopyWithImpl($value, $cast, t);
}

class RuleMapper extends ClassMapperBase<Rule> {
  RuleMapper._();

  static RuleMapper? _instance;
  static RuleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RuleMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Rule';

  static bool? _$required(Rule v) => v.required;
  static const Field<Rule, bool> _f$required =
      Field('required', _$required, opt: true);
  static int? _$min(Rule v) => v.min;
  static const Field<Rule, int> _f$min = Field('min', _$min, opt: true);
  static int? _$max(Rule v) => v.max;
  static const Field<Rule, int> _f$max = Field('max', _$max, opt: true);
  static String _$message(Rule v) => v.message;
  static const Field<Rule, String> _f$message = Field('message', _$message);

  @override
  final MappableFields<Rule> fields = const {
    #required: _f$required,
    #min: _f$min,
    #max: _f$max,
    #message: _f$message,
  };

  static Rule _instantiate(DecodingData data) {
    return Rule(
        required: data.dec(_f$required),
        min: data.dec(_f$min),
        max: data.dec(_f$max),
        message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static Rule fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Rule>(map);
  }

  static Rule fromJson(String json) {
    return ensureInitialized().decodeJson<Rule>(json);
  }
}

mixin RuleMappable {
  String toJson() {
    return RuleMapper.ensureInitialized().encodeJson<Rule>(this as Rule);
  }

  Map<String, dynamic> toMap() {
    return RuleMapper.ensureInitialized().encodeMap<Rule>(this as Rule);
  }

  RuleCopyWith<Rule, Rule, Rule> get copyWith =>
      _RuleCopyWithImpl(this as Rule, $identity, $identity);
  @override
  String toString() {
    return RuleMapper.ensureInitialized().stringifyValue(this as Rule);
  }

  @override
  bool operator ==(Object other) {
    return RuleMapper.ensureInitialized().equalsValue(this as Rule, other);
  }

  @override
  int get hashCode {
    return RuleMapper.ensureInitialized().hashValue(this as Rule);
  }
}

extension RuleValueCopy<$R, $Out> on ObjectCopyWith<$R, Rule, $Out> {
  RuleCopyWith<$R, Rule, $Out> get $asRule =>
      $base.as((v, t, t2) => _RuleCopyWithImpl(v, t, t2));
}

abstract class RuleCopyWith<$R, $In extends Rule, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? required, int? min, int? max, String? message});
  RuleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RuleCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Rule, $Out>
    implements RuleCopyWith<$R, Rule, $Out> {
  _RuleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Rule> $mapper = RuleMapper.ensureInitialized();
  @override
  $R call(
          {Object? required = $none,
          Object? min = $none,
          Object? max = $none,
          String? message}) =>
      $apply(FieldCopyWithData({
        if (required != $none) #required: required,
        if (min != $none) #min: min,
        if (max != $none) #max: max,
        if (message != null) #message: message
      }));
  @override
  Rule $make(CopyWithData data) => Rule(
      required: data.get(#required, or: $value.required),
      min: data.get(#min, or: $value.min),
      max: data.get(#max, or: $value.max),
      message: data.get(#message, or: $value.message));

  @override
  RuleCopyWith<$R2, Rule, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RuleCopyWithImpl($value, $cast, t);
}

class ItemMapper extends ClassMapperBase<Item> {
  ItemMapper._();

  static ItemMapper? _instance;
  static ItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Item';

  static String _$label(Item v) => v.label;
  static const Field<Item, String> _f$label = Field('label', _$label);
  static String _$value(Item v) => v.value;
  static const Field<Item, String> _f$value = Field('value', _$value);

  @override
  final MappableFields<Item> fields = const {
    #label: _f$label,
    #value: _f$value,
  };

  static Item _instantiate(DecodingData data) {
    return Item(label: data.dec(_f$label), value: data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static Item fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Item>(map);
  }

  static Item fromJson(String json) {
    return ensureInitialized().decodeJson<Item>(json);
  }
}

mixin ItemMappable {
  String toJson() {
    return ItemMapper.ensureInitialized().encodeJson<Item>(this as Item);
  }

  Map<String, dynamic> toMap() {
    return ItemMapper.ensureInitialized().encodeMap<Item>(this as Item);
  }

  ItemCopyWith<Item, Item, Item> get copyWith =>
      _ItemCopyWithImpl(this as Item, $identity, $identity);
  @override
  String toString() {
    return ItemMapper.ensureInitialized().stringifyValue(this as Item);
  }

  @override
  bool operator ==(Object other) {
    return ItemMapper.ensureInitialized().equalsValue(this as Item, other);
  }

  @override
  int get hashCode {
    return ItemMapper.ensureInitialized().hashValue(this as Item);
  }
}

extension ItemValueCopy<$R, $Out> on ObjectCopyWith<$R, Item, $Out> {
  ItemCopyWith<$R, Item, $Out> get $asItem =>
      $base.as((v, t, t2) => _ItemCopyWithImpl(v, t, t2));
}

abstract class ItemCopyWith<$R, $In extends Item, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? label, String? value});
  ItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ItemCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Item, $Out>
    implements ItemCopyWith<$R, Item, $Out> {
  _ItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Item> $mapper = ItemMapper.ensureInitialized();
  @override
  $R call({String? label, String? value}) => $apply(FieldCopyWithData(
      {if (label != null) #label: label, if (value != null) #value: value}));
  @override
  Item $make(CopyWithData data) => Item(
      label: data.get(#label, or: $value.label),
      value: data.get(#value, or: $value.value));

  @override
  ItemCopyWith<$R2, Item, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ItemCopyWithImpl($value, $cast, t);
}
