// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({Key? key}) : super(key: key);

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  PublishSubject<int> subject = PublishSubject<int>();
  BehaviorSubject<int> subject2 = BehaviorSubject<int>();
  ReplaySubject<int> subject3 = ReplaySubject<int>();

  publishSubjectAdd() {
/*this listener below will print every integer added to the subject: 1, 2, 3, ...*/
    // subject.stream.listen(print);
    subject.add(1);
    subject.add(2);

/*but this listener below will print only the integer added after his initialization: 3, ...*/
    subject.add(3);
    subject.stream.listen(print);
  }

  behaviorSubject() {
    // subject2.stream.listen(print); // prints 1,2,3
    subject2.add(1);
    subject2.add(2);
    subject2.add(3);
    subject2.stream.listen(print); // prints 3
  }

  replaySubject() {
    // subject3.stream.listen(print);
    subject3.add(1);
    subject3.add(2);
    subject3.add(3);

    subject3.stream.listen(print);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    subject.close();
    subject2.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream version of the Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: publishSubjectAdd,
              child: const Text('PublishSubject'),
            ),
            ElevatedButton(
              onPressed: behaviorSubject,
              child: const Text('BehaviorSubject'),
            ),
            ElevatedButton(
              onPressed: replaySubject,
              child: const Text('ReplaySubject'),
            ),
          ],
        ),
      ),
    );
  }
}
