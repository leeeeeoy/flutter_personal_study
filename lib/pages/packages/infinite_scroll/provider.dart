import 'package:flutter/material.dart';

class AjaxProvider extends ChangeNotifier {
  List<int> cache = [];

  bool loading = false;
  bool hasMore = true;

  _makeRequest({required int nextId}) async {
    await Future.delayed(const Duration(seconds: 1));

    if (nextId == 100) {
      return [];
    }

    return List.generate(20, (index) => nextId + index);
  }

  fetchItems({int? nextId}) async {
    nextId ??= 0;

    loading = true;

    notifyListeners();

    final items = await _makeRequest(nextId: nextId);

    cache = [...cache, ...items];

    if (items.length == 0) {
      hasMore = false;
    }

    loading = false;

    notifyListeners();
  }
}
