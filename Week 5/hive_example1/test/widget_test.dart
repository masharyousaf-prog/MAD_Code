// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:hive_example1/hive_box_const.dart';
import 'package:hive_example1/main.dart';

void main() {
  setUpAll(() async {
    await Hive.initFlutter();
    await Hive.openBox(userHiveBox);
  });

  setUp(() async {
    await Hive.box(userHiveBox).clear();
  });

  tearDownAll(() async {
    await Hive.close();
  });

  testWidgets('creates a user and displays it', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('No Data is Stored'), findsOneWidget);

    await tester.tap(find.text('Add Data'));
    await tester.pump();

    await tester.enterText(find.byType(TextField).at(0), 'Ada');
    await tester.enterText(find.byType(TextField).at(1), 'ada@example.com');
    await tester.tap(find.text('Create New'));
    await tester.pumpAndSettle();

    expect(find.text('Name : Ada'), findsOneWidget);
    expect(find.text('Email : ada@example.com'), findsOneWidget);
  });
}
