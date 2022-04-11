import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UnityRankingRepository {
  Future<bool> setUnityScore({
    required String eventId,
    required String unityId,
    required String unityName,
    required num score,
    required String reason,
  }) async {
    try {
      var registerRanking = ParseObject('Ranking')
        ..set('unity', ParseObject('Unitys')..objectId = unityId)
        ..set('unityName', unityName)
        ..set('score', score)
        ..set('reason', reason);

      var event = ParseObject('Event')
        ..objectId = eventId
        ..set('ranking', registerRanking);

      final ParseResponse response = await event.save();

      if (response.success) {
        return true;
      }
    } catch (e) {
      debugPrint('$e');
    }

    return false;
  }

  Future<List<ParseObject>> getUnityesRanking({
    required String eventId,
  }) async {
    var event = ParseObject('Event')..objectId = eventId;
    var rankingID = event['ranking'];

    QueryBuilder<ParseObject> rankingQuery =
        QueryBuilder<ParseObject>(ParseObject('Ranking')..objectId = rankingID);

    final ParseResponse response = await rankingQuery.query();

    try {
      if (response.success && response.results != null) {
        return response.results as List<ParseObject>;
      }
    } catch (e) {
      debugPrint('$e');
    }

    return [];
  }
}
