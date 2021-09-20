import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.g.dart';
part 'student.freezed.dart';

@freezed
class Student with _$Student {
  factory Student({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'is_like_flutter') required bool isLikeFlutter,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}
