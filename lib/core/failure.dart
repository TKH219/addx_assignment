import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/utils.dart';

abstract class Failure extends Error {
  void handleError();
}

class GeneralFailure extends Failure {
  final dynamic error;

  GeneralFailure(this.error);

  void handleError() {
    debugPrint('General error: ${error.toString()}');
  }
}


class APIFailure extends Failure {
  final DioError? error;

  APIFailure(this.error);

  void handleError() {
    switch(error?.response?.statusCode){
      case 500:
        showToastMessage(
          error?.response?.statusMessage ?? 'Server not found',
          gravity: ToastGravity.BOTTOM,
        );
      case 401:
        showToastMessage(
          error?.response?.statusMessage ?? 'Authentication failure',
          gravity: ToastGravity.BOTTOM,
        );
        break;
      default:
        break;
    }
  }
}
