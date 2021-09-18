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
              onPressed: null,
              child: null,
            ),
          ],
        ),
      ),
    );
  }
}
