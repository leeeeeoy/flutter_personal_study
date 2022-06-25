import 'dart:developer';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.g.dart';
part 'member.freezed.dart';

@freezed
class Member with _$Member {
  @Assert('name.length < 6', '이름은 5글자 이하로 작성해주세요.')
  factory Member({
    required int id,
    required String name,
    required Team team,
  }) = _Member;

  // Custom getter or method 작성을 위해 필요
  Member._();

  get nameLength => name.length;

  void hello() {
    log('Member의 Custom method 입니다.');
  }

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}

@freezed
class Team with _$Team {
  factory Team({
    required int id,
    required String name,
    required Company company,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}

@freezed
class Company with _$Company {
  factory Company({
    required int id,
    required String name,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}
