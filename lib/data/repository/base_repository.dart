


import 'dart:io';

import 'package:base_app/data/remote/remote_constants.dart';

import '../remote/exceptions.dart';
import '../remote/result.dart';

class BaseRepository {
  ResultError<T> resultError<T>(dynamic ex) {
    String message = ex.toString();
    int code = -1;
    if (ex is ServerException) {
      message = ex.message;
      code = ex.code;
    } else if (ex is SocketException) {
      message = "SocketException";
    }
    return Result.error(error: message);
  }
  bool isHostUnableException(dynamic ex) =>
      ex is SocketException && ex.message.contains(
          RemoteConstants.unable_host_massage);

  bool isNotFoundException(dynamic ex) =>
      ex is ServerException && ex.code == RemoteConstants.codeNotFound;

  bool isSoftwareConnectionAbort(dynamic ex) =>
      ex is ServerException && ex.message.contains(
          RemoteConstants.software_caused_connection_abort);
}
