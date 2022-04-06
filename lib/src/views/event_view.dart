import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

abstract class EventView {
  void backToTheEvents();
  void goToEditEvent(ParseObject event);
}
