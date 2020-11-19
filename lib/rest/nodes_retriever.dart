import 'dart:convert';

import 'package:ParallelNano_Bobby_Mobile/app/constants.dart';
import 'package:ParallelNano_Bobby_Mobile/app/error_handler.dart';
import 'package:ParallelNano_Bobby_Mobile/app/ip_settings.dart';
import 'package:http/http.dart' as http;

/// A retriever that gets the nodes from the server.
///
/// It sends an [http.get] request and receives back the nodes' status.
class NodesRetriever {
  static Future<List<dynamic>> getAvailableNodes() async {
    try {
      var response = await http.get(
        Uri.encodeFull('http://' + IPSettings().ipValue + nodes_url),
      );
      return jsonDecode(response.body)['/nodes_status'];
    } catch (errorNodes) {
      ErrorHandler.errorNodes();
      return [];
    }
  }
}
