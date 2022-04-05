// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventController on _EventControllerBase, Store {
  Computed<bool>? _$isEventNameValidComputed;

  @override
  bool get isEventNameValid => (_$isEventNameValidComputed ??= Computed<bool>(
          () => super.isEventNameValid,
          name: '_EventControllerBase.isEventNameValid'))
      .value;
  Computed<bool>? _$isEventDateValidComputed;

  @override
  bool get isEventDateValid => (_$isEventDateValidComputed ??= Computed<bool>(
          () => super.isEventDateValid,
          name: '_EventControllerBase.isEventDateValid'))
      .value;
  Computed<bool>? _$isFinalEventDateValidComputed;

  @override
  bool get isFinalEventDateValid => (_$isFinalEventDateValidComputed ??=
          Computed<bool>(() => super.isFinalEventDateValid,
              name: '_EventControllerBase.isFinalEventDateValid'))
      .value;
  Computed<bool>? _$isEventMaxScoreValidComputed;

  @override
  bool get isEventMaxScoreValid => (_$isEventMaxScoreValidComputed ??=
          Computed<bool>(() => super.isEventMaxScoreValid,
              name: '_EventControllerBase.isEventMaxScoreValid'))
      .value;
  Computed<dynamic>? _$submitFormComputed;

  @override
  dynamic get submitForm =>
      (_$submitFormComputed ??= Computed<dynamic>(() => super.submitForm,
              name: '_EventControllerBase.submitForm'))
          .value;

  final _$isLoadingAtom = Atom(name: '_EventControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$repositoryAtom = Atom(name: '_EventControllerBase.repository');

  @override
  EventRepository get repository {
    _$repositoryAtom.reportRead();
    return super.repository;
  }

  @override
  set repository(EventRepository value) {
    _$repositoryAtom.reportWrite(value, super.repository, () {
      super.repository = value;
    });
  }

  final _$eventNameAtom = Atom(name: '_EventControllerBase.eventName');

  @override
  String get eventName {
    _$eventNameAtom.reportRead();
    return super.eventName;
  }

  @override
  set eventName(String value) {
    _$eventNameAtom.reportWrite(value, super.eventName, () {
      super.eventName = value;
    });
  }

  final _$eventDateAtom = Atom(name: '_EventControllerBase.eventDate');

  @override
  DateTime get eventDate {
    _$eventDateAtom.reportRead();
    return super.eventDate;
  }

  @override
  set eventDate(DateTime value) {
    _$eventDateAtom.reportWrite(value, super.eventDate, () {
      super.eventDate = value;
    });
  }

  final _$finalEventDateAtom =
      Atom(name: '_EventControllerBase.finalEventDate');

  @override
  DateTime get finalEventDate {
    _$finalEventDateAtom.reportRead();
    return super.finalEventDate;
  }

  @override
  set finalEventDate(DateTime value) {
    _$finalEventDateAtom.reportWrite(value, super.finalEventDate, () {
      super.finalEventDate = value;
    });
  }

  final _$eventMaxScoreAtom = Atom(name: '_EventControllerBase.eventMaxScore');

  @override
  String get eventMaxScore {
    _$eventMaxScoreAtom.reportRead();
    return super.eventMaxScore;
  }

  @override
  set eventMaxScore(String value) {
    _$eventMaxScoreAtom.reportWrite(value, super.eventMaxScore, () {
      super.eventMaxScore = value;
    });
  }

  final _$parseFileAtom = Atom(name: '_EventControllerBase.parseFile');

  @override
  ParseFileBase? get parseFile {
    _$parseFileAtom.reportRead();
    return super.parseFile;
  }

  @override
  set parseFile(ParseFileBase? value) {
    _$parseFileAtom.reportWrite(value, super.parseFile, () {
      super.parseFile = value;
    });
  }

  final _$pickedFileAtom = Atom(name: '_EventControllerBase.pickedFile');

  @override
  File? get pickedFile {
    _$pickedFileAtom.reportRead();
    return super.pickedFile;
  }

  @override
  set pickedFile(File? value) {
    _$pickedFileAtom.reportWrite(value, super.pickedFile, () {
      super.pickedFile = value;
    });
  }

  final _$visibleAtom = Atom(name: '_EventControllerBase.visible');

  @override
  bool get visible {
    _$visibleAtom.reportRead();
    return super.visible;
  }

  @override
  set visible(bool value) {
    _$visibleAtom.reportWrite(value, super.visible, () {
      super.visible = value;
    });
  }

  final _$eventsAtom = Atom(name: '_EventControllerBase.events');

  @override
  List<ParseObject> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(List<ParseObject> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  final _$getImageAsyncAction = AsyncAction('_EventControllerBase.getImage');

  @override
  Future<ParseFileBase?> getImage() {
    return _$getImageAsyncAction.run(() => super.getImage());
  }

  final _$createEventAsyncAction =
      AsyncAction('_EventControllerBase.createEvent');

  @override
  Future<bool> createEvent() {
    return _$createEventAsyncAction.run(() => super.createEvent());
  }

  final _$getEventsAsyncAction = AsyncAction('_EventControllerBase.getEvents');

  @override
  Future<void> getEvents() {
    return _$getEventsAsyncAction.run(() => super.getEvents());
  }

  final _$_EventControllerBaseActionController =
      ActionController(name: '_EventControllerBase');

  @override
  void initPage() {
    final _$actionInfo = _$_EventControllerBaseActionController.startAction(
        name: '_EventControllerBase.initPage');
    try {
      return super.initPage();
    } finally {
      _$_EventControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventName(String value) {
    final _$actionInfo = _$_EventControllerBaseActionController.startAction(
        name: '_EventControllerBase.setEventName');
    try {
      return super.setEventName(value);
    } finally {
      _$_EventControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventDate(DateTime value) {
    final _$actionInfo = _$_EventControllerBaseActionController.startAction(
        name: '_EventControllerBase.setEventDate');
    try {
      return super.setEventDate(value);
    } finally {
      _$_EventControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFinalEventDate(DateTime value) {
    final _$actionInfo = _$_EventControllerBaseActionController.startAction(
        name: '_EventControllerBase.setFinalEventDate');
    try {
      return super.setFinalEventDate(value);
    } finally {
      _$_EventControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventMaxScore(String value) {
    final _$actionInfo = _$_EventControllerBaseActionController.startAction(
        name: '_EventControllerBase.setEventMaxScore');
    try {
      return super.setEventMaxScore(value);
    } finally {
      _$_EventControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
repository: ${repository},
eventName: ${eventName},
eventDate: ${eventDate},
finalEventDate: ${finalEventDate},
eventMaxScore: ${eventMaxScore},
parseFile: ${parseFile},
pickedFile: ${pickedFile},
visible: ${visible},
events: ${events},
isEventNameValid: ${isEventNameValid},
isEventDateValid: ${isEventDateValid},
isFinalEventDateValid: ${isFinalEventDateValid},
isEventMaxScoreValid: ${isEventMaxScoreValid},
submitForm: ${submitForm}
    ''';
  }
}
