// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashScreenController on _SplashScreenControllerBase, Store {
  Computed<bool>? _$isTokenValidComputed;

  @override
  bool get isTokenValid =>
      (_$isTokenValidComputed ??= Computed<bool>(() => super.isTokenValid,
              name: '_SplashScreenControllerBase.isTokenValid'))
          .value;

  late final _$setupStatusAtom =
      Atom(name: '_SplashScreenControllerBase.setupStatus', context: context);

  @override
  Resource<dynamic, dynamic> get setupStatus {
    _$setupStatusAtom.reportRead();
    return super.setupStatus;
  }

  @override
  set setupStatus(Resource<dynamic, dynamic> value) {
    _$setupStatusAtom.reportWrite(value, super.setupStatus, () {
      super.setupStatus = value;
    });
  }

  late final _$tokenAtom =
      Atom(name: '_SplashScreenControllerBase.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$checkIfTokenExistsAndIsValidAsyncAction = AsyncAction(
      '_SplashScreenControllerBase.checkIfTokenExistsAndIsValid',
      context: context);

  @override
  Future<void> checkIfTokenExistsAndIsValid(BuildContext context) {
    return _$checkIfTokenExistsAndIsValidAsyncAction
        .run(() => super.checkIfTokenExistsAndIsValid(context));
  }

  late final _$_SplashScreenControllerBaseActionController =
      ActionController(name: '_SplashScreenControllerBase', context: context);

  @override
  void _setTokenValue(String newValue) {
    final _$actionInfo = _$_SplashScreenControllerBaseActionController
        .startAction(name: '_SplashScreenControllerBase._setTokenValue');
    try {
      return super._setTokenValue(newValue);
    } finally {
      _$_SplashScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
setupStatus: ${setupStatus},
token: ${token},
isTokenValid: ${isTokenValid}
    ''';
  }
}
