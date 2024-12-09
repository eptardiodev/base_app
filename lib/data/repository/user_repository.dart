import 'dart:io';

import 'package:base_app/data/remote/remote_constants.dart';
import 'package:base_app/data/remote/result.dart';
import 'package:base_app/data/repository/base_repository.dart';
import 'package:base_app/data/shared_preferences/shared_preferences_managment.dart';
import 'package:base_app/domain/user/i_user_dao.dart';
import 'package:base_app/domain/user/i_user_repository.dart';
import 'package:base_app/domain/user/user_model.dart';
import 'package:base_app/utils/logger.dart';


class UserRepository extends BaseRepository implements IUserRepository {
  final Logger _logger;
  final IUserDao _userDao;
  final SharedPreferencesManager sharedP;

  UserRepository(
    this._logger,
    this._userDao,
    this.sharedP,
  );

  @override
  Future<Result<UserModel>> getUserProfile() async {
    try {
      // final value = await _iUserApi.getUserProfile();

      // final url = "${Endpoint.user}/${value.userId}${Endpoint.preSignedUrl}";
      // final resUrl = await _imageAPI.getPreSignedUrl(url);
      // value.logoUrl = value.logoUrl.replaceAll('"', '');

      // await _userDao.saveProfile(value);
      final res = await _userDao.getProfile();
      return Result.success(value: res);
    } catch (ex) {
      // if (isHostUnableException(ex)) {
      //   final res = await _userDao.getProfile();
        // return Result.success(value: res, hostUnable: true);
      // }
      return Result.error(error: ex);
    }
  }

  // @override
  // Future<Result<UserModel>> updateProfile(UserModel user) async {
  //   try {
  //     // final value = await _iUserApi.updateUserProfile(user);
  //     // final url = "${Endpoint.user}/${value.userId}${Endpoint.preSignedUrl}";
  //     // final resUrl = await _imageAPI.getPreSignedUrl(url);
  //     // value.logoUrl = value.logoUrl.replaceAll('"', '');
  //
  //     /// Implement Update DAO
  //     return Result.success(value: value);
  //   } catch (ex) {
  //     _logger.log(ex);
  //     return Result.error(error: ex);
  //   }
  // }

  @override
  Future<Result<bool>> logout() async {
    try {
      // await _fcmFeature.deactivateToken();
      // final res = await _iUserApi.logout();
      //Removed the access token always
      sharedP.setAccessToken('');

      return Result.success(value: true);
    } catch (ex) {
      _logger.log(ex);
      return Result.error(error: ex);
    }
  }

  // @override
  // Future<Result<UserModel>> getCurrentUser() async {
  //   try {
  //     final value = await _iUserApi.getCurrentUser();
  //     // final url = "${Endpoint.user}/${value.userId}${Endpoint.preSignedUrl}";
  //     // final resUrl = await _imageAPI.getPreSignedUrl(url);
  //     value.logoUrl = value.logoUrl.replaceAll('"', '');
  //
  //     return Result.success(value: value);
  //   } catch (ex) {
  //     _logger.log(ex);
  //     return Result.error(error: ex);
  //   }
  // }

  // @override
  // Future<Result<bool>> updateFirstLogged() async {
  //   try {
  //     final value = await _iUserApi.updateFirstLogged();
  //     return Result.success(value: value);
  //   } catch (ex) {
  //     _logger.log(ex);
  //     return Result.error(error: ex);
  //   }
  // }
}
