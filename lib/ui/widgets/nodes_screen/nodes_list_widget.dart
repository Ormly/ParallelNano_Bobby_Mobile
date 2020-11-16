import 'dart:async';

import 'package:ParallelNano_Bobby_Mobile/app/nodes_handler.dart';
import 'package:ParallelNano_Bobby_Mobile/app/user_settings.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/widgets/nodes_screen/nodes_information_widget.dart';
import 'package:flutter/material.dart';

class NodesListWidget extends StatefulWidget {
  @override
  _NodesListWidgetState createState() => _NodesListWidgetState();

  static Future<List<List<String>>> _getNodesInfoList() async {
    await NodesHandler.checkNewNodes();
    List<List<String>> nodesInfoList = new List(2);
    nodesInfoList[0] = await NodesHandler.getSavedNodesNameList();
    nodesInfoList[1] = await NodesHandler.getNodesStatusList();
    return nodesInfoList;
  }
}

class _NodesListWidgetState extends State<NodesListWidget> {
  int _counter = 0;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _callTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NodesListWidget._getNodesInfoList(),
      builder: (context, nodesInfoList) {
        if (nodesInfoList.hasData) {
          return SliverPadding(
            padding: EdgeInsets.all(10.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    color: Colors.white10,
                    child: ListTile(
                      leading: UserSettings().mockNodesInfoList[1][index] ==
                              'on' /* nodesInfoList.data[1][index] == 'on' */
                          ? Icon(Icons.link)
                          : Icon(Icons.link_off),
                      title: Text(
                          "${UserSettings().mockNodesInfoList[0][index]}" /* "${nodesInfoList.data[0][index]}" */),
                      subtitle: Text(
                        "${UserSettings().mockNodesInfoList[1][index]}"
                        /* "${nodesInfoList.data[1][index]}" */,
                        style: DefaultTextStyle.of(context).style.apply(
                              color: UserSettings().mockNodesInfoList[1]
                                          [index] ==
                                      'on' /* nodesInfoList.data[1][index] == 'on' */
                                  ? Colors.green
                                  : Colors.red,
                            ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        /*NodesHandler.updateNodeInformation(
                            nodesInfoList.data[0][index]);*/
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              NodesInformationWidget(index),
                        );
                      },
                    ),
                  );
                },
                childCount: UserSettings()
                    .mockNodesInfoList[0]
                    .length /* nodesInfoList.data[0].length */,
              ),
            ),
          );
        } else {
          return SliverPadding(
            padding: EdgeInsets.all(10.0),
            sliver: SliverToBoxAdapter(
              child: Text('Loading...'),
            ),
          );
        }
      },
    );
  }

  void _callTimer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer t) {
        _counter++;
        if (_counter == 1) {
          setState(() {});
          _counter = 0;
        }
      },
    );
  }
}
