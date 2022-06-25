import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCounter extends StateNotifier<int> {
  MyCounter() : super(0);

  void increment() => state++;
  void decrement() => state--;
  void initCount() => state = 0;
}

final myCounterStateNotifierProvider = StateNotifierProvider<MyCounter, int>((ref) {
  return MyCounter();
});

class PracticePage extends ConsumerWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // int
    final counter = ref.watch(myCounterStateNotifierProvider);

    final counterReader = ref.read(myCounterStateNotifierProvider.notifier);

    ref.listen(
      myCounterStateNotifierProvider,
      ((int num) {
        log('바뀔때마다 동작');
        log('ref.listen: $num');
      }),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Practice'),
      ),
      body: Center(
        child: Consumer(builder: (context, ref, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'ref.watch(provider): $counter',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        }),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: '111',
              onPressed: () => counterReader.increment(),
              child: const Icon(
                Icons.add,
              ),
            ),
            const SizedBox(width: 10.0),
            FloatingActionButton(
              heroTag: '222',
              onPressed: () => counterReader.decrement(),
              child: const Icon(
                Icons.remove,
              ),
            ),
            const SizedBox(width: 10.0),
            FloatingActionButton(
              heroTag: '333',
              onPressed: () => counterReader.initCount(),
              child: const Icon(
                Icons.refresh,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
