import 'package:flutter/material.dart';

import 'package:ParallelNano_Bobby_Mobile/ui/widgets/tempo_screen/humidity_indicator.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/widgets/tempo_screen/temperature_indicator.dart';

import 'package:weather_icons/weather_icons.dart';

//TODO manually set alarm and power of if temperature and humidity

class TempoSubscreen extends StatelessWidget {
  final int currentTemperature = 51;
  final int currentHumidity = 81;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /* Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  /* Row(
                    children: [
                      Expanded(
                        child: Center(child: Text('Temperature')),
                      ),
                      Expanded(
                        child: Center(child: Text('Humidity')),
                      )
                    ],
                  ), */
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (() {
                                if (currentTemperature < 10) {
                                  return Colors.indigo[200];
                                } else if (currentTemperature < 50) {
                                  return Colors.green;
                                } else {
                                  return Colors.red;
                                }
                              }())),
                          child: Container(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Icon(WeatherIcons.thermometer),
                                  iconSize: 40.0,
                                  onPressed: null,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text('Temperature'),
                                Center(
                                    child: Text(
                                  currentTemperature.toString() + '°C',
                                  style: TextStyle(fontSize: 30.0),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentHumidity < 80
                                ? Colors.blue
                                : Colors.blue[900],
                            border: Border.all(color: Colors.black),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Icon(WeatherIcons.humidity),
                                  iconSize: 40.0,
                                  onPressed: null,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text('Humidity'),
                                Center(
                                    child: Text(
                                  currentHumidity.toString() + '%',
                                  style: TextStyle(fontSize: 30.0),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ), */
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
