import 'package:base_app/app_globals/R.dart';
import 'package:base_app/data/remote/remote_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:base_app/app_bloc.dart';


import 'base/bloc_state.dart';
import 'generated/l10n.dart';

class BaseApp extends StatefulWidget {
  final Widget initPage;

  const BaseApp({
    required this.initPage,
    super.key});
  static GlobalKey<NavigatorState> appGlobalKey = GlobalKey<NavigatorState>();

  @override
  State<StatefulWidget> createState() => _BaseAppState();
}

class _BaseAppState
    extends StateWithBloC<BaseApp, BaseAppBloC> {
  @override
  Widget buildWidget(BuildContext context) {
    return MaterialApp(
      navigatorKey: BaseApp.appGlobalKey,
      debugShowCheckedModeBanner: false,
      // initialRoute: NavigationUtils.homeRoute,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
          child: child!,
        );
      },
      title: RemoteConstants.nameApp,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: R.color.whiteColor),
            titleTextStyle: TextStyle(color: R.color.whiteColor),
            backgroundColor: R.color.primaryColor,
          ),
          brightness: Brightness.light,
          primaryColor: R.color.primaryColor,
          textSelectionTheme: TextSelectionThemeData(cursorColor: R.color.primaryColor)),
      home: widget.initPage,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      // onGenerateRoute: (RouteSettings settings) {
      //   if(settings.name == NavigationUtils.homeRoute) {
      //     return MaterialPageRoute(
      //         settings: const RouteSettings(name: NavigationUtils.homeRoute),
      //         builder: (_) => const HomePage());
      //   }
      //   assert(false, 'Need to implement ${settings.name}');
      //   return null;
      // },
    );
  }
}
