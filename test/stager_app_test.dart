import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stager/stager.dart';

void main() {
  final scenes = [
    ButtonScene(),
    TextScene(),
  ];

  testWidgets('Displays a list of Scenes', (WidgetTester tester) async {
    final stagerApp = StagerApp(scenes: scenes);
    await tester.pumpWidget(stagerApp);
    expect(find.text('Text'), findsOneWidget);
    expect(find.text('Button'), findsOneWidget);
  });

  testWidgets('Displays a back button after navigating to a Scene',
      (WidgetTester tester) async {
    final stagerApp = StagerApp(scenes: scenes);
    await tester.pumpWidget(stagerApp);

    // Tap the "Text" row to push TextScene onto the navigation stack.
    await tester.tap(find.text('Text'));
    await tester.pumpAndSettle();

    // Verify that our FAB is present.
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Verify that tapping the FAB navigates back and hides the FAB.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(FloatingActionButton), findsNothing);
    expect(find.text('Text'), findsOneWidget);
    expect(find.text('Button'), findsOneWidget);
  });
}

class TextScene extends Scene {
  @override
  String get title => 'Text';

  @override
  Widget build() => const Text('Text Scene');
}

class ButtonScene extends Scene {
  @override
  String get title => 'Button';

  @override
  Widget build() => ElevatedButton(
        onPressed: () {},
        child: Text('My Button'),
      );
}