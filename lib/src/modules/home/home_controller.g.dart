// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_HomeControllerBase.isLoading');

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

  final _$userRepositoryAtom = Atom(name: '_HomeControllerBase.userRepository');

  @override
  UserRepository get userRepository {
    _$userRepositoryAtom.reportRead();
    return super.userRepository;
  }

  @override
  set userRepository(UserRepository value) {
    _$userRepositoryAtom.reportWrite(value, super.userRepository, () {
      super.userRepository = value;
    });
  }

  final _$currentUserAtom = Atom(name: '_HomeControllerBase.currentUser');

  @override
  ParseUser? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(ParseUser? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$getCurrentUserAsyncAction =
      AsyncAction('_HomeControllerBase.getCurrentUser');

  @override
  Future<void> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  final _$logoutAsyncAction = AsyncAction('_HomeControllerBase.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$getUnityesAsyncAction = AsyncAction('_HomeControllerBase.getUnityes');

  @override
  Future<void> getUnityes() {
    return _$getUnityesAsyncAction.run(() => super.getUnityes());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void initApp() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.initApp');
    try {
      return super.initApp();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
userRepository: ${userRepository},
currentUser: ${currentUser}
    ''';
  }
}
