import 'dart:io';

import 'package:base_app/base/error_handler.dart';
import 'package:base_app/domain/push_message/push_message.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:base_app/base/bloc_base.dart';
import '../../base/loading_handler.dart';

/// this function must defined top highlevel and call in main class
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

class HomeBloC extends BaseBloC with LoadingHandler, ErrorHandler {

  HomeBloC();

  FirebaseMessaging messaging = FirebaseMessaging.instance;


  @override
  void dispose() {
  }

  void init() {
    requestPermission();
    _onForegroundMessage();
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

    _getFCMToken();
  }

  void _getFCMToken() async {
    final setting = await messaging.getNotificationSettings();
    if(setting.authorizationStatus != AuthorizationStatus.authorized) return;

    final token = await messaging.getToken();
    print("token: $token");
  }

  void _handlerRemoteMessage(RemoteMessage message){

      if (message.notification == null) return;

      /// create a instance from PushMessage model for
      /// organize some variable obtained from >> RemoteMessage message
      final notification = PushMessage(
          messageId: message.messageId
              ?.replaceAll(':', '').replaceAll('%', '')
              ?? '',
          title: message.notification!.title ?? '',
          body: message.notification!.body ?? '',
          sentDate: message.sentTime ?? DateTime.now(),
          data: message.data,
          imageUrl: Platform.isAndroid
              ? message.notification!.android?.imageUrl
              : message.notification!.apple?.imageUrl
      );

      /// when called this print we going to call toString method
      /// defined in PushMessage model class
      print(notification);
  }

  /// function for activate listener ForegroundMessage Notification
  void _onForegroundMessage(){
    FirebaseMessaging.onMessage.listen(_handlerRemoteMessage);
  }

}

