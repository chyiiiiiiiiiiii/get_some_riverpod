import 'feed_page.dart';

abstract class IFeedRepository {
  Future<List<Feed>> getFeeds();
}

class FeedRepository extends IFeedRepository {
  @override
  Future<List<Feed>> getFeeds() {
    return Future.value([
      Feed(name: 'I am Spiderman'),
      Feed(name: 'I am Spiderman 2'),
      Feed(name: 'I am Spiderman 3'),
    ]);
  }
}

class MockFeedRepository extends IFeedRepository {
  @override
  Future<List<Feed>> getFeeds() {
    return Future.value([
      Feed(name: 'I am test'),
      Feed(name: 'I am test 2'),
      Feed(name: 'I am test 3'),
    ]);
  }
}
