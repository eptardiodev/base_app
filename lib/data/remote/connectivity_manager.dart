// import 'dart:async';
// import 'dart:io';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:plan_to_build/utils/extensions.dart';
// import 'package:rxdart/rxdart.dart';
//
// class ConnectivityManager {
//   Connectivity? _connectivity;
//
//   static ConnectivityManager? _instance;
//
//   static ConnectivityManager get instance {
//     _instance ??= ConnectivityManager._internal();
//     return _instance!;
//   }
//
//   ConnectivityManager._internal() {
//     _connectivity ??= Connectivity();
//   }
//
//   final onConnectivityChangeController = BehaviorSubject.seeded([ConnectivityResult.none]);
//   final hasInternetController = BehaviorSubject.seeded(false);
//   final isSyncData = BehaviorSubject.seeded(true);
//
//   Future<List<ConnectivityResult>> checkConnectivity() async => await _connectivity!.onConnectivityChanged.first;
//
//   void initConnectivityAndInternetCheckerWithListeners() {
//     const host = "google.com";
//     _connectivity!.onConnectivityChanged.listen((List<ConnectivityResult> status) async {
//       if (status != onConnectivityChangeController.value) {
//         onConnectivityChangeController.sinkAddSafe(status);
//         var hasInternet = false;
//         if (status != [ConnectivityResult.none]) {
//           hasInternet = await checkConnectionToHost(host);
//         }
//         hasInternetController.sinkAddSafe(hasInternet);
//       }
//     });
//
//     Timer.periodic(const Duration(seconds: 5), (timer) async {
//       final hasInternet = await checkConnectionToHost(host);
//       if(hasInternetController.value != hasInternet) {
//         hasInternetController.sinkAddSafe(hasInternet);
//       }
//     });
//   }
//
//   Future<bool> checkConnectionToHost(String host) async {
//     try {
//       final result = await InternetAddress.lookup(host);
//       if(result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         return true;
//       }
//       return false;
//     } on SocketException catch(ex) {
//       if (kDebugMode) {
//         print("SocketException Connection Check Routine: ${ex.toString()}");
//       }
//       return false;
//     }
//   }
// }
