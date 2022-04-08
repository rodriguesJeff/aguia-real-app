import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UnityRankingRepository {
  Future<bool> setUnityScore({
    required String eventId,
    required String unityId,
    required num score,
    required String reason,
  }) async {
    try {
      var registerRanking = ParseObject('Ranking')
        ..set('unity', ParseObject('Unitys')..objectId = unityId)
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
}
