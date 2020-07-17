import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:icon_picker/icon_picker.dart';

void main() {
  testWidgets('Testing instantiate IconPicker', (WidgetTester tester) async {
    var myWidget = MyWidget();
    await tester.pumpWidget(myWidget);

    expect(
      find.text('test'),
      findsOneWidget,
      reason: 'IconPicker value not found!',
    );
    var iconPicker = find.byType(IconPicker);
    expect(
      iconPicker,
      findsOneWidget,
      reason: 'IconPicker not found!',
    );
    expect(
      find.text('favorite'),
      findsOneWidget,
      reason: 'IconPicker initial label value not found!',
    );

    await tester.tap(iconPicker);
    await tester.pumpWidget(myWidget);

    var icon = find.byIcon(Icons.ac_unit);
    await tester.tap(icon);
    expect(
      find.text('ac_unit'),
      findsOneWidget,
      reason: 'IconPicker label value not changed!',
    );
    expect(
      find.byIcon(Icons.ac_unit),
      findsOneWidget,
      reason: 'IconPicker icon not changed',
    );

    await tester.pumpWidget(myWidget);
    expect(
      find.text(
          '{"iconName": "ac_unit", "codePoint": 60219, "fontFamily": "MaterialIcons"}'),
      findsOneWidget,
      reason: 'IconPicker value result not changed!',
    );
  });
}

class MyWidget extends StatefulWidget {
  MyWidget({Key key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _value = 'test';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            IconPicker(
              initialValue: 'favorite',
              icon: Icon(Icons.apps),
              labelText: "Icon",
              onChanged: (val) => setState(() => _value = val),
            ),
            Text(_value),
          ],
        ),
      ),
    );
  }
}
