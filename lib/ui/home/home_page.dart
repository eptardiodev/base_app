import 'dart:async';

import 'package:base_app/base/bloc_state.dart';
import 'package:base_app/res/R.dart';
import 'package:flutter/material.dart';
import 'home_bloc.dart';



class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends StateWithBloC<HomePage, HomeBloC> {

    int count = 0;

  @override
  void initState() {
    super.initState();

  }

  @override
  bool shouldReLogin() => true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade800,
        onPressed: () {
          setState(() {
            count += 1;
          });
        },
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            Icons.add,
            color: Colors.blue.shade800,
          ),
        ),
      ),
      body: Center(child: Text(count.toString())),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        leading: IconButton(
          icon: Icon(Icons.other_houses_outlined),
          onPressed: () {  },
        ),
      ),
    );
  }
}
