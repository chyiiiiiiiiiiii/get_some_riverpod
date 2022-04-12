import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../other/theme.dart';

/// [ StreamProvider ]
/// 1. 監聽 Firebase 或網絡套接字
/// 2. 每隔幾秒鐘重建另一個提供程序
///
/// 比StreamBuilder好的幾點：
/// 1. 它允許其他Provider使用ref.watch取得stream
/// 2. 由於AsyncValue，它確保正確處理加載和錯誤情況。
/// 3. 它不需要區分'廣播流'和'普通流'的需要。
/// 4. 它緩存流發出的最新值，確保如果在發出事件後添加listener，listener仍然可以立即訪問最新事件。
/// 5. 它允許在測試期間使用假的stream透過override StreamProvider.

class Configration {
  String key = '';
  Configration({
    required this.key,
  });
}

//----------------------------------------------------------------

class StreamProviderPage extends StatelessWidget {
  StreamProviderPage({Key? key}) : super(key: key);

  final StreamProvider<Configration> getConfigrationProvider = StreamProvider<Configration>((ref) {
    // 模擬請求和讀取config的過程
    Configration configration = Configration(key: 'yii-chen');
    final Stream<Configration> stream = Stream.value(configration);
    return stream;
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
                'StreamProvider',
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
