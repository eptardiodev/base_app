// import 'dart:async';
// import 'dart:io';
// import 'dart:math';
//
// import 'package:base_app/utils/logger.dart';
// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
// import 'package:plan_to_build/data/remote/remote_constants.dart';
// import 'package:plan_to_build/data/shared_preferences/shared_preferences_managment.dart';
// import 'package:plan_to_build/domain/common.dart';
// import 'package:plan_to_build/domain/document/document_model.dart';
// import 'package:plan_to_build/domain/document/documents_model.dart';
// import 'package:plan_to_build/ui/document/document_utils.dart';
// import 'package:plan_to_build/utils/logger.dart';
//
// export 'package:http/http.dart';
//
// typedef void OnDownloadProgressCallback(int receivedBytes, int totalBytes);
// typedef void OnUploadProgressCallback(int sentBytes, int totalBytes);
//
// class NetworkHandler {
//   final Logger _logger;
//   final SharedPreferencesManager _sharedP;
//   Function? on401;
//
//   NetworkHandler(this._sharedP, this._logger);
//
//   ///Returns the common headers with authentication values
//   Future<Map<String, String>> _commonHeaders() async {
//     return {'Authorization': 'Bearer ${await _sharedP.getAccessToken()}'};
//   }
//
//   ///Get operations.
//   ///-The base URL by default is the one provided by the Injector.
//   ///-The [path] is mandatory
//   ///-The request already handles authentication
//   ///-The request already handles refresh token implementation
//   Future<http.Response> get({
//     required String path,
//     String params = '',
//     Map<String, String> headers = const {},
//   }) async {
//     final _url = await _sharedP.getBaseUrl() + path + params;
//     final _headers = await _commonHeaders();
//     _headers.addAll(headers);
//
//     try {
//       _logger.log("-> GET: $_url");
//       _logger.log("-> HEADERS: $_headers");
//       final res = await http.get(Uri.parse(_url),
//           headers: _headers.isEmpty ? null : _headers);
//       _logger.log("<- RESPONSE CODE: ${res.statusCode}");
//       _logger.log("<- RESPONSE BODY: ${res.body}");
//
//       if (res.statusCode == 401 && on401 != null) on401!();
//       return res;
//     } catch (ex) {
//       _logger.log("<- EXCEPTION: $ex");
//       throw ex;
//     }
//   }
//
//   ///Post operations.
//   ///-The base URL by default is the one provided by the Injector.
//   ///-The [path] is mandatory
//   ///-The request's content type is application/json
//   ///-The request already handles authentication
//   ///-The request already handles refresh token implementation
//   Future<http.Response> post({
//     required String path,
//     String params = '',
//     bool requireAuth = true,
//     String body = '',
//     bool notify401 = true,
//     Map<String, String> headers = const {},
//   }) async {
//     final _url = await _sharedP.getBaseUrl() + path + params;
//     final _headers =
//         requireAuth ? await _commonHeaders() : {} as Map<String, String>;
//     _headers.addAll(headers);
//
//     Map<String, String> additionalHeaders = {
//       'Content-type': 'application/json',
//       'Accept': 'application/json'
//     };
//     _headers.addAll(additionalHeaders);
//
//     try {
//       _logger.log("-> POST: $_url");
//       _logger.log("-> HEADERS: $_headers");
//       _logger.log("-> BODY: $body");
//       final res = await http.post(Uri.parse(_url),
//           headers: _headers.isEmpty ? null : _headers, body: body);
//       _logger.log("<- RESPONSE CODE: ${res.statusCode}");
//       _logger.log("<- RESPONSE BODY: ${res.body}");
//       if (res.statusCode == 401 && on401 != null && notify401) on401!();
//       return res;
//     } catch (ex) {
//       _logger.log("<- EXCEPTION: $ex");
//       throw ex;
//     }
//   }
//
//   ///Post operations.
//   ///-The base URL by default is the one provided by the Injector.
//   ///-The [path] is mandatory
//   ///-The request's content type is application/json
//   ///-The request already handles authentication
//   ///-The request already handles refresh token implementation
//   Future<http.Response> postNoJson({
//     required String path,
//     String params = '',
//     Map<String, dynamic>? queryParams,
//     bool requireAuth = true,
//     Object? body,
//     bool notify401 = true,
//     Map<String, String> headers = const {},
//   }) async {
//     String _baseUrl = await _sharedP.getBaseUrl();
//     _baseUrl = queryParams == null ? _baseUrl : _baseUrl.replaceAll("https://", "");
//     String _urlStr = _baseUrl + path + params;
//     final _url = queryParams == null ? Uri.parse(_urlStr) : Uri.https(_baseUrl, path, queryParams);
//
//     final _headers = requireAuth ? await _commonHeaders() : {} as Map<String, String>;
//     _headers.addAll(headers);
//
//     try {
//       _logger.log("-> POST: $_urlStr");
//       _logger.log("-> HEADERS: $_headers");
//       _logger.log("-> BODY: $body");
//       final res = await http.post(_url,
//           headers: _headers.isEmpty ? null : _headers, body: body);
//       _logger.log("<- RESPONSE CODE: ${res.statusCode}");
//       _logger.log("<- RESPONSE BODY: ${res.body}");
//       if (res.statusCode == 401 && on401 != null && notify401) on401!();
//       return res;
//     } catch (ex) {
//       _logger.log("<- EXEPTION: $ex");
//       throw ex;
//     }
//   }
//
//   ///Put operations.
//   ///-The base URL by default is the one provided by the Injector.
//   ///-The [path] is mandatory
//   ///-The request's content type is application/json
//   ///-The request already handles authentication
//   ///-The request already handles refresh token implementation
//   Future<http.Response> put({
//     required String path,
//     String params = '',
//     String? body,
//     Map<String, String> headers = const {},
//   }) async {
//     final _url = await _sharedP.getBaseUrl() + path + params;
//     final _headers = await _commonHeaders();
//     _headers.addAll(headers);
//
//     Map<String, String> aditionalHeaders = {
//       'Content-type': 'application/json',
//       'Accept': 'application/json'
//     };
//     _headers.addAll(aditionalHeaders);
//
//     try {
//       _logger.log("-> PUT: $_url");
//       _logger.log("-> HEADERS: $_headers");
//       _logger.log("-> BODY: $body");
//       final res = await http.put(Uri.parse(_url),
//           headers: _headers.isEmpty ? null : _headers, body: body);
//       _logger.log("<- RESPONSE CODE: ${res.statusCode}");
//       _logger.log("<- RESPONSE BODY: ${res.body}");
//       if (res.statusCode == 401 && on401 != null) on401!();
//       return res;
//     } catch (ex) {
//       _logger.log("<- EXEPTION: $ex");
//       throw ex;
//     }
//   }
//
//   ///Delete operations.
//   ///-The base URL by default is the one provided by the Injector.
//   ///-The [path] is mandatory
//   ///-The request already handles authentication
//   ///-The request already handles refresh token implementation
//   Future<http.Response> delete({
//     required String path,
//     String params = '',
//     Map<String, String> headers = const {},
//   }) async {
//     final _url = await _sharedP.getBaseUrl() + path + params;
//     final _headers = await _commonHeaders();
//     _headers.addAll(headers);
//
//     try {
//       _logger.log("-> DELETE: $_url");
//       _logger.log("-> HEADERS: $_headers");
//       final res = await http.delete(Uri.parse(_url),
//           headers: _headers.isEmpty ? null : _headers);
//       _logger.log("<- RESPONSE CODE: ${res.statusCode}");
//       _logger.log("<- RESPONSE BODY: ${res.body}");
//       if (res.statusCode == 401 && on401 != null) on401!();
//       return res;
//     } catch (ex) {
//       _logger.log("<- EXEPTION: $ex");
//       throw ex;
//     }
//   }
//
//   Future<http.Response> login({
//     required String baseUrl,
//     required String path,
//     Map<String, dynamic> body = const {},
//   }) async {
//     final _url = baseUrl + path;
//
//     try {
//       _logger.log("-> POST: $_url");
//       _logger.log("-> BODY: $body");
//       final res = await http.post(Uri.parse(_url), body: body);
//       _logger.log("<- RESPONSE CODE: ${res.statusCode}");
//       _logger.log("<- RESPONSE BODY: ${res.body}");
//       return res;
//     } catch (ex) {
//       _logger.log("<- EXEPTION: $ex");
//       throw ex;
//     }
//   }
//
//   Future<http.Response> forgotPassword({
//     required String path,
//     String body = '',
//   }) async {
//     final _url = await _sharedP.getBaseUrl() + path;
//
//     try {
//       _logger.log("-> POST: $_url");
//       _logger.log("-> BODY: $body");
//       final res = await http.post(Uri.parse(_url), body: body);
//       _logger.log("<- RESPONSE CODE: ${res.statusCode}");
//       _logger.log("<- RESPONSE BODY: ${res.body}");
//       return res;
//     } catch (ex) {
//       _logger.log("<- EXEPTION: $ex");
//       throw ex;
//     }
//   }
//
//   // Future<String> fileDownloadPage({
//   //   String pageId,
//   //   String downloadUrl,
//   //   OnUploadProgressCallback onDownloadProgress,
//   // }) async {
//   //   try {
//   //     final _url = await _sharedP.getBaseUrl() + '$downloadUrl/$pageId';
//   //     final Map<String, String> _headers = await _commonHeaders();
//   //     final path = await DocumentUtils.getDownloadPath();
//   //     var fileSave = new File('$path/$pageId.png');
//   //     final response = await http.get(_url, headers: _headers);
//   //     var raf = fileSave.openSync(mode: FileMode.write);
//   //     raf.writeFromSync(response.bodyBytes);
//   //     await raf.close();
//   //     return fileSave.path;
//   //   } catch (e) {
//   //     return e.toString();
//   //   }
//   // }
//
//   Future<dynamic> fileDownloadPageImage(
//       {required String pageId,
//       required String downloadUrl,
//       OnDownloadProgressCallback? onDownloadProgressCallback}) async {
//     HttpClient httpClient = HttpClient();
//     final request = await httpClient.getUrl(Uri.parse(downloadUrl));
//     var httpResponse = await request.close();
//     final path = await DocumentUtils.getDownloadPathTemporary();
//     var file = new File('$path/$pageId.jpg');
//
//     var raf = file.openSync(mode: FileMode.write);
//
//     Completer completer = new Completer<String>();
//
//     int byteCount = 0;
//     int totalBytes = httpResponse.contentLength;
//     httpResponse.listen(
//       (data) {
//         byteCount += data.length;
//         raf.writeFromSync(data);
//         //print("$byteCount -> $totalBytes");
//         if (onDownloadProgressCallback != null)
//           onDownloadProgressCallback(byteCount, totalBytes);
//       },
//       onDone: () {
//         raf.closeSync();
//         completer.complete(file.path);
//       },
//       onError: (e) {
//         raf.closeSync();
//         file.deleteSync();
//         completer.completeError(e);
//         print(e);
//       },
//       cancelOnError: true,
//     );
//     return completer.future;
//   }
//
//   Future<File?> fileDownload(
//       {required String downloadUrl,
//       required DocumentModel document,
//       required OnUploadProgressCallback onDownloadProgress, DOWNLOAD_DOCUMENT_EXTENSION? forcedExtension,
//         CancelToken? cancelToken, bool? saveInLocalDatabase
//       }) async {
//     try {
//       _logger.log('downloading $downloadUrl');
//
//       final destinationPath =
//           await DocumentUtils.getDocumentDownloadPath(
//               document, forcedExt: forcedExtension,
//               saveInLocalDatabase: saveInLocalDatabase);
//
//       _logger.log('destination $destinationPath');
//
//       File file = new File(destinationPath);
//
//       if (file.existsSync()) {
//         // onDownloadProgress(1,1);
//         // return file;
//         file.deleteSync(recursive: true);
//       }
//
//       Dio dioDownload = new Dio();
//       final res = await dioDownload.download(downloadUrl, file.path,
//           onReceiveProgress: (int count, int total) {
//         onDownloadProgress(count, total);
//       }, cancelToken: cancelToken);
//
//       _logger.log("<- RESPONSE CODE: ${res.statusCode}");
//       _logger.log("<- RESPONSE BODY: ${res.toString()}");
//
//       if (res.statusCode == RemoteConstants.code_success) {
//         return file;
//       }
//       return null;
//     } catch (ex) {
//       _logger.log("<- EXCEPTION: $ex");
//       throw ex;
//     }
//   }
//
//   Future<dynamic> fileUpload({
//     required String uploadUrl,
//     required FileModel fileModel,
//     required OnUploadProgressCallback? onUploadProgress,
//   }) async {
//     _logger.log('PUT Uploading $uploadUrl $fileModel');
//     final streamedRequest =
//         new http.StreamedRequest('PUT', Uri.parse(uploadUrl))
//           ..headers.addAll({'Content-Type': 'binary/octet-stream'});
//
//     final fileLength = await fileModel.file.length();
//     streamedRequest.contentLength = fileLength;
//
//     //This is a hack to start the byte counts under 0, this way the progress will never be completed
//     int byteCount = (0 - (fileLength / 7)).toInt();
//
//     fileModel.file.openRead().listen((chunk) {
// //      print("CHUNCK DATA: ${chunk.length}");
//       streamedRequest.sink.add(chunk);
//
//       byteCount += chunk.length;
//       if (onUploadProgress != null) {
//         onUploadProgress(max(byteCount, 0), fileLength);
//       }
//     }, onDone: () {
//       streamedRequest.sink.close();
//       _logger.log('onDone');
//     }, onError: (e) {
//       _logger.log("ERROR UPLOADING: ${e.toString()}");
//     });
//
//     final response = await streamedRequest.send();
//     if (onUploadProgress != null) {
//       onUploadProgress(fileLength, fileLength);
//     }
//     _logger.log('after response ${response.statusCode}');
//     return "FINISH";
//   }
// }
