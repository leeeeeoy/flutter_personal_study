import 'package:flutter_study/pages/bloc_pattern/screen/bloc_screen.dart';
import 'package:flutter_study/pages/bottom_navigation/bottom_navigation_screen.dart';
import 'package:flutter_study/pages/filtering/filtering_page.dart';
import 'package:flutter_study/pages/freezed/freezed_screen.dart';
import 'package:flutter_study/pages/getx_pattern/binding/home_binding.dart';
import 'package:flutter_study/pages/getx_pattern/ui/home/home_page.dart';
import 'package:flutter_study/pages/infinite_scroll/my_scroll_page.dart';
import 'package:flutter_study/pages/multi_scroll/multi_scroll_page.dart';
import 'package:flutter_study/pages/retrofit/retrofit_screen.dart';
import 'package:flutter_study/pages/retrofit_with_freezed/result_page.dart';
import 'package:flutter_study/pages/root_page.dart';
import 'package:flutter_study/pages/screen_util/screen_util_page.dart';
import 'package:flutter_study/pages/sliverappbar/sliver_appbar_screen.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(name: "/", page: () => RootPage()),
  GetPage(name: "/retrofit", page: () => RetrofitScreen()),
  GetPage(name: "/freezed", page: () => FreezedScreen()),
  GetPage(name: "/sliverappbar", page: () => SliverAppbarScreen()),
  GetPage(name: "/retrofit_with_freezed", page: () => ResultPage()),
  GetPage(name: "/bottomnavigation", page: () => BottomNavigationScreen()),
  GetPage(
    name: '/getx_pattern',
    page: () => HomePage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: '/infinite',
    page: () => MyScrollPage(),
  ),
  GetPage(
    name: '/bloc',
    page: () => BlocScreen(),
  ),
  GetPage(
    name: '/multi_scroll',
    page: () => MultiScrollPage(),
  ),
  GetPage(name: '/screen_util', page: () => ScreenUtilPage()),
  GetPage(name: '/filtering', page: () => FilteringPage()),
];
