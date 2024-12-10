import 'package:base_app/base/error_handler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:base_app/base/bloc_base.dart';
import '../../base/loading_handler.dart';

class HomeBloC extends BaseBloC with LoadingHandler, ErrorHandler {

  HomeBloC();

  FirebaseMessaging messaging = FirebaseMessaging.instance;


  @override
  void dispose() {
  }

  void requestPermission () async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    settings.authorizationStatus;

  }
}

