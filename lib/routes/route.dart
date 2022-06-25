import 'package:flutter_study/pages/bottom_navigation/bottom_navigation_screen.dart';
import 'package:flutter_study/pages/filtering/filtering_page.dart';
import 'package:flutter_study/pages/multi_scroll/multi_scroll_page.dart';
import 'package:flutter_study/pages/packages/dio/dio_result_page.dart';
import 'package:flutter_study/pages/packages/freezed/freezed_screen.dart';
import 'package:flutter_study/pages/packages/infinite_scroll/my_scroll_page.dart';
import 'package:flutter_study/pages/packages/moor/moor_page.dart';
import 'package:flutter_study/pages/packages/retrofit/retrofit_screen.dart';
import 'package:flutter_study/pages/packages/retrofit_with_freezed/result_page.dart';
import 'package:flutter_study/pages/packages/screen_util/screen_util_page.dart';
import 'package:flutter_study/pages/packages/shared_preferences/shared_preferences_page.dart';
import 'package:flutter_study/pages/root_page.dart';
import 'package:flutter_study/pages/state_management/bloc_pattern/screen/bloc_screen.dart';
import 'package:flutter_study/pages/state_management/getx_pattern/binding/home_binding.dart';
import 'package:flutter_study/pages/state_management/getx_pattern/ui/home/home_page.dart';
import 'package:flutter_study/pages/state_management/riverpod/riverpod_page.dart';
import 'package:flutter_study/pages/steam/stream_page.dart';
import 'package:flutter_study/pages/text/text_page.dart';
import 'package:flutter_study/pages/widget/grid_view/result_grid_view.dart';
import 'package:flutter_study/pages/widget/list_view/list_view_page.dart';
import 'package:flutter_study/pages/widget/sliverappbar/sliver_appbar_screen.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(name: "/", page: () => const RootPage()),
  GetPage(name: "/retrofit", page: () => const RetrofitScreen()),
  GetPage(name: "/freezed", page: () => const FreezedScreen()),
  GetPage(name: "/sliverappbar", page: () => const SliverAppbarScreen()),
  GetPage(name: "/retrofit_with_freezed", page: () => const ResultPage()),
  GetPage(name: "/bottomnavigation", page: () => const BottomNavigationScreen()),
  GetPage(name: '/getx_pattern', page: () => const HomePage(), binding: HomeBinding()),
  GetPage(name: '/infinite', page: () => const MyScrollPage()),
  GetPage(name: '/bloc', page: () => const BlocScreen()),
  GetPage(name: '/multi_scroll', page: () => const MultiScrollPage()),
  GetPage(name: '/screen_util', page: () => const ScreenUtilPage()),
  GetPage(name: '/filtering', page: () => const FilteringPage()),
  GetPage(name: '/shared_preferences', page: () => const SharedPreferencesPage()),
  GetPage(name: '/moor', page: () => const MoorPage()),
  GetPage(name: '/grid_view', page: () => const ResultGridView()),
  GetPage(name: '/riverpod', page: () => const RiverpodPage()),
  GetPage(name: '/dio', page: () => DioResultPage()),
  GetPage(name: '/stream', page: () => const StreamPage()),
  GetPage(name: '/list_view', page: () => const ListViewPage()),
  GetPage(name: '/text', page: () => const TextPage()),
];
