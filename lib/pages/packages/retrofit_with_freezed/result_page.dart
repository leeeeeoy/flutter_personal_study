import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/pages/packages/retrofit_with_freezed/rest_client.dart';
import 'package:flutter_study/pages/packages/retrofit_with_freezed/student.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late RestClient client;
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    client = RestClient(dio);
  }

  studentColumn(Student student) {
    return Column(
      children: [
        Text('${student.id}'),
        Text(student.name),
        Text(student.email),
        Text('${student.isLikeFlutter}'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrofit with Freezed'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('getStudents'),
            FutureBuilder(
              future: client.getStudents(),
              initialData: const [],
              builder: (_, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<Student> students = snapshot.data;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    studentColumn(students[0]),
                    studentColumn(students[1]),
                    studentColumn(students[2]),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            const Text('getStudentByID'),
            FutureBuilder(
              future: client.getStudentByID(1),
              builder: (_, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final Student student = snapshot.data;
                return studentColumn(student);
              },
            ),
          ],
        ),
      ),
    );
  }
}
