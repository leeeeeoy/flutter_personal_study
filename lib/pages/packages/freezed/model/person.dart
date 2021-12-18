import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  factory Person({
    required int id,
    required String name,
    required int age,
    required int statusCode,
  }) = _Person;

  factory Person.loading({required int statusCode}) = _Loading;

  factory Person.error(String message, {required int statusCode}) = _Error;
}
