## Installation:

To use Rectangular Stepper in your project, add the following line to your pubspec.yaml file:

```yaml
dependencies:
  rectangular_stepper: ^<version> (replace with the latest version)
```

## Screenshots:

This is how the Rectangular Stepper will look in your app:

![Rectangular Stepper Example](https://github.com/mossssama/RectangularStepper/raw/main/assets/example_screenshot.png)

## Usage:

Here's an example of how to use the StepperRow widget:

```dart
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rectangular Stepper'),
        ),
        body: Column(
          children: [
            StepperRow(
                numberOfSteps: 4,
                subStepsList: const [4, 2, 3, 1],
                currentStep: 2,
                currentSubStep: 1,
                stepperWidth: MediaQuery.of(context).size.width,
                textDirection: TextDirection.rtl),
          ],
        ),
      ),
    );
  }
}
```

This code snippet creates a horizontal stepper with four main steps and varying sub-steps for each step. You can customize the following properties of the StepperRow widget:

- numberOfSteps: The total number of main steps in the process.
- subStepsList: A list containing the number of sub-steps for each main step.
- currentStep: The index of the currently active main step (starts from 0).
- currentSubStep: The index of the currently active sub-step within the current main step (starts from 0).
- stepperWidth: The desired width of the stepper widget.
- textDirection: The text direction (e.g., TextDirection.ltr for left-to-right, TextDirection.rtl for right-to-left).


## Additional Features:

- Customizable appearance: You can modify the colors, border styles, and text styles of the stepper to match your application's design.
- RTL/LTR support: The stepper can be displayed in both right-to-left & left-to-right layouts.


## Getting Started:

For detailed usage instructions, customization options, and further examples, please refer to the pub.dev package page (link will be available once published).