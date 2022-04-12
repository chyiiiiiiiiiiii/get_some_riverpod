import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../other/theme.dart';

/// [ ChangeNotifierProvider ]
/// 狀態比較複雜的情境下，適合使用
/// 與StateNotifier的區別，需要額外使用notifyListeners()通知更新

class MyChangeNotifier extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increament() {
    _value++;
    notifyListeners();
  }

  void decrement() {
    _value--;
    notifyListeners();
  }
}

class ChangeNotifierProviderPage extends StatelessWidget {
  ChangeNotifierProviderPage({Key? key}) : super(key: key);

  final ChangeNotifierProvider<MyChangeNotifier> counterProvider = ChangeNotifierProvider<MyChangeNotifier>((ref) {
    return MyChangeNotifier();
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
                "StateNotifierProvider",
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            child: Consumer(builder: (context, ref, _) {
              final int value = ref.watch(counterProvider).value;
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
        final MyChangeNotifier notifier = ref.read(counterProvider);
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
