import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../other/theme.dart';
import 'feed_repository.dart';

/// Test

class Feed {
  String name = '';
  Feed({
    required this.name,
  });
}

final feedsRepositoryProvider = Provider<IFeedRepository>((ref) => FeedRepository());

final FutureProvider<List<Feed>> feedsProvider = FutureProvider<List<Feed>>((ref) async {
  final IFeedRepository repository = ref.watch(feedsRepositoryProvider);
  return repository.getFeeds();
});

//----------------------------------------------------------------

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

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
                'FeedPage - Test',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Consumer(
                builder: (context, ref, _) {
                  final AsyncValue<List<Feed>> asyncData = ref.watch(feedsProvider);
                  return asyncData.when(
                    data: (feeds) => ListView.builder(
                      itemBuilder: (context, index) {
                        final String feedName = feeds[index].name;
                        return Text(
                          feedName,
                          textAlign: TextAlign.center,
                          style: myBigTextStyle,
                        );
                      },
                      itemCount: feeds.length,
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
