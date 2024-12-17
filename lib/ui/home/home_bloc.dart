import 'package:base_app/base/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:base_app/base/bloc_base.dart';
import '../../base/loading_handler.dart';

class HomeBloC extends BaseBloC with LoadingHandler, ErrorHandler {

  HomeBloC();

  @override
  void dispose() {
  }

  int count2 = 0;

  int isPar (int num){

    if(num.isEven){
      return num;
    } else {
      return 0;
    }

  }

}

