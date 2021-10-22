import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AjaxProvider extends ChangeNotifier {
  List<int> cache = [];

  bool loading = false;
  bool hasMore = true;

  _makeRequest({required int nextId}) async {
    await Future.delayed(Duration(seconds: 1));

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

    this.cache = [...this.cache, ...items];

    if (items.length == 0) {
      hasMore = false;
    }

    loading = false;

    notifyListeners();
  }
}
