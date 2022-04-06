import 'package:aguia_real_dbv/src/modules/event/event_repository.dart';
import 'package:aguia_real_dbv/src/views/event_view.dart';
import 'package:mobx/mobx.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
part 'event_controller.g.dart';

class EventController = _EventControllerBase with _$EventController;

abstract class _EventControllerBase with Store {
  _EventControllerBase(this.view);
  final EventView view;
  @action
  void initPage() {
    getEvents();
  }

  @observable
  bool isLoading = false;

  @observable
  EventRepository repository = EventRepository();

  @observable
  String eventName = '';

  @observable
  DateTime eventDate = DateTime.now();

  @observable
  late DateTime finalEventDate = eventDate;

  @observable
  String eventMaxScore = '';

  @observable
  bool visible = true;

  @action
  void setEventName(String value) => eventName = value;

  @computed
  bool get isEventNameValid => eventName.isNotEmpty;

  @action
  void setEventDate(DateTime value) => eventDate = value;

  @action
  void setFinalEventDate(DateTime value) => finalEventDate = value;

  @computed
  bool get isEventDateValid => eventDate.isAfter(DateTime.now());

  @computed
  bool get isFinalEventDateValid => finalEventDate.isAfter(eventDate);

  @action
  void setEventMaxScore(String value) => eventMaxScore = value;

  @computed
  bool get isEventMaxScoreValid => int.parse(eventMaxScore) > 0;

  @observable
  List<ParseObject> events = [];

  @action
  void setEvents(List<ParseObject> value) => events = value;

  @action
  Future<bool> createEvent() async {
    isLoading = true;
    final response = await repository.createEvent(
      eventName: eventName,
      eventDate: eventDate,
      finalEventDate: finalEventDate,
      eventMaxScore: int.parse(eventMaxScore),
      visible: visible,
    );

    if (response.isNotEmpty) {
      isLoading = false;
      view.backToTheEvents();
    }
    return false;
  }

  @action
  Future<void> getEvents() async {
    isLoading = true;
    events = await repository.getEvents();
    isLoading = false;
  }

  @observable
  ParseObject? event;

  @action
  Future<void> getSpecificEvent(String eventID) async {
    isLoading = true;
    event = await repository.getSpecificEvent(eventID);
    if (event != null) {
      view.goToEditEvent(event!);
    }
    isLoading = false;
  }

  @action
  Future<void> editEvent({required String id}) async {
    isLoading = true;
    final response = await repository.editEvent(
      id: id,
      eventName: eventName,
      eventDate: eventDate,
      finalEventDate: finalEventDate,
      eventMaxScore: int.parse(eventMaxScore),
      visible: visible,
    );

    if (response) {
      await getEvents();
      view.backToTheEvents();
    }
  }

  @action
  removeEvent(String id) async {
    isLoading = true;
    final response = await repository.removeEvent(eventID: id);
    if (response) {
      await getEvents();
    }
    isLoading = false;
  }
}
