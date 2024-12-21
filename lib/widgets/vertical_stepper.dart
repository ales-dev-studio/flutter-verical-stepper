import 'package:flutter/material.dart';

class VerticalStepper extends StatelessWidget {
  const VerticalStepper({
    super.key,
    required this.currentStepIndex,
    required this.stepTitles,
    required this.stepDescriptions,
    required this.onTap,
    this.trailing,
    this.passedStepsBackgroundColor,
    this.currentStepBackgroundColor,
    this.nextStepsBackgroundColor,
    this.stepTextColor,
    this.headerTextStyle,
    this.descriptionTextStyle,
  });

  final int currentStepIndex;
  final List<String> stepTitles;
  final List<String> stepDescriptions;
  final ValueChanged<int> onTap;
  final Widget? trailing;
  final Color? passedStepsBackgroundColor;
  final Color? currentStepBackgroundColor;
  final Color? nextStepsBackgroundColor;
  final Color? stepTextColor;
  final TextStyle? headerTextStyle;
  final TextStyle? descriptionTextStyle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stepTitles.length,
      itemBuilder: (context, stepIndex) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                onTap(stepIndex);
              },
              leading: CircleAvatar(
                backgroundColor: stepIndex < currentStepIndex
                    ? passedStepsBackgroundColor
                    : stepIndex == currentStepIndex
                        ? currentStepBackgroundColor
                        : nextStepsBackgroundColor,
                child: stepIndex < currentStepIndex
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : Text(
                        (stepIndex + 1).toString(),
                        style: TextStyle(
                          color: stepTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
              ),
              title: Text(
                stepTitles[stepIndex],
                style: headerTextStyle ??
                    const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              trailing: trailing,
            ),
            if (stepIndex + 1 != stepTitles.length ||
                currentStepIndex + 1 == stepTitles.length) ...[
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: stepIndex == currentStepIndex ? 8.0 : 0,
                        ),
                        child: const VerticalDivider(),
                      ),
                      const SizedBox(
                        width: 32.0,
                      ),
                      if (stepIndex == currentStepIndex)
                        Expanded(
                          child: Text(
                            stepDescriptions[stepIndex],
                            style: descriptionTextStyle,
                          ),
                        )
                      else
                        const SizedBox(
                          height: 32.0,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
