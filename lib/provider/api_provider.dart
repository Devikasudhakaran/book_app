import 'dart:convert';

import 'package:http/http.dart' as http;


import '../model_class/listview_response.dart';

class Service {
  Future<List<UsersList>?> getList() async {
    print('service1');
    var client = http.Client();

    var uri = 'https://jsonplaceholder.typicode.com/posts';
    var url = Uri.parse(uri);

    var response = await client.get(url);
    var json = response.body;
    print(response.body);

    if (response.statusCode == 200) {
      print('service2');
      // Parse the JSON string to a List
      var decodedJson = jsonDecode(json) as List<dynamic>;
      // Map each item in the list to UsersList
      var usersList = decodedJson.map((jsonItem) => UsersList.fromJson(jsonItem)).toList();

      return usersList;
    }
  }

}
