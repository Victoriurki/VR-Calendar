import 'package:vr_project/core/models/user_models_keys.dart';

class UserModel {
  String? id;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? token;

  UserModel(
    {
      this.id,
      this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.token
    }); 
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map[UserModelKeys.id],
        email: map[UserModelKeys.email],
        password: map[UserModelKeys.password],
        lastName: map[UserModelKeys.lastName],
        firstName: map[UserModelKeys.firstName],
        token: map[UserModelKeys.token]);
  }
  Map<String, dynamic> toMap(UserModel user){
    return {
      UserModelKeys.id: user.id,
      UserModelKeys.email: user.email,
      UserModelKeys.password: user.password,
      UserModelKeys.firstName: user.firstName,
      UserModelKeys.lastName: user.lastName,
      UserModelKeys.token: user.token
    };
  }
}
