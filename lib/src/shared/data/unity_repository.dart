import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UnityRepository {
  Future<List<ParseObject>> getUnityes() async {
    QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject('Unitys'));

    final ParseResponse apiResponse = await parseQuery.query();
    try {
      if (apiResponse.success && apiResponse.results != null) {
        return apiResponse.results as List<ParseObject>;
      }
    } catch (e) {
      debugPrint('$e');
    }
    return [];
  }
}
