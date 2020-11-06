import 'package:flutter/material.dart';

import 'package:ParallelNano_Bobby_Mobile/ui/screens/home.dart';

class ConnectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      width: double.infinity,
      child: MaterialButton(
        child: Text('Connect'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
      ),
    );
  }
}
