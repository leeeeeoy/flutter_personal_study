import 'dart:developer';
import 'dart:convert';

import 'package:flutter_study/pages/state_management/getx_pattern/data/model/model.dart';
import 'package:http/http.dart' as http;

var baseUrl = Uri.parse('https://jsonplaceholder.typicode.com/posts/');

class MyApiClient {
  final http.Client httpClient;
  MyApiClient({
    required this.httpClient,
  });

  getAll() async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<MyModel> listMyModel = jsonResponse.map((model) => MyModel.fromJson(model)).toList();
        return listMyModel;
      } else {
        log('erro');
      }
    } catch (_) {
      log('$_');
    }
  }
}
