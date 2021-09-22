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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              onPressed: null,
              child: null,
            ),
          ],
        ),
      ),
    );
  }
}
