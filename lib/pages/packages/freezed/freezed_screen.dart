import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_study/pages/packages/freezed/model/member.dart';
import 'package:flutter_study/pages/packages/freezed/model/person.dart';
import 'package:flutter_study/pages/packages/freezed/model/user.dart';

class FreezedScreen extends StatefulWidget {
  const FreezedScreen({Key? key}) : super(key: key);

  @override
  State<FreezedScreen> createState() => _FreezedScreenState();
}

class _FreezedScreenState extends State<FreezedScreen> {
  final user1 = User(id: 1, name: 'leeeeeoy', job: 'student');
  final user2 = User(id: 1, name: 'leeeeeoy', job: 'student');
  final user3 = User(id: 3, name: 'leeeeeoy', job: 'programer');

  final person = Person(id: 1, name: 'leeeeeoy', age: 25, statusCode: 200);
  final personLoading = Person.loading(statusCode: 401);
  final personError = Person.error('failed to fetch', statusCode: 401);

  mapWhen(Person person) {
    return person.when(
      (id, name, age, statusCode) => person.toString(),
      loading: (statusCode) => 'loading...',
      error: (message, statusCode) => 'error...',
    );
  }

  @override
  Widget build(BuildContext context) {
    final company1 = Company(id: 1, name: 'KAU');
    final team1 = Team(id: 1, name: 'Ateam', company: company1);
    final member1 = Member(id: 1, name: 'Yoel', team: team1);

    // assert 에러
    //final member2 = Member(id: 1, name: 'leeeeeoy', team: team1);

    final member3 = member1.copyWith.team.company(name: 'Kakao');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Freezed'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      log('${user1.id}');
                    },
                    child: const Text('user1.id')),
                ElevatedButton(
                    onPressed: () {
                      log(user1.name);
                    },
                    child: const Text('user1.name')),
                ElevatedButton(
                    onPressed: () {
                      log(user1.job);
                    },
                    child: const Text('user1.job')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      log(user1.toString());
                    },
                    child: const Text('user1.toString()')),
                ElevatedButton(
                    onPressed: () {
                      log('${user1.toJson()}');
                    },
                    child: const Text('user1.toJson()')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      log('${user1 == user2}');
                    },
                    child: const Text('user1 == user2')),
                ElevatedButton(
                    onPressed: () {
                      log('${user1 == user3}');
                    },
                    child: const Text('user1 == user3')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      log('${user1.hashCode == user2.hashCode}');
                    },
                    child: const Text('user1.hashCode == user2.hashCode')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: member1.hello, child: const Text('member1.hello()')),
                ElevatedButton(
                    onPressed: () {
                      log(member1.nameLength);
                    },
                    child: const Text('member1.nameLength')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      log('$member1');
                    },
                    child: const Text('member1')),
                ElevatedButton(
                    onPressed: () {
                      log('$member3');
                    },
                    child: const Text('member3')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    log(person.toString());
                    log(personLoading.toString());
                    log(personError.toString());
                  },
                  child: const Text('Union Test'),
                ),
                ElevatedButton(
                  onPressed: () {
                    log(mapWhen(person));
                    log(mapWhen(personLoading));
                    log(mapWhen(personError));
                  },
                  child: const Text('Peson when'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
