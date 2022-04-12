import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../other/theme.dart';

/// [ FutureProvider ]
/// 執行和緩存異步操作（例如網絡請求）
/// 很好地處理異步操作的錯誤/加載狀態
/// 結合多個非同步操作

class Configration {
  String key = '';
  Configration({
    required this.key,
  });
}

//----------------------------------------------------------------

class FutureProviderPage extends StatelessWidget {
  FutureProviderPage({Key? key}) : super(key: key);

  final FutureProvider<Configration> getConfigrationProvider = FutureProvider<Configration>((ref) async {
    // 模擬請求和讀取config的過程
    await Future.delayed(const Duration(seconds: 1));
    Configration configration = Configration(key: 'yii');
    return configration;
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
                "FutureProvider",
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Consumer(
                builder: (context, ref, _) {
                  final AsyncValue<Configration> asyncConfig = ref.watch(getConfigrationProvider);
                  return asyncConfig.when(
                    data: (config) => Text(
                      config.key,
                      style: myBigTextStyle,
                    ),
                    error: (error, stack) => Text('Error - $error'),
                    loading: () => const CircularProgressIndicator(),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
