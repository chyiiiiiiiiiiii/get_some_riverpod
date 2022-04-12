import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [ ProviderScope ]
/// overrideWithProvider，在指定區域內更新Provider
/// 此範例讓ListView的child item可以使用const實體，解省效能，同時child還能動態取得資料

final StateProvider<int> listItemIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class ProviderScopeOverridePage extends StatelessWidget {
  const ProviderScopeOverridePage({Key? key}) : super(key: key);

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
                'ProviderScope',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ProviderScope(overrides: [
                  listItemIndexProvider.overrideWithProvider(StateProvider((ref) => index)),
                ], child: const _Item());
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends ConsumerWidget {
  const _Item({Key? key}) : super(key: key);

  get myTextStyle => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(listItemIndexProvider);
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'item $index',
        textAlign: TextAlign.center,
        style: myTextStyle,
      ),
    );
  }
}
