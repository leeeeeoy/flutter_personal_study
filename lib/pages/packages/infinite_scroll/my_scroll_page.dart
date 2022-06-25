import 'package:flutter/material.dart';
import 'package:flutter_study/pages/packages/infinite_scroll/provider.dart';
import 'package:provider/provider.dart';

class MyScrollPage extends StatefulWidget {
  const MyScrollPage({Key? key}) : super(key: key);

  @override
  State<MyScrollPage> createState() => _MyScrollPageState();
}

class _MyScrollPageState extends State<MyScrollPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<AjaxProvider>(context, listen: false).fetchItems();
    });
  }

  _renderListView() {
    final provider = Provider.of<AjaxProvider>(context);

    final cache = provider.cache;

    final loading = provider.loading;

    if (loading && cache.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (!loading && cache.isEmpty) {
      return const Center(
        child: Text('아이템이 없습니다.'),
      );
    }

    return ListView.builder(
      itemCount: cache.length + 1,
      itemBuilder: (context, index) {
        if (index < cache.length) {
          return ListTile(
            title: Text(
              cache[index].toString(),
            ),
          );
        }

        if (!provider.loading && provider.hasMore) {
          Future.microtask(() {
            provider.fetchItems(nextId: index);
          });
        }

        if (provider.hasMore) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text('더이상 아이템이 없습니다.'),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Provider Infinite Scroll',
        ),
      ),
      body: _renderListView(),
    );
  }
}
