import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySliverGrid extends StatelessWidget {
  const MySliverGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('${Get.size.width}');
    return SliverGrid(
      // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      //   maxCrossAxisExtent: 250,
      // ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index == 0) {
            Container(
              alignment: Alignment.center,
              height: 200,
              color: Colors.cyan[100 * (index % 9)],
              child: Text(
                'Grid Item ${index + 1}',
                style: const TextStyle(fontSize: 20),
              ),
            );
          } else if (index == 1) {
            return Container(
              alignment: Alignment.center,
              height: 180,
              color: Colors.cyan[100 * (index % 9)],
              child: Text(
                'Grid Item ${index + 1}',
                style: const TextStyle(fontSize: 20),
              ),
            );
          } else if (index == 2) {
            return Container(
              alignment: Alignment.center,
              height: 150,
              color: Colors.cyan[100 * (index % 9)],
              child: Text(
                'Grid Item ${index + 1}',
                style: const TextStyle(fontSize: 20),
              ),
            );
          }
          return Container(
            alignment: Alignment.center,
            color: Colors.cyan[100 * (index % 9)],
            child: Text(
              'Grid Item ${index + 1}',
              style: const TextStyle(fontSize: 20),
            ),
          );
        },
        childCount: 100,
      ),
    );
  }
}
