import 'package:flutter/material.dart';
import 'package:flutter_study/pages/packages/moor/components/diary_card.dart';
import 'package:flutter_study/pages/packages/moor/data/database.dart';
import 'package:flutter_study/pages/packages/moor/data/diary.dart';
import 'package:flutter_study/pages/packages/moor/write_screen.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class MoorPage extends StatefulWidget {
  const MoorPage({Key? key}) : super(key: key);

  @override
  State<MoorPage> createState() => _MoorPageState();
}

class _MoorPageState extends State<MoorPage> {
  @override
  void initState() {
    super.initState();

    if (!GetIt.instance.isRegistered<DiaryDao>()) {
      final db = MyDatabase();

      GetIt.instance.registerSingleton<DiaryDao>(DiaryDao(db));
    }
  }

  @override
  Widget build(BuildContext context) {
    final dao = GetIt.instance<DiaryDao>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Moor'),
      ),
      body: StreamBuilder<List<DiaryWithTagModel>>(
        stream: dao.streamDiariesWithTags(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;

            return ListView.separated(
              itemBuilder: (_, index) {
                final item = data[index];
                return DiaryCard(
                  title: item.diary.title,
                  content: item.diary.content,
                  tags: item.tags.map<String>((e) => e.name).toList(),
                  createdAt: item.diary.createdAt,
                );
              },
              separatorBuilder: (_, index) => const Divider(),
              itemCount: data.length,
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const WriteScreen());
        },
        child: const Icon(
          Icons.edit,
        ),
      ),
    );
  }
}
