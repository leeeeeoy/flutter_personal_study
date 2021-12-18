import 'package:dio/dio.dart';
import 'package:flutter_study/pages/packages/dio/data.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://reqres.in/api')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/users/{id}')
  Future<User> getUser({@Path() required int id});
}
