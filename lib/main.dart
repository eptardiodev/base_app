import 'dart:async';
import 'package:flutter/material.dart';
import 'package:base_app/app.dart';
import 'di/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injector.init();
  runZonedGuarded(() {
    runApp(
      const BaseApp()
    );
  }, (error, stackTrace) async {
    Injector.instance.logger.log(error);
  });
}
