import 'dart:io';

import 'package:flutter_study/pages/packages/moor/data/diary.dart';
import 'package:flutter_study/pages/packages/moor/data/tag.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Diary, Tag, DiaryWithTag], daos: [DiaryDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  // 스키마 변경 시 버전을 올려준다
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        // 기존 버전 --> 현재 버전
        onUpgrade: (Migrator m, int from, int to) async {
          if (from == 1) {
            await m.createTable(tag);
            await m.createTable(diaryWithTag);
          }
        },

        // customConstrains를 사용할 때만 사용
        // 외래키를 사용할 때
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_key = ON');
        },
      );
}
