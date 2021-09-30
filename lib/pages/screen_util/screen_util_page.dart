import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilPage extends StatefulWidget {
  const ScreenUtilPage({Key? key}) : super(key: key);

  @override
  _ScreenUtilPageState createState() => _ScreenUtilPageState();
}

class _ScreenUtilPageState extends State<ScreenUtilPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(480, 900),
      builder: () => Scaffold(
        appBar: AppBar(
          title: Text('Screen Util'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                print(MediaQuery.of(context).size.height);
                print(MediaQuery.of(context).size.width);
                print(200.w);
                print(200.h);
                print(1.h);
                print(1.w);
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
