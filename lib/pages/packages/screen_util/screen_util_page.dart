import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilPage extends StatefulWidget {
  const ScreenUtilPage({Key? key}) : super(key: key);

  @override
  State<ScreenUtilPage> createState() => _ScreenUtilPageState();
}

class _ScreenUtilPageState extends State<ScreenUtilPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(480, 900),
      builder: () => Scaffold(
        appBar: AppBar(
          title: const Text('Screen Util'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                log('${MediaQuery.of(context).size.height}');
                log('${MediaQuery.of(context).size.width}');
                log('${200.w}');
                log('${200.h}');
                log('${1.h}');
                log('${1.w}');
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            ),
            Container(
              width: 200.w,
              height: 200.h,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
