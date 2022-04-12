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
        child: const MyApp(),
      ),
    );

    await tester.scrollUntilVisible(find.textContaining('FeedPage'), 500.0);
    await tester.pump();

    await tester.tap(find.textContaining('FeedPage'));
    await tester.pump();

    expect(find.text('I am Spiderman'), findsNothing);
    expect(find.text('I am test 2'), findsOneWidget);
    expect(find.text('I am test 3'), findsOneWidget);
  });
}
