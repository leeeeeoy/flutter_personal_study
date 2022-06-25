import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ListView'),
        ),
        body: ListView(
          children: const [
            Text('1'),
            Text('2'),
            Text('3'),
          ],
        ),
      ),
    );
  }
}
