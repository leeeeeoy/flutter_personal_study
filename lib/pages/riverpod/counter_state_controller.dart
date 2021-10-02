import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterController extends StateController<int> {
  CounterController() : super(0);

  void increment() => state++;
  void decrement() => state--;
}

final conterStateControllerProvider =
    StateNotifierProvider<CounterController, int>((ref) {
  return CounterController();
});

class ConterStateController extends ConsumerWidget {
  const ConterStateController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final counter = ref.watch(conterStateNotifierProvider.notifier);
    final counter = ref.watch(conterStateControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Center(
        child: Consumer(builder: (context, ref, _) {
          return Text('$counter');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () =>
        //     ref.read(conterStateControllerProvider.notifier).increment(),
        onPressed: () =>
            ref.read(conterStateControllerProvider.notifier).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
