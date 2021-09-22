import 'package:flutter_study/pages/bottom_navigation/bottom_navigation_screen.dart';
import 'package:flutter_study/pages/freezed/freezed_screen.dart';
import 'package:flutter_study/pages/retrofit/retrofit_screen.dart';
import 'package:flutter_study/pages/retrofit_with_freezed/result_page.dart';
import 'package:flutter_study/pages/root_page.dart';
import 'package:flutter_study/pages/sliverappbar/sliver_appbar_screen.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(name: "/", page: () => RootPage()),
  GetPage(name: "/retrofit", page: () => RetrofitScreen()),
  GetPage(name: "/freezed", page: () => FreezedScreen()),
  GetPage(name: "/sliverappbar", page: () => SliverAppbarScreen()),
  GetPage(name: "/retrofit_with_freezed", page: () => ResultPage()),
  GetPage(name: "/bottomnavigation", page: () => BottomNavigationScreen()),
];
