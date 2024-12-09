import 'dart:convert';

import 'package:base_app/data/converter/user_converter.dart';
import 'package:base_app/data/local/app_database.dart';
import 'package:base_app/data/local/db_constants.dart';
import 'package:base_app/domain/user/i_user_dao.dart';
import 'package:base_app/domain/user/user_model.dart';
import 'package:base_app/utils/extensions.dart';
import 'package:sqflite/sqflite.dart';


class UserDao implements IUserDao {
  final AppDatabase _appDatabase;
  final UserConverter _userConverter;

  UserDao(this._appDatabase, this._userConverter);

  // @override
  // Future<List<UserModel>> getUsers() async {
  //   final List<UserModel> list = [];
  //   try {
  //     Database db = await _appDatabase.db;
  //     final data = await db.query(DBConstants.userTable);
  //     data.forEach((map) {
  //       final value = map[DBConstants.dataKey].objToString();
  //       final UserModel obj = _userModelConverter.fromJson(json.decode(value));
  //       list.add(obj);
  //     });
  //     return list;
  //   } catch (ex) {
  //     return [];
  //   }
  // }
  //
  // @override
  // Future<List<UserModel>> getUsersByProject(String projectId) async {
  //   final List<UserModel> list = [];
  //   try {
  //     Database db = await _appDatabase.db;
  //     final data = await db.query(DBConstants.userByProjectTable,
  //         where: '${DBConstants.parentKey} = ?', whereArgs: [projectId]);
  //     data.forEach((map) {
  //       final value = map[DBConstants.dataKey].objToString();
  //       final UserModel obj = _userModelConverter.fromJson(json.decode(value));
  //       list.add(obj);
  //     });
  //     return list;
  //   } catch (ex) {
  //     return [];
  //   }
  // }
  //
  // @override
  // Future<bool> saveUsers(List<UserModel> list) async {
  //   try {
  //     Database db = await _appDatabase.db;
  //     list.forEach((model) async {
  //       final map = {
  //         DBConstants.idKey: model.userId,
  //         DBConstants.dataKey: json.encode(_userModelConverter.toJson(model)),
  //         DBConstants.parentKey: DBConstants.users,
  //       };
  //       await db.insert(DBConstants.userTable, map,
  //           conflictAlgorithm: ConflictAlgorithm.replace);
  //     });
  //     return true;
  //   } catch (ex) {
  //     return false;
  //   }
  // }
  //
  // @override
  // Future<bool> saveUsersByProject(
  //     String projectId, List<UserModel> list) async {
  //   try {
  //     Database db = await _appDatabase.db;
  //     list.forEach((model) async {
  //       final map = {
  //         DBConstants.idKey: "${model.userId}-$projectId",
  //         DBConstants.dataKey: json.encode(_userModelConverter.toJson(model)),
  //         DBConstants.parentKey: projectId,
  //       };
  //       await db.insert(DBConstants.userByProjectTable, map,
  //           conflictAlgorithm: ConflictAlgorithm.replace);
  //     });
  //     return true;
  //   } catch (ex) {
  //     return false;
  //   }
  // }
  //
  // @override
  // Future<List<UserModel>> getUsersByCustomer(String customerId) async {
  //   final List<UserModel> list = [];
  //   try {
  //     Database db = await _appDatabase.db;
  //     final data = await db.query(DBConstants.userByCustomerTable,
  //         where: '${DBConstants.parentKey} = ?', whereArgs: [customerId]);
  //     data.forEach((map) {
  //       final value = map[DBConstants.dataKey].objToString();
  //       final UserModel obj = _userModelConverter.fromJson(json.decode(value));
  //       list.add(obj);
  //     });
  //     return list;
  //   } catch (ex) {
  //     return [];
  //   }
  // }
  //
  // @override
  // Future<bool> saveUsersByCustomer(
  //     String customerId, List<UserModel> list) async {
  //   try {
  //     Database db = await _appDatabase.db;
  //     list.forEach((model) async {
  //       final map = {
  //         DBConstants.idKey: "${model.userId}-$customerId",
  //         DBConstants.dataKey: json.encode(_userModelConverter.toJson(model)),
  //         DBConstants.parentKey: customerId,
  //       };
  //       await db.insert(DBConstants.userByCustomerTable, map,
  //           conflictAlgorithm: ConflictAlgorithm.replace);
  //     });
  //     return true;
  //   } catch (ex) {
  //     return false;
  //   }
  // }

  @override
  Future<UserModel> getProfile() async {
    try {
      Database db = await _appDatabase.db;
      final data = await db.query(DBConstants.profileTable, limit: 1);
      if (data.length > 0) {
        final value = data[0][DBConstants.dataKey].objToString();
        UserModel model = _userConverter.fromJson(json.decode(value));
        return model;
      }
      return UserModel();
    } catch (ex) {
      return UserModel();
    }
  }

  @override
  Future<bool> saveProfile(UserModel user) async {
    try {
      Database db = await _appDatabase.db;
      final map = {
        DBConstants.idKey: user.userId,
        DBConstants.dataKey: json.encode(_userConverter.toJson(user)),
        DBConstants.parentKey: DBConstants.address,
      };
      await db.insert(DBConstants.profileTable, map,
          conflictAlgorithm: ConflictAlgorithm.replace);
      return true;
    } catch (ex) {
      return false;
    }
  }
}
