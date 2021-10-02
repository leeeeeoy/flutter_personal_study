import 'package:flutter/material.dart';
import 'package:flutter_study/pages/riverpod/counter_state_notifier_provider.dart';
import 'package:flutter_study/pages/riverpod/counter_state_provider.dart';

class RiverpodMain extends StatelessWidget {
  const RiverpodMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ConterStateProvider(),
      home: ConterStateNotifierProvider(),
    );
  }
}
