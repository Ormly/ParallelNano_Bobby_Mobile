import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ParallelNano_Bobby_Mobile/app/error_handler.dart';

/// A class to check if we can connect to the given IP.
///
/// It tries connects to the Rest API through [http.get],
/// this is used to check if we get an answer from this ip,
/// therefore checking if the ip is valid or not. If it is valid
/// it navigates to the home screen, if not displays an error toast.
class ConnectionChecker {
  static Future<void> checkConnection(
      String userIP, BuildContext context) async {
    try {
      await http
          .get(
            Uri.encodeFull('http://' + userIP + ':8000'),
          )
          .timeout(const Duration(seconds: 2));
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (errorIP) {
      ErrorHandler.errorIP();
    }
  }
}
