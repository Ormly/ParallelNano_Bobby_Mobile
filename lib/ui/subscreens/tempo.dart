import 'package:flutter/material.dart';

import 'package:ParallelNano_Bobby_Mobile/ui/widgets/home_screen/tempo_screen/humidity_indicator.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/widgets/home_screen/tempo_screen/temperature_indicator.dart';

class TempoSubscreen extends StatelessWidget {
  static const buttonPad = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15.0),
            Text(
              'System Temperature',
              style: DefaultTextStyle.of(context).style.apply(
                    fontSizeFactor: 1.4,
                    fontStyle: FontStyle.italic,
                  ),
            ),
            SizedBox(height: 15.0),
            TemperatureIndicator(),
            SizedBox(height: 15.0),
            Text(
              'System Humidity',
              style: DefaultTextStyle.of(context).style.apply(
                    fontSizeFactor: 1.4,
                    fontStyle: FontStyle.italic,
                  ),
            ),
            SizedBox(height: 15.0),
            HumidityIndicator(),
            SizedBox(height: 20.0),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(buttonPad, 0.0, buttonPad, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                width: double.infinity,
                child: MaterialButton(
                  child: Text('Power All On'),
                  onPressed: null,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(buttonPad, 0.0, buttonPad, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                width: double.infinity,
                child: MaterialButton(
                  child: Text('Power All Off'),
                  onPressed: null,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(buttonPad, 0.0, buttonPad, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                width: double.infinity,
                child: MaterialButton(
                  child: Text('Reset All'),
                  onPressed: null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
