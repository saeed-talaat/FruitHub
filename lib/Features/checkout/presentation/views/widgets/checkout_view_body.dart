import 'package:flutter/widgets.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_bottom.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  @override
  initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        children: [
          CheckoutSteps(pageController: pageController),
          SizedBox(height: 32),

          Expanded(
            child: CheckoutStepsPageView(pageController: pageController),
          ),
          CustomBottom(onPressed: () {
            pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }, text: 'التالي'),

          SizedBox(height: 100),
        ],
      ),
    );
  }
}
