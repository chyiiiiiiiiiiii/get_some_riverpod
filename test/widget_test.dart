import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_some_riverpod/for_test/feed_page.dart';
import 'package:get_some_riverpod/for_test/feed_repository.dart';

void main() {
  /// should see empty data in first frame, then get new mock-data after async operation in the second frame
  /// Warn: can not make sure this process can pass in real situation, like data from server
  testWidgets(
    'FeedPage - Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            overrides: [feedsRepositoryProvider.overrideWithValue(MockFeedRepository())],
            child: const FeedPage(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump();

      expect(find.text('I am Spiderman'), findsNothing);
      expect(find.text('I am test'), findsOneWidget);
      expect(find.text('I am test 2'), findsOneWidget);
      expect(find.text('I am test 3'), findsOneWidget);
    },
  );
}
