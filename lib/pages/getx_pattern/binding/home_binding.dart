import 'package:flutter_study/pages/getx_pattern/controller/home_controller.dart';
import 'package:flutter_study/pages/getx_pattern/data/provider/api.dart';
import 'package:flutter_study/pages/getx_pattern/data/repository/repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(
        repository: MyRepository(
          apiClient: MyApiClient(
            httpClient: http.Client(),
          ),
        ),
      );
    });
  }
}
