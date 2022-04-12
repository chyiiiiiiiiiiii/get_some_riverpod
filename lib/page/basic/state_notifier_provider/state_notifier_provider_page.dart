import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../other/theme.dart';

/// [ StateNotifierProvider ]
/// 用法與 StateProvider 基本一致
/// 不同的是可以自定義StateNotifier，實作更多更新內容的函式

class MyStateNotifier extends StateNotifier<int> {
  MyStateNotifier() : super(0);

  void increament() {
    state++;
  }

  void decrement() {
    state--;
  }
}

//----------------------------------------------------------------

class StateNotifierProviderPage extends StatelessWidget {
  StateNotifierProviderPage({Key? key}) : super(key: key);

  final StateNotifierProvider<MyStateNotifier, int> counterProvider =
      StateNotifierProvider<MyStateNotifier, int>((ref) {
    return MyStateNotifier();
  });

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
                'StateNotifierProvider',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            child: Consumer(builder: (context, ref, _) {
              final int value = ref.watch(counterProvider);
              return Center(
                child: Text(
                  value.toString(),
                  style: myBigTextStyle,
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Consumer(builder: (context, ref, _) {
        final MyStateNotifier notifier = ref.read(counterProvider.notifier);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: '1',
              onPressed: () {
                notifier.decrement();
              },
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () {
                notifier.increament();
              },
              child: const Icon(Icons.add),
            )
          ],
        );
      }),
    );
  }
}
