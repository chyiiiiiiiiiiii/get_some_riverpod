import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../other/theme.dart';

/// [ autoDispose ]
/// 在我們不再使用provider時(例如：頁面關閉後)，自動將其銷毀，可以避免內存洩漏
/// 使用autoDispose可以達到限制provider是全局還是局部作用。可以更方便的解決跨頁面使用provider的問題。

class Configration {
  String key = '';
  Configration({
    required this.key,
  });
}

final getConfigrationProvider = FutureProvider.autoDispose<Configration>((ref) async {
    // 停止使用provider的時候，可以進行一些服務的記憶體釋放
    ref.onDispose(() {
      debugPrint('FutureProvider.autoDispose - onDispose()');
    });
    // 模擬請求和讀取config的過程
    await Future.delayed(const Duration(seconds: 1));
    Configration configration = Configration(key: 'yii');
    // maintainState - 非同步操作成功後，可以保留狀態，下次重新進入頁面時不會觸發新的請求
    // 如果失敗，則不要使用此函式，下次進入頁面會再次執行該非同步操作
    ref.maintainState = true;
    return configration;
  });

//----------------------------------------------------------------

class AutoDisposePage extends StatelessWidget {
  const AutoDisposePage({Key? key}) : super(key: key);

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
                'Provider.autoDispose',
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
