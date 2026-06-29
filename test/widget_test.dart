import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aura_gold/app.dart';

void main() {
  testWidgets('AuraGoldApp smoke test - verifies onboarding screen shows up', (WidgetTester tester) async {
    // Build our app wrapped in ProviderScope and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: AuraGoldApp(),
      ),
    );

    // Verify that the onboarding screen renders its module title
    expect(find.text('Onboarding Screen'), findsOneWidget);
  });
}
