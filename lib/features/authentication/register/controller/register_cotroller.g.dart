// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_cotroller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on _RegisterControllerBase, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_RegisterControllerBase.isEmailValid'))
          .value;
  Computed<bool>? _$isFirstNameValidComputed;

  @override
  bool get isFirstNameValid => (_$isFirstNameValidComputed ??= Computed<bool>(
          () => super.isFirstNameValid,
          name: '_RegisterControllerBase.isFirstNameValid'))
      .value;
  Computed<bool>? _$isLastNameValidComputed;

  @override
  bool get isLastNameValid =>
      (_$isLastNameValidComputed ??= Computed<bool>(() => super.isLastNameValid,
              name: '_RegisterControllerBase.isLastNameValid'))
          .value;
  Computed<bool>? _$isPasswordLongEnoughComputed;

  @override
  bool get isPasswordLongEnough => (_$isPasswordLongEnoughComputed ??=
          Computed<bool>(() => super.isPasswordLongEnough,
              name: '_RegisterControllerBase.isPasswordLongEnough'))
      .value;
  Computed<bool>? _$passwordHasSpecialCaractersComputed;

  @override
  bool get passwordHasSpecialCaracters =>
      (_$passwordHasSpecialCaractersComputed ??= Computed<bool>(
              () => super.passwordHasSpecialCaracters,
              name: '_RegisterControllerBase.passwordHasSpecialCaracters'))
          .value;
  Computed<bool>? _$passwordHasNumbersComputed;

  @override
  bool get passwordHasNumbers => (_$passwordHasNumbersComputed ??=
          Computed<bool>(() => super.passwordHasNumbers,
              name: '_RegisterControllerBase.passwordHasNumbers'))
      .value;
  Computed<bool>? _$passwordHasUpperCaseComputed;

  @override
  bool get passwordHasUpperCase => (_$passwordHasUpperCaseComputed ??=
          Computed<bool>(() => super.passwordHasUpperCase,
              name: '_RegisterControllerBase.passwordHasUpperCase'))
      .value;
  Computed<bool>? _$isPasswordSameComputed;

  @override
  bool get isPasswordSame =>
      (_$isPasswordSameComputed ??= Computed<bool>(() => super.isPasswordSame,
              name: '_RegisterControllerBase.isPasswordSame'))
          .value;
  Computed<bool>? _$areCredentialsValidComputed;

  @override
  bool get areCredentialsValid => (_$areCredentialsValidComputed ??=
          Computed<bool>(() => super.areCredentialsValid,
              name: '_RegisterControllerBase.areCredentialsValid'))
      .value;

  late final _$userAtom =
      Atom(name: '_RegisterControllerBase.user', context: context);

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_RegisterControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$firstNameAtom =
      Atom(name: '_RegisterControllerBase.firstName', context: context);

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$lastNameAtom =
      Atom(name: '_RegisterControllerBase.lastName', context: context);

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_RegisterControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_RegisterControllerBase.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$isPasswordVisibleAtom =
      Atom(name: '_RegisterControllerBase.isPasswordVisible', context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$isConfirmPasswordVisibleAtom = Atom(
      name: '_RegisterControllerBase.isConfirmPasswordVisible',
      context: context);

  @override
  bool get isConfirmPasswordVisible {
    _$isConfirmPasswordVisibleAtom.reportRead();
    return super.isConfirmPasswordVisible;
  }

  @override
  set isConfirmPasswordVisible(bool value) {
    _$isConfirmPasswordVisibleAtom
        .reportWrite(value, super.isConfirmPasswordVisible, () {
      super.isConfirmPasswordVisible = value;
    });
  }

  late final _$isButtonLoadingAtom =
      Atom(name: '_RegisterControllerBase.isButtonLoading', context: context);

  @override
  bool get isButtonLoading {
    _$isButtonLoadingAtom.reportRead();
    return super.isButtonLoading;
  }

  @override
  set isButtonLoading(bool value) {
    _$isButtonLoadingAtom.reportWrite(value, super.isButtonLoading, () {
      super.isButtonLoading = value;
    });
  }

  late final _$registerUserAsyncAction =
      AsyncAction('_RegisterControllerBase.registerUser', context: context);

  @override
  Future<Resource<void, String>> registerUser() {
    return _$registerUserAsyncAction.run(() => super.registerUser());
  }

  late final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase', context: context);

  @override
  void ChangeEmail(String newValue) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.ChangeEmail');
    try {
      return super.ChangeEmail(newValue);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFirstName(String newValue) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changeFirstName');
    try {
      return super.changeFirstName(newValue);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLastName(String newValue) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changeLastName');
    try {
      return super.changeLastName(newValue);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassword(String newValue) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changePassword');
    try {
      return super.changePassword(newValue);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeConfirmPassword(String newValue) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changeConfirmPassword');
    try {
      return super.changeConfirmPassword(newValue);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordVisibitlity() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setPasswordVisibitlity');
    try {
      return super.setPasswordVisibitlity();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPasswordVisibility() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setConfirmPasswordVisibility');
    try {
      return super.setConfirmPasswordVisibility();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setButtonToLoading() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setButtonToLoading');
    try {
      return super.setButtonToLoading();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
email: ${email},
firstName: ${firstName},
lastName: ${lastName},
password: ${password},
confirmPassword: ${confirmPassword},
isPasswordVisible: ${isPasswordVisible},
isConfirmPasswordVisible: ${isConfirmPasswordVisible},
isButtonLoading: ${isButtonLoading},
isEmailValid: ${isEmailValid},
isFirstNameValid: ${isFirstNameValid},
isLastNameValid: ${isLastNameValid},
isPasswordLongEnough: ${isPasswordLongEnough},
passwordHasSpecialCaracters: ${passwordHasSpecialCaracters},
passwordHasNumbers: ${passwordHasNumbers},
passwordHasUpperCase: ${passwordHasUpperCase},
isPasswordSame: ${isPasswordSame},
areCredentialsValid: ${areCredentialsValid}
    ''';
  }
}
