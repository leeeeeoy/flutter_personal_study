import 'package:flutter/material.dart';
import 'package:flutter_study/pages/filtering/user_controller.dart';
import 'package:get/get.dart';

class FilteringPage extends StatefulWidget {
  const FilteringPage({Key? key}) : super(key: key);

  @override
  State<FilteringPage> createState() => _FilteringPageState();
}

class _FilteringPageState extends State<FilteringPage> {
  final controller = Get.put<UserController>(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtering'),
      ),
      body: GetBuilder(
        init: controller,
        builder: (_) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${controller.users[0].isLikeFlutter}',
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                '${controller.users[1].isLikeFlutter}',
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                '${controller.users[2].isLikeFlutter}',
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.toggleUser();
        },
      ),
    );
  }
}
