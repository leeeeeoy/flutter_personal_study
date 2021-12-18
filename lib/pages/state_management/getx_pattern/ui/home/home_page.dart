import 'package:flutter/material.dart';
import 'package:flutter_study/pages/state_management/getx_pattern/controller/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetX<HomeController>(initState: (state) {
          Get.find<HomeController>().getAll();
        }, builder: (_) {
          return _.postList.length < 1
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_.postList[index].title ?? 'a'),
                      subtitle: Text(_.postList[index].body ?? 'b'),
                      onTap: () => _.details(_.postList[index]),
                    );
                  },
                  itemCount: _.postList.length,
                );
        }),
      ),
    );
  }
}
