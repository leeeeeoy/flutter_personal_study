import 'package:flutter/material.dart';

class GridBuilder extends StatefulWidget {
  const GridBuilder({Key? key}) : super(key: key);

  @override
  _GridBuilderState createState() => _GridBuilderState();
}

class _GridBuilderState extends State<GridBuilder> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (_, index) => Container(
        alignment: Alignment.center,
        color: Colors.purple[100 * (index % 10)],
        child: Text(
          'Grid Item $index',
          style: TextStyle(fontSize: 20),
        ),
      ),
      primary: false,
    );
  }
}
