import 'package:flutter/material.dart';

class StepperBottomControllers extends StatelessWidget {
  final VoidCallback? onStepCancel, onStepContinue;

  StepperBottomControllers(
      {Key? key, required this.onStepCancel, required this.onStepContinue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton.extended(
          onPressed: onStepCancel,
          icon: const Icon(Icons.arrow_back),
          backgroundColor: Colors.green,
          label: const Text('Back'),
          foregroundColor: Colors.white,
        ),
        const SizedBox(
          width: 20,
        ),
        FloatingActionButton.extended(
          onPressed: onStepContinue,
          icon: const Icon(Icons.arrow_forward),
          backgroundColor: Colors.green,
          label: const Text('Next'),
          foregroundColor: Colors.white,
        ),
      ],
    );
  }
}
