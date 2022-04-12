import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProviderObserver implements ProviderObserver {
  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    debugPrint('MyProviderObserver - provider added - $provider, value: $value');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    debugPrint('MyProviderObserver - provider disposed - $provider');
  }

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    debugPrint('MyProviderObserver - provider updated - $provider, newValue: $newValue');
  }

  @override
  void providerDidFail(ProviderBase provider, Object error, StackTrace stackTrace, ProviderContainer container) {
    debugPrint('MyProviderObserver - provider failed - $provider - error: $error');
  }
}
