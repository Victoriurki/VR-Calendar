import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:vr_project/core/constants/api_routes.dart';
import 'package:vr_project/core/generics/recource.dart';
import 'package:vr_project/core/models/user_models.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final _dio = Dio();
  final _hive = Hive.box<String>('Credentials');

  @observable
  String email = '';

  @action
  void changeEmail(String newValue) => email = newValue;

  @observable
  String password = '';

  @action
  void changePassword(String newValue) => password = newValue;
  
  @action
  void setPasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @observable
  Resource<UserModel, String> user = Resource.loading();

  @observable
  bool isPasswordVisible = false;

  @observable
  bool isButtonAtLoadingStatus = false;

  @action
  void setButtonToLoadingStatus() => isButtonAtLoadingStatus = true;

  @action
  void changePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @computed
  bool get areCredencialsValid => isEmailValid && isPasswordValid;

  @action
  Future<Resource<void, String>> loginUser() async {
    try {
      final result = await _dio.post(ApiRoutes.loginRoute,
          data: {"email": email, "password": password});
      user = Resource.success(data: UserModel.fromMap(result.data));
      await _hive.put('token', user.data!.token!);

      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return user;
    } on DioError catch (e) {
      user = Resource.failed(error: e.response.toString());
      return user;
    } on FirebaseAuthException catch (e) {
      user = Resource.failed(error: 'user-not-found');
      if (e.code == 'user-not-found') {
        user = Resource.failed(error: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        user = Resource.failed(error: 'Wrong password provided for that user.');
      }
      return user;
    }
  }

  @computed
  bool get isEmailValid =>
      email.isNotEmpty && email.contains('@') && email.contains(".com");

  @computed
  bool get isPasswordValid => password.isNotEmpty;
}
