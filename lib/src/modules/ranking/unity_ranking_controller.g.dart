// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unity_ranking_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UnityRankingController on _UnityRankingControllerBase, Store {
  Computed<dynamic>? _$submitScoreComputed;

  @override
  dynamic get submitScore =>
      (_$submitScoreComputed ??= Computed<dynamic>(() => super.submitScore,
              name: '_UnityRankingControllerBase.submitScore'))
          .value;

  final _$unityRepositoryAtom =
      Atom(name: '_UnityRankingControllerBase.unityRepository');

  @override
  UnityRepository get unityRepository {
    _$unityRepositoryAtom.reportRead();
    return super.unityRepository;
  }

  @override
  set unityRepository(UnityRepository value) {
    _$unityRepositoryAtom.reportWrite(value, super.unityRepository, () {
      super.unityRepository = value;
    });
  }

  final _$unityRankingRepositoryAtom =
      Atom(name: '_UnityRankingControllerBase.unityRankingRepository');

  @override
  UnityRankingRepository get unityRankingRepository {
    _$unityRankingRepositoryAtom.reportRead();
    return super.unityRankingRepository;
  }

  @override
  set unityRankingRepository(UnityRankingRepository value) {
    _$unityRankingRepositoryAtom
        .reportWrite(value, super.unityRankingRepository, () {
      super.unityRankingRepository = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_UnityRankingControllerBase.isLoading');

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

  final _$unityesAtom = Atom(name: '_UnityRankingControllerBase.unityes');

  @override
  List<ParseObject> get unityes {
    _$unityesAtom.reportRead();
    return super.unityes;
  }

  @override
  set unityes(List<ParseObject> value) {
    _$unityesAtom.reportWrite(value, super.unityes, () {
      super.unityes = value;
    });
  }

  final _$unityesNamesAtom =
      Atom(name: '_UnityRankingControllerBase.unityesNames');

  @override
  List<ParseObject> get unityesNames {
    _$unityesNamesAtom.reportRead();
    return super.unityesNames;
  }

  @override
  set unityesNames(List<ParseObject> value) {
    _$unityesNamesAtom.reportWrite(value, super.unityesNames, () {
      super.unityesNames = value;
    });
  }

  final _$unityAtom = Atom(name: '_UnityRankingControllerBase.unity');

  @override
  ParseObject? get unity {
    _$unityAtom.reportRead();
    return super.unity;
  }

  @override
  set unity(ParseObject? value) {
    _$unityAtom.reportWrite(value, super.unity, () {
      super.unity = value;
    });
  }

  final _$reasonAtom = Atom(name: '_UnityRankingControllerBase.reason');

  @override
  String? get reason {
    _$reasonAtom.reportRead();
    return super.reason;
  }

  @override
  set reason(String? value) {
    _$reasonAtom.reportWrite(value, super.reason, () {
      super.reason = value;
    });
  }

  final _$scoreAtom = Atom(name: '_UnityRankingControllerBase.score');

  @override
  num? get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(num? value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  final _$listaAtom = Atom(name: '_UnityRankingControllerBase.lista');

  @override
  List<UnityRanked> get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(List<UnityRanked> value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  final _$getUnityesRankingAsyncAction =
      AsyncAction('_UnityRankingControllerBase.getUnityesRanking');

  @override
  Future<void> getUnityesRanking(String eventID) {
    return _$getUnityesRankingAsyncAction
        .run(() => super.getUnityesRanking(eventID));
  }

  final _$getUnityesAsyncAction =
      AsyncAction('_UnityRankingControllerBase.getUnityes');

  @override
  Future<void> getUnityes() {
    return _$getUnityesAsyncAction.run(() => super.getUnityes());
  }

  final _$setUnityAsyncAction =
      AsyncAction('_UnityRankingControllerBase.setUnity');

  @override
  Future<void> setUnity(ParseObject value) {
    return _$setUnityAsyncAction.run(() => super.setUnity(value));
  }

  final _$setUnityScoreAsyncAction =
      AsyncAction('_UnityRankingControllerBase.setUnityScore');

  @override
  Future<void> setUnityScore() {
    return _$setUnityScoreAsyncAction.run(() => super.setUnityScore());
  }

  final _$_UnityRankingControllerBaseActionController =
      ActionController(name: '_UnityRankingControllerBase');

  @override
  void initScreen() {
    final _$actionInfo = _$_UnityRankingControllerBaseActionController
        .startAction(name: '_UnityRankingControllerBase.initScreen');
    try {
      return super.initScreen();
    } finally {
      _$_UnityRankingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReason(String value) {
    final _$actionInfo = _$_UnityRankingControllerBaseActionController
        .startAction(name: '_UnityRankingControllerBase.setReason');
    try {
      return super.setReason(value);
    } finally {
      _$_UnityRankingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScore(String value) {
    final _$actionInfo = _$_UnityRankingControllerBaseActionController
        .startAction(name: '_UnityRankingControllerBase.setScore');
    try {
      return super.setScore(value);
    } finally {
      _$_UnityRankingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
unityRepository: ${unityRepository},
unityRankingRepository: ${unityRankingRepository},
isLoading: ${isLoading},
unityes: ${unityes},
unityesNames: ${unityesNames},
unity: ${unity},
reason: ${reason},
score: ${score},
lista: ${lista},
submitScore: ${submitScore}
    ''';
  }
}
