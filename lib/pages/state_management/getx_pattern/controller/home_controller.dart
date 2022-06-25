import 'package:flutter_study/pages/state_management/getx_pattern/data/model/model.dart';
import 'package:flutter_study/pages/state_management/getx_pattern/data/repository/repository.dart';
import 'package:flutter_study/pages/state_management/getx_pattern/route/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final MyRepository repository;
  HomeController({required this.repository});

  final _postsList = <MyModel>[].obs;
  get postList => _postsList.obs.value;
  set postList(value) => _postsList.value = value;

  final _post = MyModel().obs;
  get post => _post.value;
  set post(value) => _post.value = value;

  getAll() {
    repository.getAll().then((data) {
      postList = data;
    });
  }

  adicionar(post) {}
  excluir(id) {}
  editar() {}
  details(post) {
    this.post = post;
    Get.toNamed(Routes.DETAILS);
  }
}
