import 'package:flutter/material.dart';

class TXNoAppbarWidget extends StatelessWidget{
  final Widget body;

  const TXNoAppbarWidget({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: body,
      ),
    );
  }

}