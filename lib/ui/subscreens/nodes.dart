import 'package:ParallelNano_Bobby_Mobile/ui/widgets/nodes_screen/nodes_list_widget.dart';
import 'package:flutter/material.dart';

class NodesSubscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            NodesListWidget(),
          ],
        ),
      ),
    );
  }
}
