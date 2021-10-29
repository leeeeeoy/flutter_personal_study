import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridBuilder extends StatefulWidget {
  const GridBuilder({Key? key}) : super(key: key);

  @override
  _GridBuilderState createState() => _GridBuilderState();
}

class _GridBuilderState extends State<GridBuilder> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.green,
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('$index'),
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) => StaggeredTile.count(
        1,
        cnt(index),
      ),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

double cnt(int index) {
  if (index == 1)
    return 1.5;
  else if (index == 2)
    return 1.0;
  else
    return 2;
}
