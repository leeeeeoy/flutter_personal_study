// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Member _$$_MemberFromJson(Map<String, dynamic> json) => _$_Member(
      id: json['id'] as int,
      name: json['name'] as String,
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'team': instance.team,
    };

_$_Team _$$_TeamFromJson(Map<String, dynamic> json) => _$_Team(
      id: json['id'] as int,
      name: json['name'] as String,
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TeamToJson(_$_Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'company': instance.company,
    };

_$_Company _$$_CompanyFromJson(Map<String, dynamic> json) => _$_Company(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_CompanyToJson(_$_Company instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
