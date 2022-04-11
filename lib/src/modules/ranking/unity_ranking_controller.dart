import 'package:aguia_real_dbv/src/modules/ranking/unity_ranking_repository.dart';
import 'package:aguia_real_dbv/src/shared/data/unity_repository.dart';
import 'package:aguia_real_dbv/src/shared/models/event.dart';
import 'package:aguia_real_dbv/src/shared/models/unity_ranked.dart';
import 'package:aguia_real_dbv/src/shared/services/get_stars.dart';
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
    getUnityes();
    getUnityesRanking('DYSWFhg6Ln');
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
  List<ParseObject> unityesNames = [];

  @observable
  ParseObject? unity;

  @observable
  String? reason;

  @action
  void setReason(String value) => reason = value;
  bool get isReasonValid => reason != null && reason!.length > 5;

  @observable
  num? score;

  @observable
  UnityRanked gaviao = UnityRanked(name: 'Unidade Gavião');

  @observable
  UnityRanked aguiaMarinha = UnityRanked(name: 'Águia Marinha');

  @observable
  UnityRanked aguia = UnityRanked(name: 'Unidade Águia');

  @observable
  UnityRanked gaivotaReal = UnityRanked(name: 'Gaivota Real');

  @observable
  List<UnityRanked> lista = [
    UnityRanked(name: 'Gaivota Real'),
    UnityRanked(name: 'Unidade Águia'),
    UnityRanked(name: 'Águia Marinha'),
    UnityRanked(name: 'Unidade Gavião'),
  ];

  @action
  void setScore(String value) {
    if (value == '') {
      score = 0;
    } else {
      score = int.parse(value);
    }
  }

  bool get isScoreValid => score != null && score! > 0;

  @action
  Future<void> getUnityesRanking(String eventID) async {
    isLoading = true;
    unityes = await unityRankingRepository.getUnityesRanking(eventId: eventID);

    for (var u in unityes) {
      lista.forEach((element) {
        if (element.name == 'Unidade Gavião' &&
            u['unityName'] == element.name) {
          element.score = element.score + u['score'];
          element.stars = getStars(element.score + u['score']);
        } else if (element.name == 'Gaivota Real' &&
            u['unityName'] == element.name) {
          element.score = element.score + u['score'];
          element.stars = getStars(element.score + u['score']);
        } else if (element.name == 'Unidade Águia' &&
            u['unityName'] == element.name) {
          element.score = element.score + u['score'];
          element.stars = getStars(element.score + u['score']);
        } else if (element.name == 'Águia Marinha' &&
            u['unityName'] == element.name) {
          element.score = element.score + u['score'];
          element.stars = getStars(element.score + u['score']);
        }
      });
    }

    isLoading = false;
  }

  @action
  Future<void> getUnityes() async {
    isLoading = true;
    unityesNames = await unityRepository.getUnityes();
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
      unityName: unity!['name'],
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
