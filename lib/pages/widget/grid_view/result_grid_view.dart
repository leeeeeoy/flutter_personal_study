import 'package:flutter/material.dart';
import 'package:flutter_study/pages/widget/grid_view/grid_builder.dart';

class ResultGridView extends StatefulWidget {
  const ResultGridView({Key? key}) : super(key: key);

  @override
  State<ResultGridView> createState() => _ResultGridViewState();
}

class _ResultGridViewState extends State<ResultGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: GridBuilder(),
      ),
    );
  }
}
