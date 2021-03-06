import 'package:flutter/material.dart';
import 'package:flutter_study/pages/packages/moor/data/database.dart';
import 'package:flutter_study/pages/packages/moor/data/diary.dart';
import 'package:get/get.dart' hide Value;
import 'package:get_it/get_it.dart';
import 'package:moor/moor.dart' hide Column;

class WriteScreen extends StatefulWidget {
  const WriteScreen({Key? key}) : super(key: key);

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? title;
  String? content;
  String? tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Write Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              renderTextFields(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          if (content != null && title != null) {
                            final dao = GetIt.instance<DiaryDao>();
                            dao.insertDiary(
                              DiaryCompanion(
                                title: Value(title!),
                                content: Value(content!),
                              ),
                              tag!,
                            );
                            Get.back();
                          }
                        }
                      },
                      child: const Text('저장하기'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  renderTextFields() {
    return Expanded(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: '제목',
            ),
            onSaved: (val) {
              title = val;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '내용',
            ),
            maxLines: 10,
            onSaved: (val) {
              content = val;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '태그',
            ),
            onSaved: (val) {
              tag = val;
            },
          ),
        ],
      ),
    );
  }
}
