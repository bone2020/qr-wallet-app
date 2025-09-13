// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:q_r_wallet_app/app_state.dart';
// Do NOT initialize Firebase in widget tests to avoid platform channel errors.

import 'package:q_r_wallet_app/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {});
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => FFAppState(),
      child: MyApp(),
    ));
    // Let delayed timers (e.g., splash timeout) complete to avoid pending timers.
    await tester.pump(const Duration(seconds: 2));
  });
}
