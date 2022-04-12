import 'package:flutter/material.dart';

import '../for_test/feed_page.dart';
import '../other/theme.dart';
import 'advance/combining/combining_page.dart';
import 'advance/combining/combining_page2.dart';
import 'advance/refresh/refresh_page.dart';
import 'advance/select/select_page.dart';
import 'basic/change_notifier_provider/change_notifier_provider_page.dart';
import 'basic/future_provider/future_provider_page.dart';
import 'basic/product_listener/product_listener_page.dart';
import 'basic/provider/provider_page.dart';
import 'basic/provider/provider_page2.dart';
import 'basic/provider_scope/provider_scope_page.dart';
import 'basic/state_notifier_provider/state_notifier_provider_page.dart';
import 'basic/state_provider/state_provider_page.dart';
import 'basic/stream_provider/stream_provider_page.dart';
import 'modifiers/auto_dispose_page.dart';
import 'modifiers/family_page.dart';

class _Option {
  String title;
  Widget page;
  _Option({
    required this.title,
    required this.page,
  });
}

List<_Option> getOptions() {
  return [
    _Option(title: 'Provider', page: const ProviderPage()),
    _Option(title: 'Provider 2', page: const ProviderPage2()),
    _Option(title: 'StateProvider', page: StateProviderPage()),
    _Option(title: 'StateNotifierProvider', page: StateNotifierProviderPage()),
    _Option(title: 'ChangeNotifierProvider', page: ChangeNotifierProviderPage()),
    _Option(title: 'FutureProvider', page: FutureProviderPage()),
    _Option(title: 'StreamProvider', page: StreamProviderPage()),
    _Option(title: 'WidgetRef.listen()', page: WidgetRefListenPage()),
    _Option(title: 'ProviderScope - override value', page: const ProviderScopeOverridePage()),
    _Option(title: 'Provider.family', page: const FamilyPage()),
    _Option(title: 'Provider.autoDispose', page: const AutoDisposePage()),
    _Option(title: 'Provider Combining', page: const CombiningPage()),
    _Option(title: 'Provider Combining 2', page: const CombiningPage2()),
    _Option(title: 'Provider Refresh', page: const RefreshPage()),
    _Option(title: 'Provider Select', page: const SelectPage()),
    _Option(title: 'FeedPage - Test', page: const FeedPage()),
  ];
}

//----------------------------------------------------------------

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<_Option> options = getOptions();
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text(
                'RiverPod',
                style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    _Option option = options[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        key: ValueKey(option.title),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => option.page));
                        },
                        child: Text(
                          '${index + 1}. ${option.title}',
                          style: myTextStyle,
                        ),
                        style: ButtonStyle(
                          alignment: Alignment.centerLeft,
                          backgroundColor: MaterialStateProperty.all(Colors.orange),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4.0);
                  },
                  itemCount: options.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
