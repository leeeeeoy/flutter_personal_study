import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/pages/dio/custom_log_interceptor.dart';
import 'package:flutter_study/pages/dio/data.dart';
import 'package:flutter_study/pages/dio/rest_client.dart';

//  테스트 API
//  https://reqres.in/

class DioResultPage extends StatelessWidget {
  DioResultPage({Key? key}) : super(key: key);
  final dio = Dio()
    ..interceptors.add(
      CustomLogInterceptor(),
    );

  @override
  Widget build(BuildContext context) {
    final _client = RestClient(dio);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dio'),
      ),
      body: Center(
        child: FutureBuilder<User?>(
          future: _client.getUser(id: 1),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              User? userInfo = snapshot.data;
              if (userInfo != null) {
                Data userData = userInfo.data;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(userData.avatar),
                    SizedBox(height: 16.0),
                    Text(
                      '${userInfo.data.firstName} ${userInfo.data.lastName}',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    Text(
                      userData.email,
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ],
                );
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
