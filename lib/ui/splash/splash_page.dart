import 'package:base_app/app_globals/R.dart';
import 'package:base_app/base/bloc_state.dart';
import 'package:base_app/base/navigation_utils.dart';
import 'package:base_app/ui/home/home_page.dart';
import 'package:base_app/ui/splash/splash_bloc.dart';
import 'package:base_app/ui/tx_widgets/tx_no_appbar_widget.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends StateWithBloC<SplashPage, SplashBloc> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => NavigationUtils.pushReplacement(context, const HomePage())
    );
    // bloc.profileStream.listen((data) {
    //   if (data.firstLoggedOn == null) {
    //     NavigationUtils.pushReplacement(context, const HomePage());
    //   } else {
    //     bloc.getLicense().then((license) {
    //       if(license != null) {
    //         NavigationUtils.pushReplacementWithRouteAndMaterial(
    //             context,
    //             const HomePage(),
    //             NavigationUtils.homeRoute);
    //       } else {
    //         NavigationUtils.pushReplacement(context, LoginPage());
    //       }
    //     });
    //   }
    // });
    // bloc.getProfile();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // Future.delayed(const Duration(seconds: 4));
    // NavigationUtils.pushReplacement(context, const HomePage());

    return TXNoAppbarWidget(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child:
          // Text("Base App",
          //   style: TextStyle(fontSize: 60),),
          Image.asset(R.image.logo,
          ),
        ),
      ),
    );
  }
}