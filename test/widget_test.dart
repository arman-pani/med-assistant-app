import 'package:flutter_test/flutter_test.dart';
import 'package:medgemma_local/main.dart';

void main() {
  testWidgets('App starts on ModelSetupScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MedGemmaApp());
    await tester.pumpAndSettle();

    expect(find.text('MedGemma'), findsOneWidget);
  });
}
