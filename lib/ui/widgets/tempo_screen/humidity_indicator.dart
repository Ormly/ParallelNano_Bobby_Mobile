import 'dart:async';

import 'package:ParallelNano_Bobby_Mobile/app/constants.dart';
import 'package:ParallelNano_Bobby_Mobile/app/error_handler.dart';
import 'package:ParallelNano_Bobby_Mobile/rest/sensor_data_retriever.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

//Based on https://pub.dev/packages/liquid_progress_indicator/example

class HumidityIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _AnimatedLiquidCircularProgressIndicator();
  }
}

class _AnimatedLiquidCircularProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _AnimatedLiquidCircularProgressIndicatorState();
}

class _AnimatedLiquidCircularProgressIndicatorState
    extends State<_AnimatedLiquidCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  Timer _timer;
  double _currentHumidity;
  double _previousHumidity = 50.0;
  double _maximumHumidity = 90.0;

  @override
  void initState() {
    super.initState();
    _callTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150.0,
        height: 150.0,
        child: FutureBuilder(
            future: _getCurrentHumidity(),
            builder: (context, sensorData) {
              if (sensorData.hasData) {
                return LiquidCircularProgressIndicator(
                  value: sensorData.data / 100,
                  backgroundColor: Colors.grey[10],
                  borderColor: Colors.grey,
                  borderWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation(
                      sensorData.data < humidity_threshold
                          ? Colors.blue
                          : Colors.indigo[700]),
                  center: Text(
                    '${sensorData.data.toStringAsFixed(0)}%',
                    style: TextStyle(
                      color: sensorData.data < humidity_threshold
                          ? Colors.lightBlueAccent
                          : Colors.indigo[300],
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              } else {
                return LiquidCircularProgressIndicator(
                  value: 0.0,
                  backgroundColor: Colors.grey[10],
                  borderColor: Colors.grey,
                  borderWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  center: Text(
                    'Loading...',
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<double> _getCurrentHumidity() async {
    _currentHumidity = await SensorDataRetriever.getHumidity();
    if (_currentHumidity != wrong_sensor_value) {
      _previousHumidity = _currentHumidity + humidity_accuracy_fix;
      return _currentHumidity + humidity_accuracy_fix;
    } else {
      return _previousHumidity;
    }
  }

  void _callTimer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer t) {
        _counter++;
        if (_counter == 11) {
          if (_currentHumidity > _maximumHumidity)
            ErrorHandler.errorHighHumidity();
          setState(() {});
          _counter = 0;
        }
      },
    );
  }
}
