import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app_v2/pages/login_page.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app_v2/pages/search_page.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app_v2/pages/settings_page.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app_v2/providers/provider.dart';
import 'package:get/get.dart';

class WeatherHomePageV2 extends ConsumerStatefulWidget {
  const WeatherHomePageV2({Key? key}) : super(key: key);

  @override
  ConsumerState<WeatherHomePageV2> createState() => _WeatherHomePageV2State();
}

class _WeatherHomePageV2State extends ConsumerState<WeatherHomePageV2> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 0), () {
      log('init state');
      ref.read(cityProvider).state = 'seoul';
      ref.read(currentWeatherProvider.notifier).fetchWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(weatherStateProvider, (WeatherState weather) {
      log('>>> In onChange <<<');
      if (weather.error != null && weather.error!.isNotEmpty) {
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(weather.error!),
            );
          },
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather V2'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              await ref.read(authProvider.notifier).logout();
              Get.to(const LoginPage());
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Get.to(const SettingsPage());
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              ref.read(cityProvider).state = (await Get.to<String>(const SearchPage()))!;

              log('City: ${ref.read(cityProvider).state}');

              await ref.watch(currentWeatherProvider.notifier).fetchWeather();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(currentWeatherProvider.notifier).fetchWeather();
        },
        child: buildBody(
          context: context,
          weatherState: ref.watch(weatherStateProvider),
          tempUnit: ref.watch(settingsProvider).state,
        ),
      ),
    );
  }

  Widget buildBody({
    required BuildContext context,
    required WeatherState weatherState,
    required TemperatureUnit tempUnit,
  }) {
    if (weatherState == CurrentWeather.initialWeatherState) {
      return const Center(
        child: Text(
          'Select a city',
          style: TextStyle(fontSize: 18.0),
        ),
      );
    }

    if (weatherState.loading!) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (weatherState.weather == null) {
      return const Center(
        child: Text(
          'Select a city',
          style: TextStyle(fontSize: 18.0),
        ),
      );
    }

    return ListView(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 6),
        Text(
          weatherState.weather!.city,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          '시각: ${TimeOfDay.fromDateTime(weatherState.weather!.lastUpdated).format(context)}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18.0),
        ),
        const SizedBox(height: 60.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              calculateTemp(tempUnit, weatherState.weather!.theTemp),
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Max: ${calculateTemp(tempUnit, weatherState.weather!.maxTemp)}',
                  style: const TextStyle(fontSize: 16.0),
                ),
                Text(
                  'Min: ${calculateTemp(tempUnit, weatherState.weather!.minTemp)}',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        Text(
          weatherState.weather!.weatherStateName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32.0,
          ),
        )
      ],
    );
  }

  String calculateTemp(TemperatureUnit tempUnit, double temp) {
    if (tempUnit == TemperatureUnit.fahrenheit) {
      return '${((temp * 9 / 5) + 32).toStringAsFixed(2)}℉';
    }
    return '${temp.toStringAsFixed(2)}℃';
  }
}
