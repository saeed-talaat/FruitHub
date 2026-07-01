import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:fruits_ecommerce_app/core/helper_functions/show_snack_bar.dart';
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
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        children: [
          CheckoutSteps(
            currentPageIndex: currentPageIndex,
            pageController: pageController,
          ),
          SizedBox(height: 32),

          Expanded(
            child: CheckoutStepsPageView(pageController: pageController),
          ),
          CustomBottom(
            onPressed: () {
              if (context.read<OrderEntity>().payWitchCash != null) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
              else{
                showErrorSnackBar(context, 'يرجي تحديد طريقه الدفع');
              }
            },
            text: getNextButtonText(currentPageIndex),
          ),

          SizedBox(height: 100),
        ],
      ),
    );
  }
}

String getNextButtonText(int currentPageIndex) {
  if (currentPageIndex == 0) {
    return 'التالي';
  } else if (currentPageIndex == 1) {
    return 'التالي';
  } else {
    return 'الدفع عبر PayPal';
  }
}
