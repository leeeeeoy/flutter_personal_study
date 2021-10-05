import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/riverpod/weather_app/pages/search_page.dart';
import 'package:flutter_study/pages/riverpod/weather_app/pages/settings_page.dart';
import 'package:flutter_study/pages/riverpod/weather_app/providers/city_provider.dart';
import 'package:flutter_study/pages/riverpod/weather_app/providers/provider.dart';
import 'package:flutter_study/pages/riverpod/weather_app/providers/settings_provider.dart';
import 'package:get/get.dart';

class WeatherHomePage extends ConsumerWidget {
  WeatherHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cwp = ref.watch(currentWeatherProvider.notifier);

    ref.listen(weatherStateProvider, (WeatherState weather) {
      print('>>> In onChange <<<');
      if (weather.error != null && weather.error!.isNotEmpty) {
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(weather.error!),
            );
          },
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Get.to(SettingsPage());
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              ref.read(cityProvider).state =
                  (await Get.to<String>(SearchPage()))!;

              print('City: ${ref.read(cityProvider).state}');

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
      return Center(
        child: Text(
          'Select a city',
          style: TextStyle(fontSize: 18.0),
        ),
      );
    }

    if (weatherState.loading!) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (weatherState.weather == null) {
      return Center(
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
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          '${TimeOfDay.fromDateTime(weatherState.weather!.lastUpdated).format(context)}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 60.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              calculateTemp(tempUnit, weatherState.weather!.theTemp),
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Max: ' +
                      calculateTemp(tempUnit, weatherState.weather!.maxTemp),
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  'Min: ' +
                      calculateTemp(tempUnit, weatherState.weather!.minTemp),
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Text(
          weatherState.weather!.weatherStateName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32.0,
          ),
        )
      ],
    );
  }

  String calculateTemp(TemperatureUnit tempUnit, double temp) {
    if (tempUnit == TemperatureUnit.fahrenheit) {
      return ((temp * 9 / 5) + 32).toStringAsFixed(2) + '℉';
    }
    return temp.toStringAsFixed(2) + '℃';
  }
}
