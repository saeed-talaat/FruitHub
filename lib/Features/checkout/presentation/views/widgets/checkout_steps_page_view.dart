import 'package:flutter/widgets.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/address_section.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/review_section.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getSteps().length,
        itemBuilder: (context, index) {
          return getPages()[index];
        },
      ),
    );
  }
  List<Widget> getPages() {
    return [
      const ShippingSection(),
      const AddressSection(),
      const PaymentSection(),
      const ReviewSection(),
    ];
  }
}
