import 'dart:convert';

import 'package:ParallelNano_Bobby_Mobile/app/constants.dart';
import 'package:ParallelNano_Bobby_Mobile/app/error_handler.dart';
import 'package:ParallelNano_Bobby_Mobile/app/ip_settings.dart';
import 'package:http/http.dart' as http;

/// A retriever that gets the sensor data from the server.
///
/// It sends [http.get] requests and receives back the temperature
/// or the humidity information depending on the called function.
class SensorDataRetriever {
  static Future<double> getTemperature() async {
    try {
      var _response = await http.get(
        Uri.encodeFull('http://' + IPSettings().ipValue + sensor_url),
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
        Uri.encodeFull('http://' + IPSettings().ipValue + sensor_url),
      );
      return jsonDecode(_response.body)['/sensor_status']['current_humidity'];
    } catch (errorSensor) {
      ErrorHandler.errorSensor();
      return wrong_sensor_value;
    }
  }
}
