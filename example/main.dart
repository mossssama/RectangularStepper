import 'package:flutter/material.dart';
import 'package:rectangular_stepper/rectangular_stepper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rectangular Stepper'),
        ),
        body: Column(
          children: [
            const Center(child: Text('LTR Stepper')),
            const SizedBox(
              height: 8,
            ),
            StepperRow(
                numberOfSteps: 4,
                subStepsList: const [4, 2, 3, 1],
                currentStep: 2,
                currentSubStep: 1,
                stepperWidth: MediaQuery.of(context).size.width,
                textDirection: TextDirection.ltr),
            const SizedBox(
              height: 30,
            ),
            const Center(child: Text('RTL Stepper')),
            const SizedBox(
              height: 8,
            ),
            StepperRow(
                numberOfSteps: 5,
                subStepsList: const [3, 4, 2, 3, 1],
                currentStep: 1,
                currentSubStep: 2,
                stepperWidth: MediaQuery.of(context).size.width,
                textDirection: TextDirection.rtl),
          ],
        ),
      ),
    );
  }
}
