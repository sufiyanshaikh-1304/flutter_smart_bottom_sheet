import 'package:flutter/material.dart';
import 'package:flutter_smart_bottom_sheet/flutter_smart_bottom_sheet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'SmartBottomSheet renders correctly',
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

  test(
    'SmartBottomSheetConfig has correct default values',
        () {
      const config = SmartBottomSheetConfig();

      expect(config.autoExpand, isTrue);
      expect(config.autoCollapse, isTrue);
      expect(config.dragSensitivity, 1.0);
      expect(config.blurSigma, 8.0);
      expect(config.cornerRadius, 28.0);
      expect(config.initialChildSize, 0.4);
      expect(config.minChildSize, 0.2);
      expect(config.maxChildSize, 0.9);
    },
  );
}