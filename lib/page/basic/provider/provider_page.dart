import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../other/theme.dart';

// 全局的Provider，供大家使用
Provider<String> helloWorldProvider = Provider((ref) {
  return 'Hello World!';
});

//----------------------------------------------------------------

/// 繼承ConsumerWidget，build()裡提供WidgetRef參數，負責存取Provider
class ProviderPage extends ConsumerWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String message = ref.watch(helloWorldProvider);
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
                "Provider\n(ConsumerWidget)",
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                message,
                style: myBigTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
