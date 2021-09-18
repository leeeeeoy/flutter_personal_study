import 'package:dio/dio.dart';
import 'package:flutter_study/pages/retrofit/news.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://hacker-news.firebaseio.com/v0')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/beststories.json')
  Future<List<int>> getNewsIDs();

  @GET('/item/{id}.json')
  Future<News> getNewsDetail(@Path() int id);
}
