import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:fruits_ecommerce_app/core/helper_functions/get_dummy_porducts.dart';
import 'package:fruits_ecommerce_app/core/utils/app_text_styles.dart';
import 'package:fruits_ecommerce_app/core/utils/build_app_bar.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildAppBar(
                  text: 'الأكثر مبيعًا',
                  context: context,
                  showNotafication: true,
                ),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.topRight,
                  child: Text('الأكثر مبيعًا', style: AppTextStyles.bold16),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          ProductsGridView(products: getDummyProducts(),),
        ],
      ),
    );
  }
}
