import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_some_riverpod/for_test/feed_page.dart';
import 'package:get_some_riverpod/for_test/feed_repository.dart';
import 'package:get_some_riverpod/main.dart';

void main() {
  testWidgets('FeedPage - Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [feedsRepositoryProvider.overrideWithValue(MockFeedRepository())],
        child: MyApp(),
      ),
    );
    expect(find.textContaining('StateProvider'), findsOneWidget);
    // expect(find.text('I am test 2'), findsNothing);
    // expect(find.text('I am test 3'), findsOneWidget);
  });
}
