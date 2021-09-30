import 'package:flutter_study/pages/filtering/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var users = [
    User(
      id: 1,
      name: 'Jang',
      gender: 'male',
      team: 'team1',
      isLikeFlutter: true,
    ),
    User(
      id: 2,
      name: 'Kim',
      gender: 'male',
      team: 'team1',
      isLikeFlutter: false,
    ),
    User(
      id: 3,
      name: 'Lee',
      gender: 'female',
      team: 'team2',
      isLikeFlutter: false,
    ),
  ];


  toggleUser() {
    for (var user in users) {
      if (user.isLikeFlutter) {
        user.isLikeFlutter = false;
      } else {
        user.isLikeFlutter = true;
      }
    }
    update();

  }
}
