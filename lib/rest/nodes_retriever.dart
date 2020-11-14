import 'dart:convert';

import 'package:ParallelNano_Bobby_Mobile/app/constants.dart';
import 'package:ParallelNano_Bobby_Mobile/app/error_handler.dart';
import 'package:ParallelNano_Bobby_Mobile/app/user_settings.dart';
import 'package:http/http.dart' as http;

/// A retriever that gets the queue from the server.
///
/// It sends http get requests and receives back the queue,
/// the current song or the current time depending on the
/// method that is called.
class NodesRetriever {
  static Future<List<dynamic>> getAvailableNodes() async {
    try {
      var response = await http.get(
        Uri.encodeFull('http://' + UserSettings().ipValue + nodes_url),
      );
      return jsonDecode(response.body)['/nodes_status'];
    } catch (errorNodes) {
      ErrorHandler.errorNodes();
      return [];
    }
  }
}
