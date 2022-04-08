import 'package:aguia_real_dbv/src/shared/data/unity_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
part 'unity_ranking_controller.g.dart';

class UnityRankingController = _UnityRankingControllerBase
    with _$UnityRankingController;

abstract class _UnityRankingControllerBase with Store {
  @action
  void initScreen() {
    getUnityesRanking();
  }

  @observable
  UnityRepository unityRepository = UnityRepository();

  @observable
  bool isLoading = false;

  @observable
  List<ParseObject> unityes = [];

  @action
  Future<void> getUnityesRanking() async {
    isLoading = true;
    unityes = await unityRepository.getUnityes();
    isLoading = false;
  }
}
