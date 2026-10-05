import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_smart_bottom_sheet/flutter_smart_bottom_sheet.dart';

void main() {
  testWidgets(
    'Smart BottomSheet widget renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SmartBottomSheet(
              child: Text('Smart BottomSheet'),
            ),
          ),
        ),
      );

      expect(
        find.text('Smart BottomSheet'),
        findsOneWidget,
      );
    },
  );
}