import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySliverGrid extends StatelessWidget {
  const MySliverGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.size.width);
    return SliverGrid(
      // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      //   maxCrossAxisExtent: 250,
      // ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.cyan[100 * (index % 9)],
            child: Text(
              'Grid Item ${index + 1}',
              style: TextStyle(fontSize: 20),
            ),
          );
        },
        childCount: 100,
      ),
    );
  }
}
