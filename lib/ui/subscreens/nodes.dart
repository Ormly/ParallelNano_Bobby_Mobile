import 'package:ParallelNano_Bobby_Mobile/ui/widgets/nodes_screen/nodes_list_widget.dart';
import 'package:flutter/material.dart';

// TODO button to manually remove node

class NodesSubscreen extends StatelessWidget {
  static const _buttonPad = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            /* SliverToBoxAdapter(
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Node List',
                    /* style: TextStyle(

                      fontSize: 20.0,
                    ), */
                  ),
                ),
              ),
            ), */
            NodesListWidget(),
            /* SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: _buttonPad,
                  left: _buttonPad,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  width: double.infinity,
                  child: MaterialButton(
                    child: Text('Power All On'),
                    onPressed: () => NodesHandler.saveNodesList(),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: _buttonPad,
                  left: _buttonPad,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  width: double.infinity,
                  child: MaterialButton(
                    child: Text('Power All Off'),
                    onPressed: () => NodesHandler.printOfflineNodes(),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: _buttonPad,
                  left: _buttonPad,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  width: double.infinity,
                  child: MaterialButton(
                    child: Text('Reset All'),
                    onPressed: () => NodesHandler.printSavedNodes(),
                  ),
                ),
              ),
            ),
            //TODO: Remove this button
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: _buttonPad,
                  left: _buttonPad,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  width: double.infinity,
                  child: MaterialButton(
                    child: Text('Print Nodes Status'),
                    onPressed: () => NodesHandler.printNodesStatus(),
                  ),
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
