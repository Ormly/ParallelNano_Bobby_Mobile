import 'package:ParallelNano_Bobby_Mobile/ui/screens/ip.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/subscreens/nodes.dart';
import 'package:ParallelNano_Bobby_Mobile/ui/subscreens/tempo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // A test case for testing the IP screen
  testWidgets('test IP Screen', (WidgetTester tester) async {
    Widget testWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(home: new IPScreen()));
    // Build IP screen and trigger a frame
    await tester.pumpWidget(testWidget);
    // Verify Connect button exists
    expect(find.byType(MaterialButton), findsOneWidget);
    // Click on connect button
    await tester.tap(find.byType(MaterialButton));
    await tester.pump();
    // Verify error message printed
    expect(find.text('IP is required!'), findsOneWidget);
    // Enter wrong IP
    await tester.enterText(find.byType(TextFormField), '192.168.31.256');
    await tester.pump();
    // Click on connect button
    await tester.tap(find.byType(MaterialButton));
    await tester.pump();
    // Verify error message printed
    expect(find.text('Please write a valid IP address!'), findsOneWidget);
    // Enter non-available IP
    await tester.enterText(find.byType(TextFormField), '192.168.31.200');
    await tester.pump();
    // Click on connect button
    await tester.tap(find.byType(MaterialButton));
    await tester.pump();
    // Verify screen didn't change
    expect(find.byType(MaterialButton), findsOneWidget);
  });

  // A test case for testing the tempo screen
  testWidgets('test tempo Screen', (WidgetTester tester) async {
    Widget testWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(home: new TempoSubscreen()));
    // Build tempo screen and trigger a frame
    await tester.pumpWidget(testWidget);
    // Verify Temperature is available
    expect(find.text('Temperature'), findsOneWidget);
    // Verify Humidity is available
    expect(find.text('Humidity'), findsOneWidget);
  });

  // A test case for testing the nodes screen
  testWidgets('test nodes Screen', (WidgetTester tester) async {
    Widget testWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(home: new NodesSubscreen()));
    // Build nodes screen and trigger a frame
    await tester.pumpWidget(testWidget);
  });
}
