import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_ecommerce_app/Features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> with AutomaticKeepAliveClientMixin {

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var order = context.read<OrderEntity>();
    return Column(
      children: [
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
              order.payWitchCash  = true;
            });
          },
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '${order.cartEntity.calclateTotalPrice() + 60} جنيه',
          isSelected: selectedIndex == 0,
        ),
        SizedBox(height: 16),

        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
              order.payWitchCash  = false;
            });
          },
          title: 'الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: '${order.cartEntity.calclateTotalPrice()} جنيه',
          isSelected: selectedIndex == 1,
        ),
      ],
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
