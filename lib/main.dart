import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

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
