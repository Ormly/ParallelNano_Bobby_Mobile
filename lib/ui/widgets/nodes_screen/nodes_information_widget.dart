import 'dart:convert';

import 'package:ParallelNano_Bobby_Mobile/app/nodes_handler.dart';
import 'package:flutter/material.dart';

/// A stateless widget that renders the node details.
class NodesInformationWidget extends StatelessWidget {
  final int nodeIndex;
  final List<String> nodeAttributes = [
    'gpu',
    'cpu_usage',
    'mem_usage',
    'ip_address'
  ];
  final List<String> nodeAttributesToDisplay = [
    'GPU Usage: ',
    'CPU Usage: ',
    'Memory Usage: ',
    'IP Address: '
  ];

  NodesInformationWidget(this.nodeIndex);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NodesHandler.getSavedNodesList(),
      builder: (context, nodesInformation) {
        if (nodesInformation.hasData) {
          return AlertDialog(
            title: Text(
                '${jsonDecode(nodesInformation.data[nodeIndex])['hostname']}'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  child: ListView.builder(
                    itemCount: nodeAttributes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(nodeAttributesToDisplay[index]),
                        subtitle: Text(
                            '${jsonDecode(nodesInformation.data[nodeIndex])[nodeAttributes[index]]}'),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Close'),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: MaterialButton(
                    onPressed: () => {
                      NodesHandler.removeNode(nodeIndex),
                      Navigator.pop(context),
                    },
                    child: Text('Remove Node'),
                  ),
                ),
              ],
            ),
          );
        } else {
          return AlertDialog(title: Text('Loading...'));
        }
      },
    );
  }
}
