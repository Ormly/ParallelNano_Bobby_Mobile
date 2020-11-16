import 'dart:convert';

import 'package:ParallelNano_Bobby_Mobile/app/nodes_handler.dart';
import 'package:ParallelNano_Bobby_Mobile/app/user_settings.dart';
import 'package:flutter/material.dart';

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
  final List<String> mockNodesData = [
    '{"cpu":"aarch64","cpu_usage":1.2,"gpu":"0.4","hostname":"Johnny01","ip_address":"192.168.31.84","mem_usage":10.2,"platform":"Linux-4.9.140-tegra-aarch64-with-Ubuntu-18.04-bionic","system":"Linux","timestamp":1605392670.0374324}',
    '{"cpu":"aarch64","cpu_usage":0.0,"gpu":"1.1","hostname":"Johnny02","ip_address":"192.168.31.99","mem_usage":10.2,"platform":"Linux-4.9.140-tegra-aarch64-with-Ubuntu-18.04-bionic","system":"Linux","timestamp":1605392113.5886502}',
    '{"cpu":"aarch64","cpu_usage":1.0,"gpu":"0.5","hostname":"Johnny03","ip_address":"192.168.31.73","mem_usage":10.3,"platform":"Linux-4.9.140-tegra-aarch64-with-Ubuntu-18.04-bionic","system":"Linux","timestamp":1605392113.5886502}',
    '{"cpu":"aarch64","cpu_usage":0.0,"gpu":"0.5","hostname":"Johnny04","ip_address":"192.168.31.21","mem_usage":10.2,"platform":"Linux-4.9.140-tegra-aarch64-with-Ubuntu-18.04-bionic","system":"Linux","timestamp":1605392113.5886502}',
    '{"cpu":"aarch64","cpu_usage":2.0,"gpu":"0.4","hostname":"Johnny05","ip_address":"192.168.31.56","mem_usage":10.2,"platform":"Linux-4.9.140-tegra-aarch64-with-Ubuntu-18.04-bionic","system":"Linux","timestamp":1605392113.5886502}',
    '{"cpu":"aarch64","cpu_usage":0.0,"gpu":"1.3","hostname":"Johnny06","ip_address":"192.168.31.98","mem_usage":10.2,"platform":"Linux-4.9.140-tegra-aarch64-with-Ubuntu-18.04-bionic","system":"Linux","timestamp":1605392113.5886502}'
  ];

  NodesInformationWidget(this.nodeIndex);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NodesHandler.getSavedNodesList(),
      builder: (context, nodesInformation) {
        if (nodesInformation.hasData) {
          return AlertDialog(
            title: Text('${jsonDecode(mockNodesData[nodeIndex])['hostname']}'
                /* '${jsonDecode(nodesInformation.data[nodeIndex])['hostname']}' */),
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
                            '${jsonDecode(mockNodesData[nodeIndex])[nodeAttributes[index]]}'
                            /* '${jsonDecode(nodesInformation.data[nodeIndex])[nodeAttributes[index]]}' */),
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
                      UserSettings().removeNode(nodeIndex),
                      print(UserSettings().mockNodesInfoList[1][4]),
                      //NodesHandler.removeNode(nodeIndex),
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
