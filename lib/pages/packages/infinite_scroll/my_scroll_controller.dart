import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MyScrollController extends GetxController {
  var scrollController = ScrollController().obs;
  var data = <int>[].obs;
  var isLoading = false.obs;
  var hasMore = false.obs;
  var isShow = true.obs;

  @override
  void onInit() {
    _getData();

    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
              scrollController.value.position.maxScrollExtent &&
          hasMore.value) {
        _getData();
      }

      final direction = scrollController.value.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        isShow.value = true;
      } else {
        isShow.value = false;
      }
    });

    super.onInit();
  }

  _getData() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 1));

    int offset = data.length;

    var appendData = List<int>.generate(10, (i) => i + 1 + offset);

    data.addAll(appendData);

    isLoading.value = false;

    hasMore.value = data.length < 50;
  }
}
