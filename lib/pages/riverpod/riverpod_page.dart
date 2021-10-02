import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/riverpod/riverpod_main.dart';

class RiverpodPage extends StatelessWidget {
  const RiverpodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: RiverpodMain(),
    );
  }
}
