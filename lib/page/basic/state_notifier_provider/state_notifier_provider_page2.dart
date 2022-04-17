import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../other/theme.dart';
import '../state_provider/freezed/number_state.dart';

/// [ StateProvider ]
/// 搭配 freezed 套件，產生資料的狀態類，直接等待狀態callback顯示指定UI

class NumberStateNotifier extends StateNotifier<NumberState> {
  NumberStateNotifier() : super(const NumberState.initial());

  Future<void> getRandomNumber() async {
    state = const NumberState.loading();

    try {
      await Future.delayed(const Duration(seconds: 1));
      state = NumberState.data(number: Random().nextInt(100));
    } catch (e) {
      state = NumberState.error(msg: e.toString());
    }
  }
}

final StateNotifierProvider<NumberStateNotifier, NumberState> _provider =
    StateNotifierProvider<NumberStateNotifier, NumberState>((ref) {
  return NumberStateNotifier();
});

//----------------------------------------------------------------

class StateNotifierProviderPage2 extends StatelessWidget {
  const StateNotifierProviderPage2({Key? key}) : super(key: key);

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
                'StateNotifierProviderPage2',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Consumer(builder: (context, ref, _) {
                final NumberState state = ref.watch(_provider);

                return state.when(
                  initial: () => const Text('initial'),
                  loading: () => const CircularProgressIndicator(),
                  data: (number) => Text(
                    'Random number: $number',
                    style: myBigTextStyle,
                  ),
                  error: (msg) => Text(msg),
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Consumer(builder: (context, ref, _) {
        return FloatingActionButton(
          heroTag: '1',
          onPressed: () {
            ref.read(_provider.notifier).getRandomNumber();
          },
          child: const Icon(Icons.refresh_rounded),
        );
      }),
    );
  }
}
