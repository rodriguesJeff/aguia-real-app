import 'package:aguia_real_dbv/src/modules/ranking/unity_ranking_repository.dart';
import 'package:aguia_real_dbv/src/shared/data/unity_repository.dart';
import 'package:aguia_real_dbv/src/shared/models/event.dart';
import 'package:aguia_real_dbv/src/views/unity_view.dart';
import 'package:mobx/mobx.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
part 'unity_ranking_controller.g.dart';

class UnityRankingController = _UnityRankingControllerBase
    with _$UnityRankingController;

abstract class _UnityRankingControllerBase with Store {
  _UnityRankingControllerBase({this.view, this.event});

  final Event? event;
  final UnityView? view;

  @action
  void initScreen() {
    getUnityesRanking();
  }

  @observable
  UnityRepository unityRepository = UnityRepository();

  @observable
  UnityRankingRepository unityRankingRepository = UnityRankingRepository();

  @observable
  bool isLoading = false;
  bool isregistering = false;

  @observable
  List<ParseObject> unityes = [];

  @observable
  ParseObject? unity;

  @observable
  String? reason;

  @action
  void setReason(String value) => reason = value;
  bool get isReasonValid => reason != null && reason!.length > 5;

  @observable
  num? score;

  @action
  void setScore(String value) => score = int.parse(value);
  bool get isScoreValid => score != null && score! > 0;

  @action
  Future<void> getUnityesRanking() async {
    isLoading = true;
    unityes = await unityRepository.getUnityes();
    isLoading = false;
  }

  @action
  Future<void> setUnity(ParseObject value) async {
    unity = value;
  }

  @computed
  get submitScore => isReasonValid && isScoreValid ? setUnityScore() : null;

  @action
  Future<void> setUnityScore() async {
    isregistering = true;
    final response = await unityRankingRepository.setUnityScore(
      eventId: event!.eventID,
      unityId: unity!['objectId'],
      score: score!,
      reason: reason!,
    );

    if (response) {
      view!.backToEventDetailsPage();
      isregistering = false;
    } else {
      isregistering = false;
    }
  }
}
