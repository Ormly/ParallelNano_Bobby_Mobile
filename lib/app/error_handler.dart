import 'package:fluttertoast/fluttertoast.dart';

/// An index of all the possible errors.
///
/// Each error has a function to call a [Fluttertoast]
/// which displays the error on the screen.
class ErrorHandler {
  static var _errorIP = '2000';
  static var _errorSensor = '2001';
  static var _errorNodes = '2002';

  static void errorIP() {
    Fluttertoast.showToast(
      msg: 'Error ' + _errorIP + ':\nNo connection or wrong address!',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 4,
    );
  }

  static void errorSensor() {
    Fluttertoast.showToast(
      msg: 'Error ' + _errorSensor + ':\nSensor data cannot be retrieved!',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 4,
    );
  }

  static void errorHighTemperature() {
    Fluttertoast.showToast(
      msg: 'Temperature is too high!',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 4,
    );
  }

  static void errorHighHumidity() {
    Fluttertoast.showToast(
      msg: 'Humidity is too high!',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 4,
    );
  }

  static void errorNodes() {
    Fluttertoast.showToast(
      msg: 'Error ' + _errorNodes + ':\nNodes data cannot be retrieved!',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 4,
    );
  }
}
