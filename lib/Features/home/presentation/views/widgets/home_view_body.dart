import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/featured_list.dart';
import 'package:fruits_ecommerce_app/constant.dart';
import 'package:fruits_ecommerce_app/core/cubits/products/proudcts_cubit.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_search_text_field.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  @override
  void initState() {
    super.initState();
    context.read<ProudctsCubit>().getBestSellingProducts();
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
                CustomHomeAppBar(),
                const SizedBox(height: 16),
                CustomSearchTextField(),
                const SizedBox(height: 16),
                const FeaturedList(),
                const SizedBox(height: 12),
                const BestSellingHeader(),
                const SizedBox(height: 12),
                
              ],
            ),
          ),
          BestSellingGridView(number: 6,)
        ],
      ),
    );
  }
}