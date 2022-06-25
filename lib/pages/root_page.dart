import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('목록'),
        centerTitle: true,
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          spacing: 10.0,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/retrofit');
              },
              child: const Text('Retrofit'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/freezed');
              },
              child: const Text('Freezed'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/retrofit_with_freezed');
              },
              child: const Text('Retrofit with Freezed'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/sliverappbar');
              },
              child: const Text('SliverAppbar'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/bottomnavigation');
              },
              child: const Text('BottomNavigation'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/getx_pattern');
              },
              child: const Text('Getx_pattern'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/infinite');
              },
              child: const Text('Infinite Scroll'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/bloc');
              },
              child: const Text('Bloc pattern'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/multi_scroll');
              },
              child: const Text('Multi Scroll'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/screen_util');
              },
              child: const Text('Screen Util'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/filtering');
              },
              child: const Text('Filtering'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/shared_preferences');
              },
              child: const Text('Shared preferences'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/moor');
              },
              child: const Text('Moor'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/grid_view');
              },
              child: const Text('GridView'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/riverpod');
              },
              child: const Text('Riverpod'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/dio');
              },
              child: const Text('Dio'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/stream');
              },
              child: const Text('Stream'),
            ),
            ElevatedButton(
                onPressed: () => Get.toNamed('/list_view'), child: const Text('ListView')),
            ElevatedButton(onPressed: () => Get.toNamed('/text'), child: const Text('TextStyle')),
          ],
        ),
      ),
    );
  }
}
