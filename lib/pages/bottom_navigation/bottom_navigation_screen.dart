import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final scrollController = ScrollController();

  bool isShow = true;

  @override
  void initState() {
    scrollController.addListener(isVisible);
    super.initState();
  }

  isVisible() {
    final scrollDirection = scrollController.position.userScrollDirection;
    if (scrollDirection == ScrollDirection.forward) {
      setState(() {
        isShow = true;
      });
    } else {
      setState(() {
        isShow = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigation'),
      ),
      body: ListView.builder(
        controller: scrollController,
        itemExtent: 150,
        itemBuilder: (context, index) => Card(
          color: Colors.blueGrey[100 * (index % 9)],
          child: Center(
              child: Text(
            'Card $index',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 200),
        height: isShow ? 60 : 0,
        child: Container(
          child: Center(
              child: Text(
            'BottomNavigationBar',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }
}
