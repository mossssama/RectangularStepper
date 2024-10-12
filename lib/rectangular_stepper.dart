library rectangular_stepper;

import 'package:flutter/material.dart';

class StepperRow extends StatelessWidget {
  final int numberOfSteps;
  final List<int> subStepsList;
  final int currentStep;
  final int currentSubStep;
  final double stepperWidth;
  final double stepperHeight;
  final double spaceBetweenSteps;
  final double spaceBetweenSubSteps;
  final Color activeColor;
  final Color passiveColor;
  final double borderRadius;
  final double sideMargin;
  final TextDirection textDirection;

  const StepperRow(
      {super.key,
      required this.numberOfSteps,
      required this.subStepsList,
      required this.currentStep,
      required this.currentSubStep,
      required this.stepperWidth,
      this.stepperHeight = 6,
      this.spaceBetweenSteps = 6,
      this.spaceBetweenSubSteps = 2,
      this.activeColor = Colors.blue,
      this.passiveColor = Colors.black12,
      this.borderRadius = 16.0,
      this.sideMargin = 10.0,
      this.textDirection = TextDirection.rtl});

  @override
  Widget build(BuildContext context) {
    double numberOfLostWidthBySteps = (numberOfSteps - 1) * spaceBetweenSteps;
    double numberOfLostWidthBySubSteps = 0;

    for (int i = 0; i < subStepsList.length; i++) {
      int currentValue = subStepsList[i];
      double calculatedValue = (currentValue - 1) * spaceBetweenSubSteps;
      numberOfLostWidthBySubSteps += calculatedValue;
    }

    double pureStepperWidth =
        stepperWidth - (numberOfLostWidthBySteps + numberOfLostWidthBySubSteps);
    return Transform.flip(
      flipX: (textDirection == TextDirection.ltr ? false : true),
      child: Padding(
        padding: EdgeInsets.only(left: sideMargin, right: sideMargin),
        child: Row(
          children: List.generate(
            numberOfSteps,
            (index) {
              if (index == numberOfSteps - 1) {
                return CustomStep(
                  numberOfSubSteps: subStepsList[index],
                  currentStep: currentStep,
                  stepIndex: index,
                  currentSubStep: currentSubStep,
                  customStepWidth:
                      ((pureStepperWidth - (2 * sideMargin)) / numberOfSteps),
                  spaceBetweenSubSteps: spaceBetweenSubSteps,
                  stepperHeight: stepperHeight,
                  activeColor: activeColor,
                  passiveColor: passiveColor,
                  borderRadius: borderRadius,
                );
              } else {
                return Padding(
                  padding: EdgeInsets.only(right: spaceBetweenSteps),
                  child: CustomStep(
                    numberOfSubSteps: subStepsList[index],
                    currentStep: currentStep,
                    stepIndex: index,
                    currentSubStep: currentSubStep,
                    customStepWidth:
                        ((pureStepperWidth - (2 * sideMargin)) / numberOfSteps),
                    spaceBetweenSubSteps: spaceBetweenSubSteps,
                    stepperHeight: stepperHeight,
                    activeColor: activeColor,
                    passiveColor: passiveColor,
                    borderRadius: borderRadius,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class CustomStep extends StatelessWidget {
  final int numberOfSubSteps;
  final int currentStep;
  final int currentSubStep;
  final int stepIndex;
  final double spaceBetweenSubSteps;
  final double customStepWidth;
  final double stepperHeight;
  final Color activeColor;
  final Color passiveColor;
  final double borderRadius;

  const CustomStep({
    super.key,
    required this.numberOfSubSteps,
    required this.currentStep,
    required this.currentSubStep,
    required this.stepIndex,
    required this.customStepWidth,
    required this.spaceBetweenSubSteps,
    required this.stepperHeight,
    required this.activeColor,
    required this.passiveColor,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        numberOfSubSteps,
        (index) {
          if (index == numberOfSubSteps - 1) {
            return CustomSubStep(
              numberOfSubStepsInStep: numberOfSubSteps,
              currentSubStep: currentSubStep,
              subStepIndex: index,
              currentStep: currentStep,
              stepIndex: stepIndex,
              subStepItemwidth: customStepWidth,
              widgetHeight: stepperHeight,
              activeColor: activeColor,
              passiveColor: passiveColor,
              borderRadius: borderRadius,
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(right: spaceBetweenSubSteps),
              child: CustomSubStep(
                subStepIndex: index,
                numberOfSubStepsInStep: numberOfSubSteps,
                currentSubStep: currentSubStep,
                currentStep: currentStep,
                stepIndex: stepIndex,
                subStepItemwidth: customStepWidth,
                widgetHeight: stepperHeight,
                activeColor: activeColor,
                passiveColor: passiveColor,
                borderRadius: borderRadius,
              ),
            );
          }
        },
      ),
    );
  }
}

class CustomSubStep extends StatefulWidget {
  final int numberOfSubStepsInStep;
  final int currentSubStep;

  final Color activeColor;
  final Color passiveColor;
  final double borderRadius;
  final int subStepIndex;
  final double widgetHeight;

  final double subStepItemwidth;

  final int currentStep;
  final int stepIndex;

  const CustomSubStep({
    super.key,
    required this.numberOfSubStepsInStep,
    required this.currentSubStep,
    required this.activeColor,
    required this.passiveColor,
    this.borderRadius = 16.0,
    required this.subStepIndex,
    required this.widgetHeight,
    required this.subStepItemwidth,
    required this.currentStep,
    required this.stepIndex,
  });

  @override
  State<CustomSubStep> createState() => _CustomSubStepState();
}

class _CustomSubStepState extends State<CustomSubStep> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (widget.subStepItemwidth / widget.numberOfSubStepsInStep),
      height: widget.widgetHeight,
      decoration: BoxDecoration(
        color: (widget.currentStep < widget.stepIndex)
            ? widget.passiveColor
            : ((widget.currentStep > widget.stepIndex)
                ? widget.activeColor
                : (widget.subStepIndex <= widget.currentSubStep)
                    ? widget.activeColor
                    : widget.passiveColor),
        borderRadius: BorderRadius.only(
          bottomRight:
              (widget.subStepIndex >= widget.numberOfSubStepsInStep - 1)
                  ? Radius.circular(widget.borderRadius)
                  : const Radius.circular(0.0),
          bottomLeft: (widget.subStepIndex <= 0)
              ? Radius.circular(widget.borderRadius)
              : const Radius.circular(0),
        ),
      ),
    );
  }
}
