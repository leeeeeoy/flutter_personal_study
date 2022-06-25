import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterController extends StateController<int> {
  CounterController() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

final counterStateControllerProvider = StateNotifierProvider<CounterController, int>((ref) {
  return CounterController();
});

class CounterStateController extends ConsumerWidget {
  const CounterStateController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter1 = ref.watch(counterStateControllerProvider.notifier);
    final counter2 = ref.watch(counterStateControllerProvider);
    ref.listen(counterStateControllerProvider, (int count) {});

    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Center(
        child: Consumer(builder: (context, ref, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'conter1: $counter1',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'conter1.state: ${counter1.state}',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'conter2: $counter2',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text(
              //   'conter2: ${counter2.state}',
              //   style: TextStyle(
              //     fontSize: 32,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
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
              heroTag: '1',
              onPressed: () => counter1.state++,
              // onPressed: () =>
              //     ref.read(counterStateControllerProvider.notifier).state++,
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10.0),
            FloatingActionButton(
              heroTag: '2',
              // onPressed: () => counter.state--,
              onPressed: () => ref.read(counterStateControllerProvider.notifier).state--,
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
