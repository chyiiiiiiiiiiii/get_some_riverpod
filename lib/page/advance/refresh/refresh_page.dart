import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../other/theme.dart';

/// [ Provider Refresh ]
/// 強制 Provider 立即刷新，取得新的資料。
/// 適合列表下拉刷新，或者請求數據錯誤時重試。

final FutureProvider<List<String>> itemsProvider = FutureProvider<List<String>>((ref) {
  return List.generate(
    50,
    (index) => 'Item $index - ${Random().nextInt(1000).toString()}',
  );
});

class RefreshPage extends StatelessWidget {
  const RefreshPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
            child: const SafeArea(
              child: Text(
                'Provider Refresh',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            child: Consumer(builder: (context, ref, _) {
              AsyncValue<List<String>> asyncData = ref.watch(itemsProvider);
              return asyncData.when(
                data: (items) {
                  return RefreshIndicator(
                    onRefresh: () => ref.refresh(itemsProvider.future),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final String text = items[index];
                        return _Item(text: text);
                      },
                      itemCount: items.length,
                    ),
                  );
                },
                error: (error, st) {
                  return const Text('Get data failed');
                },
                loading: () => const CircularProgressIndicator(),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _Item extends ConsumerWidget {
  final String text;

  const _Item({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: myTextStyle,
      ),
    );
  }
}
