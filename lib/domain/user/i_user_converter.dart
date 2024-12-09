import 'package:base_app/domain/user/user_model.dart';


abstract class IUserConverter {

  UserModel fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson(UserModel model);

}