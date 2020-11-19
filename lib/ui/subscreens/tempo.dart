import 'package:flutter/material.dart';

import 'package:ParallelNano_Bobby_Mobile/ui/widgets/tempo_screen/humidity_indicator.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/widgets/tempo_screen/temperature_indicator.dart';

/// A stateless screen that renders the temperature and humidity screen.
class TempoSubscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 60.0),
            Text(
              'Temperature',
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
            SizedBox(height: 15.0),
            TemperatureIndicator(),
            SizedBox(height: 45.0),
            Text(
              'Humidity',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            SizedBox(height: 15.0),
            HumidityIndicator(),
          ],
        ),
      ),
    );
  }
}
