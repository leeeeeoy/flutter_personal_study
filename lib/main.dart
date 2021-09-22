import 'package:flutter/material.dart';
import 'package:flutter_study/pages/getx_pattern/binding/home_binding.dart';
import 'package:flutter_study/pages/getx_pattern/route/app_pages.dart';
import 'package:flutter_study/pages/getx_pattern/ui/home/home_page.dart';
import 'package:flutter_study/routes/route.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
