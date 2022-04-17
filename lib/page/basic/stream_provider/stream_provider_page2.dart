import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../other/theme.dart';

/// [ StreamProvider ]

class LoadingProcessor {
  final StreamController<int> controller = StreamController<int>();
  var loading = 0;

  LoadingProcessor() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (controller.isClosed) {
        timer.cancel();
      } else {
        controller.sink.add(loading);
        loading += 10;
      }
    });
  }

  Stream<int> get stream => controller.stream;
}

//----------------------------------------------------------------

class StreamProviderPage2 extends StatelessWidget {
  StreamProviderPage2({Key? key}) : super(key: key);

  final StreamProvider<int> streamProvider = StreamProvider<int>((ref) async* {
    final LoadingProcessor loadingProcessor = LoadingProcessor();

    ref.onDispose(() => loadingProcessor.controller.sink.close());

    // 取得並管理stream，透過yield返回數值
    await for (int progress in loadingProcessor.stream) {
      if (progress == 100) {
        loadingProcessor.controller.sink.close();
      }
      yield progress;
    }

    // 持續監聽stream，直到被controller關閉
    // return loadingProcessor.stream;
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
                'StreamProvider2',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Consumer(
                builder: (context, ref, _) {
                  final AsyncValue<int> asyncConfig = ref.watch(streamProvider);
                  return asyncConfig.when(
                    data: (progress) => Text(
                      '$progress',
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
