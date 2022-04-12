import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../other/theme.dart';

/// [ Provider ]
/// family，修飾符
/// 取得provider時可以添加一個參數，限基礎型別

final helloWorldProvider = Provider.family<String, String>((ref, name) {
  return 'Hello World~ $name';
});

//----------------------------------------------------------------

class FamilyPage extends StatelessWidget {
  const FamilyPage({Key? key}) : super(key: key);

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
                "Provider.family",
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Consumer(
                builder: (context, ref, _) {
                  final String message = ref.watch(helloWorldProvider("Yii"));
                  return Text(
                    message,
                    style: myBigTextStyle,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
