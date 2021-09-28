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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 300,
              color: Colors.lightBlue.shade100,
              child: ListView.builder(
                itemBuilder: (_, index) => Card(
                  child: Text('Card $index'),
                ),
                itemCount: 50,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 300,
              color: Colors.lightBlue.shade200,
              child: ListView.builder(
                itemBuilder: (_, index) => Card(
                  child: Text('Card $index'),
                ),
                itemCount: 50,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 300,
              color: Colors.lightBlue.shade300,
              child: ListView.builder(
                itemBuilder: (_, index) => Card(
                  child: Text('Card $index'),
                ),
                itemCount: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
