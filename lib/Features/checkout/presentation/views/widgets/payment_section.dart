import 'package:flutter/widgets.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/address_summry_widget.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/order_summry_widget.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ملخص الطلب :', style: AppTextStyles.bold13),
        SizedBox(height: 8),
        OrderSummryWidget(),
        SizedBox(height: 16),
        AddressSummryWidget(),
      ],
    );
  }
}

