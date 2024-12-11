import 'dart:async';
import 'package:base_app/ui/home/home_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:base_app/app.dart';
import 'package:base_app/ui/home/home_page.dart';
import 'package:base_app/ui/splash/splash_page.dart';
import 'di/injector.dart';
import 'package:base_app/firebase_options.dart';

void main() {
  Injector.init();
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// background message notification listener
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(
      const BaseApp(
        initPage: SplashPage(),
      )
    );
  }, (error, stackTrace) async {
    Injector.instance.logger.log(error);
  });
}
