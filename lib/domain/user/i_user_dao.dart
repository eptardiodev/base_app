import 'package:base_app/domain/user/user_model.dart';

abstract class IUserDao {
  // Future<bool> saveUsers(List<UserModel> list);

  Future<bool> saveProfile(UserModel user);

  Future<UserModel> getProfile();

  // Future<bool> saveUsersByProject(String projectId, List<UserModel> list);

  // Future<bool> saveUsersByCustomer(String customerId, List<UserModel> list);

  // Future<List<UserModel>> getUsers();

  // Future<List<UserModel>> getUsersByProject(String projectId);

  // Future<List<UserModel>> getUsersByCustomer(String customerId);
}
