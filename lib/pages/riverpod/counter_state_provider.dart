import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class ConterStateProvider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Center(
        child: Consumer(builder: (context, ref, _) {
          return Text('${counter.state}');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => counter.state++,
        onPressed: () => ref.read(counterStateProvider.notifier).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
