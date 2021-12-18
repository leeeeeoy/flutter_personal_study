import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('목록'),
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
              child: Text('Retrofit'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/freezed');
              },
              child: Text('Freezed'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/retrofit_with_freezed');
              },
              child: Text('Retrofit with Freezed'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/sliverappbar');
              },
              child: Text('SliverAppbar'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/bottomnavigation');
              },
              child: Text('BottomNavigation'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/getx_pattern');
              },
              child: Text('Getx_pattern'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/infinite');
              },
              child: Text('Infinite Scroll'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/bloc');
              },
              child: Text('Bloc pattern'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/multi_scroll');
              },
              child: Text('Multi Scroll'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/screen_util');
              },
              child: Text('Screen Util'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/filtering');
              },
              child: Text('Filtering'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/shared_preferences');
              },
              child: Text('Shared preferences'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/moor');
              },
              child: Text('Moor'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/grid_view');
              },
              child: Text('GridView'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/riverpod');
              },
              child: Text('Riverpod'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/dio');
              },
              child: Text('Dio'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/stream');
              },
              child: Text('Stream'),
            ),
            ElevatedButton(
                onPressed: () => Get.toNamed('/list_view'),
                child: Text('ListView')),
          ],
        ),
      ),
    );
  }
}
