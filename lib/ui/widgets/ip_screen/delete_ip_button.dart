import 'package:flutter/material.dart';

class DeleteIPButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      width: double.infinity,
      child: MaterialButton(
        child: Text('Delete IP'),
        onPressed: null,
      ),
    );
  }
}
