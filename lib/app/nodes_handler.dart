import 'dart:convert';

import 'package:ParallelNano_Bobby_Mobile/app/constants.dart';
import 'package:ParallelNano_Bobby_Mobile/rest/nodes_retriever.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A retriever that gets the queue from the server.
///
/// It sends http get requests and receives back the queue,
/// the current song or the current time depending on the
/// method that is called.
class NodesHandler {
  static Future<List<String>> getOfflineNodesList() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> nodesList = prefs.getStringList(nodes_list_key) ?? [];
    List<dynamic> responseList = await NodesRetriever.getAvailableNodes();
    List<String> offlineNodeList = [];
    nodesList.forEach((element) {
      if (!responseList.toString().contains(jsonDecode(element)['hostname']))
        offlineNodeList.add(jsonDecode(element)['hostname']);
    });
    return offlineNodeList;
  }

  static Future<List<String>> getSavedNodesNameList() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> nodesList = prefs.getStringList(nodes_list_key) ?? [];
    List<String> savedNodeList = [];
    nodesList.forEach((element) {
      savedNodeList.add(jsonDecode(element)['hostname']);
    });
    return savedNodeList;
  }

  static Future<List<String>> getNodesStatusList() async {
    final savedNodeList = await getSavedNodesNameList();
    final offlineNodeList = await getOfflineNodesList();
    List<String> nodesStatusList = [];
    savedNodeList.forEach((element) {
      nodesStatusList.add('on');
    });
    for (int i = 0; i < savedNodeList.length; i++) {
      if (offlineNodeList.contains(savedNodeList[i]))
        nodesStatusList[i] = 'off';
    }
    return nodesStatusList;
  }

  static Future<List<String>> getSavedNodesList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(nodes_list_key) ?? [];
  }

  static updateNodeInformation(String nodeName) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedNodeList = await getSavedNodesList();
    List<dynamic> responseList = await NodesRetriever.getAvailableNodes();
    var newElement;
    responseList.forEach((element) {
      if (element['hostname'] == nodeName) {
        newElement = element;
      }
    });
    if (newElement == null) {
      return;
    }
    savedNodeList.forEach((element) {
      var decodedElement = jsonDecode(element);
      if (decodedElement['hostname'] == nodeName) {
        int elementIndex = savedNodeList.indexOf(element);
        savedNodeList.removeAt(elementIndex);
        savedNodeList.insert(elementIndex, jsonEncode(newElement));
      }
    });
    prefs.setStringList(nodes_list_key, savedNodeList);
  }

  static checkNewNodes() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedNodeList = await getSavedNodesList();
    List<dynamic> responseList = await NodesRetriever.getAvailableNodes();
    responseList.forEach((element) {
      if (!savedNodeList.toString().contains(element['hostname'])) {
        savedNodeList.add(jsonEncode(element));
      }
    });
    prefs.setStringList(nodes_list_key, savedNodeList);
  }

  static removeNode(int nodeIndex) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedNodeList = await getSavedNodesList();
    savedNodeList.removeAt(nodeIndex);
    prefs.setStringList(nodes_list_key, savedNodeList);
  }
}
