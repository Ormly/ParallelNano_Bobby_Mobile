import 'dart:convert';

import 'package:ParallelNano_Bobby_Mobile/app/constants.dart';
import 'package:ParallelNano_Bobby_Mobile/app/error_handler.dart';
import 'package:ParallelNano_Bobby_Mobile/app/user_settings.dart';
import 'package:http/http.dart' as http;

/// A retriever that gets the queue from the server.
///
/// It sends http get requests and receives back the queue,
/// the current song or the current time depending on the
/// method that is called.
class SensorDataRetriever {
  static Future<double> getTemperature() async {
    try {
      var _response = await http.get(
        Uri.encodeFull('http://' + UserSettings().ipValue + sensor_url),
      );
      return jsonDecode(_response.body)['/sensor_status']
          ['current_temperature'];
    } catch (errorSensor) {
      ErrorHandler.errorSensor();
      return wrong_sensor_value;
    }
  }

  static Future<double> getHumidity() async {
    try {
      var _response = await http.get(
        Uri.encodeFull('http://' + UserSettings().ipValue + sensor_url),
      );
      return jsonDecode(_response.body)['/sensor_status']['current_humidity'];
    } catch (errorSensor) {
      ErrorHandler.errorSensor();
      return wrong_sensor_value;
    }
  }
}
