import 'package:flutter/material.dart';

class MultiScrollPage extends StatefulWidget {
  const MultiScrollPage({Key? key}) : super(key: key);

  @override
  _MultiScrollPageState createState() => _MultiScrollPageState();
}

class _MultiScrollPageState extends State<MultiScrollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Scroll'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) => Container(
                height: 250,
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 9)],
                child: Text(
                  'Grid Item ${index + 1}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) => Container(
                height: 200,
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 9)],
                child: Text(
                  'Grid Item ${index + 1}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) => Container(
                height: 150,
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 9)],
                child: Text(
                  'Grid Item ${index + 1}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
