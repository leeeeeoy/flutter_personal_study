import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class ConterStateProvider extends ConsumerWidget {
  const ConterStateProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Center(
        child: Consumer(builder: (context, ref, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'counter: $counter',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'counter.state: ${counter.state}',
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
              heroTag: 'tag1',
              onPressed: () => counter.state++,
              // onPressed: () => ref.read(counterStateProvider.notifier).state++,
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10.0),
            FloatingActionButton(
              heroTag: 'tag2',
              // onPressed: () => counter.state--,
              onPressed: () => ref.read(counterStateProvider.notifier).state--,
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
