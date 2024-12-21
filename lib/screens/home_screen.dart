import 'package:flutter/material.dart';
import 'package:vertical_stepper/widgets/vertical_stepper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentStepIndex = 0;

  final List<String> stepTitles = [
    'Authentication',
    'Address Verification',
    'Bank credit check',
    'Send images of documents',
    "Physical sending of documents",
    'Pending review',
    'Getting a loan',
  ];
  final List<String> stepDescriptions = [
    'Enter your identity information. This information is used to identify and authenticate your identity with the financial institution that provides credit, and your information will be preserved.',
    'Enter your address information accurately. This information is used to identify you and your location with the credit provider financial institution, and your information will be kept safe.',
    'Bank credit shows the credit of each person with the central bank, that in order to receive a loan, you must have good credit.',
    'After preparing the documents, record and send the images of the required documents, note that all the images are recorded in high quality.',
    'Send the required documents by post to our address. Note that if you do not send within the next five days, your request will expire.',
    'All required information and documents have been received successfully. Please wait for the review and approval of our experts.',
    'Your requested loan has been allocated and will be added to your wallet at the appointed time. Now you can buy from hundreds of stores contracted with us.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Steps to get a loan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: VerticalStepper(
          currentStepIndex: currentStepIndex,
          stepTitles: stepTitles,
          stepDescriptions: stepDescriptions,
          onTap: (final int value) {
            setState(() {
              currentStepIndex = value;
            });
          },
          passedStepsBackgroundColor: Colors.green,
          currentStepBackgroundColor: Colors.blue,
          nextStepsBackgroundColor: Colors.grey,
          stepTextColor: Colors.white,
        ),
      ),
    );
  }
}
