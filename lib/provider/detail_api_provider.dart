import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model_class/detaild_response.dart';

class Service2 {
  Future<Map<String, dynamic>?> getDetails(int userId) async {
    print('service4');
    var client = http.Client();

    var uri = 'https://jsonplaceholder.typicode.com/posts/$userId';
    var url = Uri.parse(uri);

    var response = await client.get(url);
    var json = response.body;
    print(json);

    if (response.statusCode == 200) {
      print('service5');
      // Parse the JSON string to a List

      var decodedJson = jsonDecode(json);
      // Map each item in the list to UsersList
      Future<DetailedView> detailedView = decodedJson;

      return decodedJson;
    }else{
      return null;
    }
  }

}