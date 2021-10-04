import 'package:flutter/material.dart';
import 'package:flutter_study/pages/riverpod/counter/counter_state_controller.dart';
import 'package:flutter_study/pages/riverpod/counter/counter_state_notifier_provider.dart';
import 'package:flutter_study/pages/riverpod/counter/counter_state_provider.dart';
import 'package:flutter_study/pages/riverpod/weather_app/pages/weather_home_page.dart';
import 'package:get/get.dart';

class RiverpodPage extends StatelessWidget {
  const RiverpodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod list'),
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          spacing: 10.0,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(ConterStateProvider());
              },
              child: Text('ConterStateProvider'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(ConterStateNotifierProvider());
              },
              child: Text('ConterStateNotifierProvider'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(CounterStateController());
              },
              child: Text('ConterStateController'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(WeatherHomePage());
              },
              child: Text('Weather app'),
            ),
          ],
        ),
      ),
    );
  }
}
