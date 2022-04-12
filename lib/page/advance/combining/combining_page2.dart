import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../other/theme.dart';

/// [ Provider Combining ]
/// 創建的provider需要另一個provider的狀態
/// 使用Riverpod就可以提供多個相同類型的Provider，這也是相比Provider的一個優點

final Provider<String> countryProvider = Provider<String>((ref) {
  return 'Taiwan';
});
final Provider<String> cityProvider = Provider<String>((ref) {
  return 'Taipei';
});
final StateProvider<String> weatherProvider = StateProvider<String>((ref) {
  return 'sunny';
});
final Provider<Location> locationProvider = Provider<Location>((ref) {
  return Location(providerRef: ref);
});

class Location {
  final ProviderRef providerRef;
  Location({
    required this.providerRef,
  });

  String get info {
    final String country = providerRef.read(countryProvider);
    final String city = providerRef.read(cityProvider);
    final String weather = providerRef.watch(weatherProvider);
    return "$country - $city - $weather";
  }
}

//----------------------------------------------------------------

class CombiningPage2 extends ConsumerWidget {
  const CombiningPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                "Provider Combining 2",
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Consumer(
                builder: (context, ref, _) {
                  final Location location = ref.watch(locationProvider);
                  return Text(
                    location.info,
                    style: myBigTextStyle,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: '1',
        onPressed: () {
          final StateController stateController = ref.read(weatherProvider.notifier);
          if (stateController.state == 'sunny') {
            stateController.state = "cloudy";
          } else {
            stateController.state = "sunny";
          }
        },
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}
