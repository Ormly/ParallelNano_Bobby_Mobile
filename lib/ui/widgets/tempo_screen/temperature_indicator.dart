import 'dart:async';

import 'package:ParallelNano_Bobby_Mobile/app/constants.dart';
import 'package:ParallelNano_Bobby_Mobile/app/error_handler.dart';
import 'package:ParallelNano_Bobby_Mobile/rest/sensor_data_retriever.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

//Based on https://pub.dev/packages/liquid_progress_indicator/example

class TemperatureIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _AnimatedLiquidLinearProgressIndicator();
  }
}

class _AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _AnimatedLiquidLinearProgressIndicatorState();
}

class _AnimatedLiquidLinearProgressIndicatorState
    extends State<_AnimatedLiquidLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  Timer _timer;
  double _currentTemperature;
  double _previousTemperature = 24.0;
  double _maximumTemperature = 75.0;

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
      child: Container(
          width: double.infinity,
          height: 75.0,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: FutureBuilder(
            future: _getCurrentTemperature(),
            builder: (context, sensorData) {
              if (sensorData.hasData) {
                return LiquidLinearProgressIndicator(
                  value: sensorData.data / _maximumTemperature,
                  backgroundColor: Colors.grey[10],
                  valueColor: AlwaysStoppedAnimation(
                      sensorData.data < temperature_threshold
                          ? Colors.green[800]
                          : Colors.red),
                  borderRadius: 12.0,
                  borderColor: Colors.grey,
                  borderWidth: 2.0,
                  center: Text(
                    "${sensorData.data.toStringAsFixed(0)}°",
                    style: TextStyle(
                      color: sensorData.data < temperature_threshold
                          ? Colors.green[300]
                          : Colors.red[200],
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              } else {
                return LiquidLinearProgressIndicator(
                  value: 0.0,
                  backgroundColor: Colors.grey[10],
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                  borderRadius: 12.0,
                  borderColor: Colors.grey,
                  borderWidth: 2.0,
                  center: Text(
                    "Loading...",
                    style: TextStyle(
                      color: Colors.red[200],
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
            },
          )),
    );
  }

  Future<double> _getCurrentTemperature() async {
    _currentTemperature = await SensorDataRetriever.getTemperature();
    if (_currentTemperature != wrong_sensor_value) {
      _previousTemperature = _currentTemperature;
      return _currentTemperature;
    } else {
      return _previousTemperature;
    }
  }

  void _callTimer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer t) {
        _counter++;
        if (_counter == 7) {
          if (_currentTemperature > _maximumTemperature)
            ErrorHandler.errorHighTemperature();
          setState(() {});
          _counter = 0;
        }
      },
    );
  }
}
