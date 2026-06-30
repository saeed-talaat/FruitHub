import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/products_grid_view_bloc_consumer.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/products_view_header.dart';
import 'package:fruits_ecommerce_app/constant.dart';
import 'package:fruits_ecommerce_app/core/cubits/products/proudcts_cubit.dart';
import 'package:fruits_ecommerce_app/core/utils/build_app_bar.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_search_text_field.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProudctsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 16),
                buildAppBar(
                  text: 'ألمنتجات',
                  context: context,
                  showArrow: false,
                ),
                const SizedBox(height: 16),
                CustomSearchTextField(),
                const SizedBox(height: 16),
                BlocBuilder<ProudctsCubit, ProudctsState>(
                  builder: (context, state) {
                    return ProductsViewHeader(
                      numberOfProducts: state is ProudctsSuccess
                          ? state.productsLength
                          : 0,
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          ProductsGridViewBlocConsumer(),
        ],
      ),
    );
  }
}
