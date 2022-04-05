// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool>? _$isUserNameValidComputed;

  @override
  bool get isUserNameValid =>
      (_$isUserNameValidComputed ??= Computed<bool>(() => super.isUserNameValid,
              name: '_LoginControllerBase.isUserNameValid'))
          .value;
  Computed<String?>? _$usernameMessageComputed;

  @override
  String? get usernameMessage => (_$usernameMessageComputed ??=
          Computed<String?>(() => super.usernameMessage,
              name: '_LoginControllerBase.usernameMessage'))
      .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_LoginControllerBase.isPasswordValid'))
          .value;
  Computed<String?>? _$passwordMessageComputed;

  @override
  String? get passwordMessage => (_$passwordMessageComputed ??=
          Computed<String?>(() => super.passwordMessage,
              name: '_LoginControllerBase.passwordMessage'))
      .value;
  Computed<dynamic>? _$isFormValidComputed;

  @override
  dynamic get isFormValid =>
      (_$isFormValidComputed ??= Computed<dynamic>(() => super.isFormValid,
              name: '_LoginControllerBase.isFormValid'))
          .value;

  final _$repositoryAtom = Atom(name: '_LoginControllerBase.repository');

  @override
  LoginRepository get repository {
    _$repositoryAtom.reportRead();
    return super.repository;
  }

  @override
  set repository(LoginRepository value) {
    _$repositoryAtom.reportWrite(value, super.repository, () {
      super.repository = value;
    });
  }

  final _$usernameAtom = Atom(name: '_LoginControllerBase.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginControllerBase.login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
repository: ${repository},
username: ${username},
isUserNameValid: ${isUserNameValid},
usernameMessage: ${usernameMessage},
isPasswordValid: ${isPasswordValid},
passwordMessage: ${passwordMessage},
isFormValid: ${isFormValid}
    ''';
  }
}
