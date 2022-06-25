import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

final counterProvider = StateProvider((ref) => 0);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer(builder: (context, ref, _) {
        final counter = ref.watch(counterProvider);
        return ElevatedButton(
          onPressed: () => counter.state++,
          child: Text('${counter.state}'),
        );
      }),
    );
  }
}

void main() {
  testWidgets('update the UI when incrementing the state', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });

  testWidgets('the counter state is not shared between tests', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
