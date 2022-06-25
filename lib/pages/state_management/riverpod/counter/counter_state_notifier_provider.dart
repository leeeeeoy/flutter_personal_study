import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

final counterStateNotifierProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});

class ConterStateNotifierProvider extends ConsumerWidget {
  const ConterStateNotifierProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter1 = ref.watch(counterStateNotifierProvider.notifier);
    final counter2 = ref.watch(counterStateNotifierProvider);

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
                'conter2: $counter2',
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
              heroTag: '11',
              // onPressed: () => counter.state++,
              onPressed: () => ref.read(counterStateNotifierProvider.notifier).increment(),
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10.0),
            FloatingActionButton(
              heroTag: '22',
              // onPressed: () => counter.state++,
              // ignore: invalid_use_of_protected_member
              onPressed: () => ref.read(counterStateNotifierProvider.notifier).state--,
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
