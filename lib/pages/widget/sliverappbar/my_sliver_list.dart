import 'package:flutter/material.dart';

class MySliverList extends StatefulWidget {
  const MySliverList({Key? key}) : super(key: key);

  @override
  _MySliverListState createState() => _MySliverListState();
}

class _MySliverListState extends State<MySliverList> {
  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 50.0,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.purple[100 * (index % 10)],
            child: Text(
              'List Item $index',
              style: TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
