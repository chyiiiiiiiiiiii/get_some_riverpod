import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../other/theme.dart';

/// [ WidgetRef ]
/// listen() - 監聽provider的狀態變化
/// 1. 上一個狀態
/// 2. 新的狀態
/// 使用：在主要build函式裡進行listen的操作，只會在第一次進行監聽，不會每次更新後就監聽一次
///
/// 注意：不要在其他內部的Widget builder裡進行listen的操作

class WidgetRefListenPage extends ConsumerWidget {
  WidgetRefListenPage({Key? key}) : super(key: key);

  final StateProvider<int> counterProvider = StateProvider<int>((ref) {
    return 0;
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int count = ref.watch(counterProvider.state).state;

    ref.listen<int>(counterProvider, (previousState, nextState) {
      debugPrint("WidgetRef.listen() - state changed - previousState($previousState), nextState($nextState)");
      Fluttertoast.showToast(
          msg: "WidgetRef.listen() - state changed - previousState($previousState), nextState($nextState)");
    });

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
                "WidgetRef.listen()",
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                count.toString(),
                style: myBigTextStyle,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              ref.read(counterProvider.notifier).state--;
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              ref.read(counterProvider.notifier).state++;
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
