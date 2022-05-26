import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:vr_project/core/constants/api_routes.dart';
import 'package:vr_project/core/generics/recource.dart';
import 'package:vr_project/core/models/user_models.dart';
import 'package:vr_project/core/models/user_models_keys.dart';
part 'register_cotroller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final _dio = Dio();
  final _hive = Hive.box<String>('Credentials');

  @observable
  UserModel user = UserModel();

  @observable
  String email = '';

  @action
  void ChangeEmail(String newValue) => email = newValue;

  @computed
  bool get isEmailValid =>
      email.contains("@") && email.contains('.com') && email.length > 7;

  @observable
  String firstName = '';

  @action
  void changeFirstName(String newValue) => firstName = newValue;

  @computed
  bool get isFirstNameValid => firstName.isNotEmpty;

  @observable
  String lastName = '';

  @action
  void changeLastName(String newValue) => lastName = newValue;

  @computed
  bool get isLastNameValid => lastName.isNotEmpty;

  @observable
  String password = '';

  @action
  void changePassword(String newValue) => password = newValue;

  @computed
  bool get isPasswordLongEnough => password.length > 5;

  @computed
  bool get passwordHasSpecialCaracters =>
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  @computed
  bool get passwordHasNumbers => password.contains(RegExp(r'[0-9]'));

  @computed
  bool get passwordHasUpperCase => password.contains(RegExp(r'^[A-Z]'));

  @observable
  String confirmPassword = '';

  @action
  void changeConfirmPassword(String newValue) => confirmPassword = newValue;

  @computed
  bool get isPasswordSame => password == confirmPassword;

  @action
  Future<Resource<void, String>> registerUser() async {
    try {
      final result = await _dio.post(
        ApiRoutes.registerRoute,
        data: {
          "email": email,
          "password": password,
          "first_name": firstName,
          "last_name": lastName,
        },
      );
      user = UserModel.fromMap(result.data);
      await _hive.put('token', user.token!);

      String userEmail = user.email!;
      String userFirstName = user.firstName!;
      String userLastName = user.lastName!;

      await FirebaseFirestore.instance
          .collection("users")
          .doc('$userEmail.$userFirstName.$userLastName')
          .set({
        "email": email,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
      });

      return Resource.success();
    } on DioError catch (e) {
      return Resource.failed(error: e.response!.toString());
    }
  }

  @observable
  bool isPasswordVisible = false;

  @action
  void setPasswordVisibitlity() => isPasswordVisible = !isPasswordVisible;

  @observable
  bool isConfirmPasswordVisible = false;

  @action
  void setConfirmPasswordVisibility() =>
      isConfirmPasswordVisible = !isConfirmPasswordVisible;

  @observable
  bool isButtonLoading = false;

  @action
  void setButtonToLoading() => isButtonLoading == true;

  @computed
  bool get areCredentialsValid =>
      isEmailValid &&
      isFirstNameValid &&
      isLastNameValid &&
      isPasswordLongEnough &&
      passwordHasNumbers &&
      passwordHasSpecialCaracters &&
      passwordHasUpperCase &&
      isPasswordSame;
}
