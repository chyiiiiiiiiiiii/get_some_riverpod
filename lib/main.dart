import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'observer/my_provider_observer.dart';
import 'page/home_page.dart';

void main() {
  // ProviderScope，在WidgetTree根部包裹一層，負責處理所有Provider
  runApp(
    ProviderScope(
      child: const MyApp(),
      observers: [
        // 自定義Observer，負責監聽 Provider
        MyProviderObserver(),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
