import 'dart:core';
import 'dart:io';

import 'package:base_app/data/remote/result.dart';
import 'package:base_app/domain/user/user_model.dart';



abstract class IUserRepository {
  Future<Result<UserModel>> getUserProfile();

  // Future<Result<UserModel>> getUser(String userId);

  // Future<Result<UserModel>> getCurrentUser();

  // Future<Result<List<UserModel>>> getCustomerAllUsers();

  // Future<Result<bool>> updateFirstLogged();

  // Future<Result<UserModel>> updateProfile(UserModel user);

  // Future<Result<String>> updateUserImage({
  //   required String userId,
  //   required File image,
  // });

 // Future<Result<String>> getUserImageUrl(String userId);

  // Future<Result<List<UserModel>>> getProjectUsers(String projectId, {bool forceLocal = false});

  // Future<Result<List<UserModel>>> getCustomerUsers(String customerId, {bool forceLocal = false});

  Future<Result<bool>> logout();
}
