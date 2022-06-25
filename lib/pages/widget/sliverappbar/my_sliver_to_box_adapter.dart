import 'package:flutter/material.dart';

class MySliverToBoxAdapter extends StatelessWidget {
  const MySliverToBoxAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        color: Colors.indigo,
        child: const Text(
          'Sliver에 일반 Widget 올리기',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
