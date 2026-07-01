
import 'package:flutter/widgets.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/build_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentPageIndex, required this.pageController});
 final int currentPageIndex ;
 final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: getSteps().asMap().entries.map((e) {
        int stepNumber = e.key + 1;
        return GestureDetector(
          onTap: () {
           pageController.animateToPage(
              e.key,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: BuildStepItem(
            text: e.value,
            stepNumber: stepNumber,
            isActive: currentPageIndex >= e.key ? true : false,
          ),
        );
      }).toList(),
    );
  }
}


List<String> getSteps() {
  return ['الشحن', 'العنوان', 'الدفع'];
}
