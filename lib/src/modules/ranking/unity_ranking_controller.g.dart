// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unity_ranking_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UnityRankingController on _UnityRankingControllerBase, Store {
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

  final _$getUnityesRankingAsyncAction =
      AsyncAction('_UnityRankingControllerBase.getUnityesRanking');

  @override
  Future<void> getUnityesRanking() {
    return _$getUnityesRankingAsyncAction.run(() => super.getUnityesRanking());
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
  String toString() {
    return '''
unityRepository: ${unityRepository},
isLoading: ${isLoading},
unityes: ${unityes}
    ''';
  }
}
