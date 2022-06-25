import 'package:flutter/material.dart';
import 'package:flutter_study/pages/state_management/riverpod/counter/counter_state_controller.dart';
import 'package:flutter_study/pages/state_management/riverpod/counter/counter_state_notifier_provider.dart';
import 'package:flutter_study/pages/state_management/riverpod/counter/counter_state_provider.dart';
import 'package:flutter_study/pages/state_management/riverpod/practice/practice_page.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app/pages/weather_home_page.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app_v2/pages/login_page.dart';
import 'package:get/get.dart';

class RiverpodPage extends StatelessWidget {
  const RiverpodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod list'),
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          spacing: 10.0,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(const ConterStateProvider());
              },
              child: const Text('ConterStateProvider'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(const ConterStateNotifierProvider());
              },
              child: const Text('ConterStateNotifierProvider'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(const CounterStateController());
              },
              child: const Text('ConterStateController'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(const WeatherHomePage());
              },
              child: const Text('Weather app'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(const LoginPage());
              },
              child: const Text('Weather app v2'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(const PracticePage());
              },
              child: const Text('Riverpod practice'),
            ),
          ],
        ),
      ),
    );
  }
}
