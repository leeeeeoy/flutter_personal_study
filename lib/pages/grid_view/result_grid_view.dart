import 'package:flutter/material.dart';
import 'package:flutter_study/pages/grid_view/grid_builder.dart';

class ResultGridView extends StatefulWidget {
  const ResultGridView({Key? key}) : super(key: key);

  @override
  _ResultGridViewState createState() => _ResultGridViewState();
}

class _ResultGridViewState extends State<ResultGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridBuilder(),
      ),
    );
  }
}
