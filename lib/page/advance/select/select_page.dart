import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../other/theme.dart';

/// [ Provider Select ]
/// select - 可以指定某一數值更改時進行刷新，精準控制Widget刷新範圍，避免不必要的rebuild

final ChangeNotifierProvider<PersonNotifier> personProvider = ChangeNotifierProvider<PersonNotifier>((ref) {
  return PersonNotifier();
});

class PersonNotifier extends ChangeNotifier {
  String _name = "Yii";
  String get name => _name;
  set name(String nv) {
    _name = nv;
    notifyListeners();
  }

  String _gender = "male";
  String get gender => _gender;
  set gender(String nv) {
    _gender = nv;
    notifyListeners();
  }
}

//----------------------------------------------------------------

class SelectPage extends StatelessWidget {
  const SelectPage({Key? key}) : super(key: key);

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
                "Provider Select",
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(
                  builder: (context, ref, _) {
                    debugPrint("personProvider - state changed - name");
                    final String name = ref.watch(personProvider.select((value) => value.name));
                    // 如果使用一般的監聽方式，狀態中的任一數值在更新後都會通知UI更新
                    // final String name = ref.watch(personProvider).name;
                    return Text(
                      name,
                      style: myBigTextStyle,
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, _) {
                    debugPrint("personProvider - state changed - gender");
                    final String gender = ref.watch(personProvider.select((value) => value.gender));
                    return Text(
                      gender,
                      style: myBigTextStyle,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Consumer(builder: (context, ref, _) {
        final PersonNotifier notifier = ref.read(personProvider.notifier);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: '1',
              onPressed: () {
                notifier.name = notifier.name == "Lina" ? "Yii" : "Lina";
              },
              child: const Icon(Icons.refresh_rounded),
            ),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () {
                notifier.gender = notifier.gender == "male" ? "female" : "male";
              },
              child: const Icon(Icons.refresh_rounded),
            ),
          ],
        );
      }),
    );
  }
}
