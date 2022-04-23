import 'dart:math';

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

final getConfigrationProvider = FutureProvider.autoDispose<Configration>(
  (ref) async {
    // onDispose - 當Provider釋放掉的時候，可以關閉某些服務，進行一些服務的記憶體釋放
    // 情境：當所有有監聽此Provider的元件dispose釋放掉的時候，代表沒有人使用此Provider，
    // 這時候就會釋放資源，呼叫onDispose()
    // 注意：如果有使用keepAlive()保留狀態的話，此Provider就都不會被釋放掉，也不會進onDispose()
    ref.onDispose(() {
      debugPrint('FutureProvider.autoDispose - onDispose()');
    });
    // 模擬請求和讀取config的過程
    await Future.delayed(const Duration(seconds: 1));
    Configration configration = Configration(key: 'yii${Random().nextInt(100)}');
    // keepAlive - 如果Provider有添加autoDispose修飾符，可以使用它保存狀態，即便所有的listener都釋放掉
    // 例：通常會在取得資料成功後，選擇狀態，下次重新進入頁面時會有上次取得的資料，不會觸發新的請求
    // 如果資料取得失敗，就不要使用keepAlive，下次進入頁面會再執行非同步操作，取得資料
    ref.keepAlive();
    return configration;
  },
);

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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      asyncConfig.when(
                        data: (config) => Text(
                          config.key,
                          style: myBigTextStyle,
                        ),
                        error: (error, stack) => Text('Error - $error'),
                        loading: () => const CircularProgressIndicator(),
                      ),
                      TextButton(
                        onPressed: () => ref.refresh(getConfigrationProvider),
                        style: TextButton.styleFrom(backgroundColor: Colors.blue),
                        child: const Text(
                          '更新',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
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
