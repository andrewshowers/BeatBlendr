import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musicproject/insert_data_page.dart';

// this test makes sure the user can enter data into the text fields and the dropdown menu. It DOES NOT TEST FOR INSERTING DATA INTO THE LIST. insert_data_test.dart tests for that.
void main() {
  testWidgets('testing the insert song feature', (tester) async {
    //setup

    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: InsertionPage()))); // this pumps the widget into the tester
    // do

    await tester.enterText(find.byType(TextField).first,
        'test title'); // this finds the first text field and enters the text 'test title'
    await tester.enterText(find.byType(TextField).at(1),
        'test artist'); // this finds the second text field and enters the text 'test artist'

    await tester.tap(find.byType(DropdownButtonFormField<
        String>)); // this finds the dropdown button and taps it
    await tester
        .pumpAndSettle(); // this finds the first item in the dropdown menu and taps it
    await tester
        .tap(find.text('Classical')); // finds the text 'Classical' and taps it
    await tester.pumpAndSettle(); // this waits for the animation to finish

    final titleFinder = find.text('test title');
    final artistFinder = find.text('test artist');
    final genreFinder = find.text('Classical');

    expect(titleFinder, findsOneWidget);
    expect(artistFinder, findsOneWidget);
    expect(genreFinder, findsOneWidget);
  });
}
