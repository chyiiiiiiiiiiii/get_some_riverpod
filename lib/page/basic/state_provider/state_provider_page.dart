import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../other/theme.dart';

/// [ StateProvider ]
/// 適合用來儲存基本型別，更新state也就是內容後，立即通知更新
/// 內建使用的Notifier是StateController，繼承StateNotifier
///
/// 監聽數值的時候使用watch()操作provider
/// 更新數值的時候使用read()操作provider

class StateProviderPage extends ConsumerWidget {
  StateProviderPage({Key? key}) : super(key: key);

  final StateProvider<int> counterProvider = StateProvider<int>((ref) {
    return 0;
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int count = ref.watch(counterProvider.state).state;
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
                'StateProvider',
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
              // ref.read(counterProvider.notifier).state++;
              // 使用update()，可以取得目前的狀態，並使用此狀態進行更新。整數用++不會更新哦
              ref.read(counterProvider.notifier).update((currentState) => currentState + 1);
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
