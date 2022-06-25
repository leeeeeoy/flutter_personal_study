import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app/pages/search_page.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app/pages/settings_page.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app/providers/provider.dart';
import 'package:get/get.dart';

class WeatherHomePage extends ConsumerWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cwp = ref.watch(currentWeatherProvider.notifier);

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
        title: const Text('Weather'),
        actions: [
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

              await cwp.fetchWeather();
            },
          ),
        ],
      ),
      body: buildBody(
        context: context,
        weatherState: ref.watch(weatherStateProvider),
        tempUnit: ref.watch(settingsProvider).state,
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
          TimeOfDay.fromDateTime(weatherState.weather!.lastUpdated).format(context),
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
