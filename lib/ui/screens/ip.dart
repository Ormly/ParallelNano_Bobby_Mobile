import 'package:flutter/material.dart';

import 'package:ParallelNano_Bobby_Mobile/ui/widgets/ip_screen/add_ip_button.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/widgets/ip_screen/connect_button.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/widgets/ip_screen/delete_ip_button.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/widgets/ip_screen/ip_list.dart';

//TODO: the whole thing and comment

class IPScreen extends StatelessWidget {
  static const buttonPad = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IpList(),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: buttonPad,
                    right: buttonPad,
                  ),
                  child: AddIPButton(),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: buttonPad,
                    right: buttonPad,
                  ),
                  child: DeleteIPButton(),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: buttonPad,
                    right: buttonPad,
                  ),
                  child: ConnectButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
