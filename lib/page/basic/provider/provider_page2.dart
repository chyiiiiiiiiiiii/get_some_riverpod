import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../other/theme.dart';

Provider<String> helloWorldProvider = Provider((ref) {
  return 'Hello World~';
});

//----------------------------------------------------------------

class ProviderPage2 extends StatefulWidget {
  const ProviderPage2({Key? key}) : super(key: key);

  @override
  State<ProviderPage2> createState() => _ProviderPage2State();
}

class _ProviderPage2State extends State<ProviderPage2> {
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
                "Provider\n(Consumer)",
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: HelloWorldText(),
            ),
          ),
        ],
      ),
    );
  }
}

/// 使用Consumer進行局部更新，節省效能
class HelloWorldText extends StatelessWidget {
  const HelloWorldText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final String message = ref.watch(helloWorldProvider);
        return Text(
          message,
          style: myBigTextStyle,
        );
      },
    );
  }
}
