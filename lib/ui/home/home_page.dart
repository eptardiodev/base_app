import 'package:base_app/app_globals/R.dart';
import 'package:base_app/base/bloc_state.dart';
import 'package:flutter/material.dart';
import 'home_bloc.dart';



class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends StateWithBloC<HomePage, HomeBloC> {

    int count = 0;

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: R.color.primaryColor,
        onPressed: () {
          setState(() {
            count += 1;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            Icons.add,
            color: R.color.primaryColor,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              count.toString()),
            Text(R.string.hello)
          ],
        )
      ),
      appBar: AppBar(
        backgroundColor: R.color.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.other_houses_outlined),
          onPressed: () {  },
        ),
      ),
    );
  }
}
