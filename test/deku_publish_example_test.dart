import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deku_publish_example/deku_publish_example.dart';

void main() {
  testWidgets('displayed well', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RoundButton(
          label: 'test label',
        ),
      ),
    );

    final container = tester.firstWidget<SizedBox>(find.byType(SizedBox));
    expect(container.width, double.infinity);

    final button = container.child as ElevatedButton;
    expect(button.onPressed, isNull);
    expect(button.style!.backgroundColor, isNull);
    expect(
      button.style!.padding!.resolve(<MaterialState>{}),
      const EdgeInsets.symmetric(vertical: 12.0),
    );
    expect(
      (button.style!.shape!.resolve(<MaterialState>{})
              as RoundedRectangleBorder)
          .borderRadius,
      BorderRadius.circular(24.0),
    );

    final label = button.child as Text;
    expect(label.data, 'test label');
  });
}
