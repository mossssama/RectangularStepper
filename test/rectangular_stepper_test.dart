import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rectangular_stepper/rectangular_stepper.dart';

void main() {
  testWidgets(
      'RectangularStepperRow displays correct number of steps and sub-steps',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RectangularStepperRow(
            numberOfSteps: 4,
            subStepsList: [4, 2, 3, 1],
            currentStep: 2,
            currentSubStep: 1,
            stepperWidth: 500,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );

    expect(find.byType(CustomStep), findsNWidgets(3));
  });
}
