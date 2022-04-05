import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class EventRepository {
  Future<List<ParseObject>> createEvent({
    required String eventName,
    required DateTime eventDate,
    required DateTime finalEventDate,
    required num eventMaxScore,
    required bool visible,
  }) async {
    try {
      var newEvent = ParseObject('Event')
        ..set('name', eventName)
        ..set('date', eventDate)
        ..set('finalDate', finalEventDate)
        ..set('maxScore', eventMaxScore)
        ..set('visible', visible);

      final ParseResponse response = await newEvent.save();

      if (response.success) {
        return getEvents();
      }
    } catch (e) {
      debugPrint('$e');
    }
    return [];
  }

  Future<List<ParseObject>> editEvent({
    required String id,
    required String eventName,
    required DateTime eventDate,
    required DateTime finalEventDate,
    required num eventMaxScore,
    required bool visible,
  }) async {
    try {
      var event = ParseObject('Event')
        ..objectId = id
        ..set('name', eventName)
        ..set('date', eventDate)
        ..set('finalDate', finalEventDate)
        ..set('maxScore', eventMaxScore)
        ..set('visible', visible);

      final ParseResponse response = await event.save();

      if (response.success) {
        return getEvents();
      }
    } catch (e) {
      debugPrint('$e');
    }
    return [];
  }

  Future<bool> removeEvent({
    required String eventID,
  }) async {
    try {
      final ParseResponse response =
          await ParseObject('Event').delete(id: eventID);
      if (response.success) return true;
    } catch (e) {
      debugPrint('$e');
    }
    return false;
  }

  Future<List<ParseObject>> getEvents() async {
    try {
      final ParseResponse response = await ParseObject('Event').getAll();

      if (response.success && response.results != null) {
        return response.results as List<ParseObject>;
      }
    } catch (e) {
      debugPrint('$e');
    }
    return [];
  }
}
