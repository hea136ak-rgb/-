import 'package:flutter_test/flutter_test.dart';
import 'package:solo_leveling/main.dart';

void main() {
  testWidgets('Solo Leveling smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SoloLevelingApp());

    // Verify that Splash screen is shown (contains 'SOLO LEVELING')
    expect(find.text('SOLO LEVELING'), findsOneWidget);
  });
}
