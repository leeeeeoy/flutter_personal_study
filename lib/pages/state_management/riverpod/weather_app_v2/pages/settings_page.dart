import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app_v2/providers/provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTempUnit = ref.watch(settingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
        child: ListTile(
          title: const Text('Temperature Unit'),
          subtitle: const Text('Celcius or Fahrenheit\nDefault: Celcius'),
          trailing: Switch(
            value: currentTempUnit.state == TemperatureUnit.celcius,
            onChanged: (_) {
              currentTempUnit.state = currentTempUnit.state == TemperatureUnit.celcius
                  ? TemperatureUnit.fahrenheit
                  : TemperatureUnit.celcius;
            },
          ),
        ),
      ),
    );
  }
}
