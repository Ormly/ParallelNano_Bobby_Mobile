import 'package:flutter/material.dart';

import 'package:ParallelNano_Bobby_Mobile/ui/subscreens/nodes.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/subscreens/tempo.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/widgets/settings.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _iconSize = 20.0;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            elevation: 2.0,
            bottom: TabBar(
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.ac_unit,
                  size: _iconSize,
                )),
                Tab(
                    icon: Icon(
                  Icons.device_hub,
                  size: _iconSize,
                )),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: TempoSubscreen(),
            ),
            Center(
              child: NodesSubscreen(),
            ),
          ],
        ),
        floatingActionButton: Container(
          child: Settings(),
        ),
      ),
    );
  }
}
