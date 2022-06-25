import 'package:flutter/material.dart';

class MySliverAppbar extends StatelessWidget {
  const MySliverAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      floating: true,
      snap: true,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 120,
      title: Container(
        padding: const EdgeInsets.only(right: 150),
        child: const Text('SliverAppbar title'),
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(
          top: 50,
          right: 50,
          left: 20,
          bottom: 10,
        ),
        title: Row(
          children: [
            FloatingActionButton(
              onPressed: () {},
            ),
            Container(
              width: 120,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade100,
              ),
              child: const Center(
                child: Text(
                  'FlexibleSpaceBar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
