import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:vr_project/core/generics/recource.dart';
import 'package:vr_project/features/authentication/home_page.dart/view/home_page_view.dart';
import 'package:vr_project/features/authentication/login/view/login_page.dart';
part 'splash_screen_controller.g.dart';

class SplashScreenController = _SplashScreenControllerBase
    with _$SplashScreenController;

abstract class _SplashScreenControllerBase with Store {
  final _hive = Hive.box<String>('Credentials');

  @observable
  Resource setupStatus = Resource.loading();

  @observable
  String token = '';

  @action
  void _setTokenValue(String newValue) => token = newValue;

  @computed
  bool get isTokenValid => token.isNotEmpty && token.contains('ey');

  @action
  Future<void> checkIfTokenExistsAndIsValid(BuildContext context) async {
    final localToken = await _hive.get('token');

    await Future.delayed(const Duration(milliseconds: 3500));

    if (localToken == null) {
      setupStatus =
          Resource.failed(error: 'Token is missing, please signIn again');
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
      return;
    }

    _setTokenValue(localToken);
    setupStatus = Resource.success();
    await Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
