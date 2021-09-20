import 'package:flutter/material.dart';
import 'package:flutter_study/pages/sliverappbar/my_sliver_grid.dart';

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
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 200,
                color: Colors.indigo,
                child: Text(
                  'Sliver에 일반 Widget 올리기',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SliverAppBar(
              elevation: 0,
              pinned: true,
              floating: true,
              snap: true,
              backgroundColor: Colors.indigoAccent,
              expandedHeight: 120,
              title: Container(
                padding: EdgeInsets.only(right: 150),
                child: Text('SliverAppbar title'),
              ),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(
                  top: 50,
                  right: 50,
                  left: 20,
                  bottom: 10,
                ),
                title: Container(
                  child: Center(
                    child: Text(
                      'FlexibleSpaceBar',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.shade100,
                  ),
                ),
              ),
            ),
            MySliverGrid(),
          ],
        ),
      ),
    );
  }
}
