import 'package:flutter/widgets.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/build_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: getSteps().asMap().entries.map((e) {
        int stepNumber = e.key + 1;
        return BuildStepItem(
          text: e.value,
          stepNumber: stepNumber,
          isActive: pageController.hasClients
              ? (  pageController.page!.round() >= e.key ? true : false)
              : false,
        );
      }).toList(),
    );
  }
}

List<String> getSteps() {
  return ['الشحن', 'العنوان', 'الدفع', 'المراجعه'];
}
