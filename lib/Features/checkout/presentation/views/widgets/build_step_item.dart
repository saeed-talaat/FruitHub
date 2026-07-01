import 'package:flutter/widgets.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/in_active_step_item.dart';

class BuildStepItem extends StatelessWidget {
  const BuildStepItem({
    super.key,
    required this.text,
    required this.stepNumber,
    required this.isActive,
  });
  final String text;
  final int stepNumber;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InActiveStepItem(text: text, stepNumber: stepNumber),
      secondChild: ActiveStepItem(text: text),
      crossFadeState: isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: Duration(milliseconds: 300),
    );
  }
}
