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
  var currHumidity = 60;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150.0,
        height: 150.0,
        child: LiquidCircularProgressIndicator(
          value: currHumidity / 100,
          backgroundColor: Colors.grey[10],
          borderColor: Colors.grey,
          borderWidth: 2.0,
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          center: Text(
            '${currHumidity.toStringAsFixed(0)}%',
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
