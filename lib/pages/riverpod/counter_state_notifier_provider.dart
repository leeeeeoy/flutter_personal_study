import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

final conterStateNotifierProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});

class ConterStateNotifierProvider extends ConsumerWidget {
  const ConterStateNotifierProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final counter = ref.watch(conterStateNotifierProvider.notifier);
    final counter = ref.watch(conterStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Center(
        child: Consumer(builder: (context, ref, _) {
          return Text('$counter');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () =>
        //     ref.read(conterStateNotifierProvider.notifier).increment(),
        onPressed: () =>
            ref.watch(conterStateNotifierProvider.notifier).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
