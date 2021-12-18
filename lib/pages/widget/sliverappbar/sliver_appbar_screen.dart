import 'package:flutter/material.dart';
import 'package:flutter_study/pages/widget/sliverappbar/my_sliver_appbar.dart';
import 'package:flutter_study/pages/widget/sliverappbar/my_sliver_grid.dart';

class SliverAppbarScreen extends StatefulWidget {
  const SliverAppbarScreen({Key? key}) : super(key: key);

  @override
  _SliverAppbarScreenState createState() => _SliverAppbarScreenState();
}

class _SliverAppbarScreenState extends State<SliverAppbarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
