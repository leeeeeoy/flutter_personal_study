import 'package:dio/dio.dart';
import 'package:flutter_study/pages/retrofit_with_freezed/student.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://localhost:8080')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/student')
  Future<List<Student>> getStudents();

  @GET('/student/{id}')
  Future<Student> getStudentByID(@Path() int id);
}
