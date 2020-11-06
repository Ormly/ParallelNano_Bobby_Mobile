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
  var currTemp = 24;
  var maxTemp = 50;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 75.0,
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: LiquidLinearProgressIndicator(
          value: currTemp / maxTemp,
          backgroundColor: Colors.grey[10],
          valueColor: AlwaysStoppedAnimation(Colors.red),
          borderRadius: 12.0,
          borderColor: Colors.grey,
          borderWidth: 2.0,
          center: Text(
            "${currTemp.toStringAsFixed(0)}°",
            style: TextStyle(
              color: Colors.red[200],
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
