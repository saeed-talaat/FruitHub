import 'package:flutter/widgets.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '40 جنيه',
          isSelected: selectedIndex == 0,
        ),
        SizedBox(height: 16),

        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          title: 'الدفع الالكتروني',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: 'مجاني',
          isSelected: selectedIndex == 1,
        ),
      ],
    );
  }
}
