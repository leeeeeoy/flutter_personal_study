import 'package:flutter/material.dart';
import 'package:flutter_study/pages/widget/sliverappbar/my_sliver_appbar.dart';
import 'package:flutter_study/pages/widget/sliverappbar/my_sliver_grid.dart';

class SliverAppbarScreen extends StatefulWidget {
  const SliverAppbarScreen({Key? key}) : super(key: key);

  @override
  State<SliverAppbarScreen> createState() => _SliverAppbarScreenState();
}

class _SliverAppbarScreenState extends State<SliverAppbarScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // MySliverToBoxAdapter(),
            MySliverAppbar(),
            MySliverGrid(),
          ],
        ),
      ),
    );
  }
}
