import 'dart:convert';

import 'package:ParallelNano_Bobby_Mobile/app/nodes_handler.dart';
import 'package:ParallelNano_Bobby_Mobile/rest/nodes_retriever.dart';
import 'package:flutter/material.dart';

class NodesInformationWidget extends StatelessWidget {
  final int nodeIndex;
  final List<String> nodeAttributes = ['cpu_usage', 'gpu', 'timestamp'];
  final List<String> nodeAttributesToDisplay = [
    'CPU Usage: ',
    'GPU Usage: ',
    'TimeStamp: '
  ];

  NodesInformationWidget(this.nodeIndex);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: //NodesRetriever.getAvailableNodes(),
          NodesHandler.getSavedNodesList(),
      //TODO: crear funcion que actualice los valores.
      builder: (context, nodesInformation) {
        if (nodesInformation.hasData) {
          return AlertDialog(
            title: // Text('hola'),
                Text(
                    '${jsonDecode(nodesInformation.data[nodeIndex])['hostname']}'),
            content: Column(
              children: [
                /* SliverPadding(
                  padding: EdgeInsets.all(1.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return ListTile(
                        title:
                            Text('${nodesInformation.data[nodeIndex][index]}'),
                      );
                    }),
                  ),
                ), */

                Container(
                  height: 300,
                  width: 300,
                  child: ListView.builder(
                    itemCount: nodeAttributes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(nodeAttributesToDisplay[index]),
                        subtitle: //Text('hola')
                            Text(
                                '${jsonDecode(nodesInformation.data[nodeIndex])[nodeAttributes[index]]}'),
                      );
                    },
                  ),
                ),
                TextButton(
                  onPressed: () => print(jsonDecode(nodesInformation.data[1])[
                      nodeAttributes[
                          0]]), //null, //() => Navigator.pop(context),
                  //print(nodesInformation.data[nodeIndex].runtimeType),
                  child: Text('Boton'),
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
