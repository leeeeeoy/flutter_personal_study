import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();
  late String city;

  void submit() {
    final form = _fKey.currentState;

    form!.save();

    if (!form.validate()) {
      return;
    }

    Get.back(result: city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Form(
        key: _fKey,
        child: Column(
          children: [
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  labelText: 'City',
                  hintText: 'Enter city name in English',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  return value!.isEmpty ? 'City is required' : null;
                },
                onSaved: (value) => city = value!,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: submit,
              child: const Text(
                'How\'s Weather?',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
