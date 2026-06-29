import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:fruits_ecommerce_app/core/cubits/products/proudcts_cubit.dart';
import 'package:fruits_ecommerce_app/core/helper_functions/get_dummy_porducts.dart';
import 'package:fruits_ecommerce_app/core/widgets/custom_error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridViewBlocConsumer extends StatelessWidget {
  const BestSellingGridViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProudctsCubit, ProudctsState>(
      builder: (context, state) {
        
        if (state is ProudctsFailure) {
          return SliverToBoxAdapter(child: CustomErrorWidget(errorMessage: state.errorMessage));
        }
        else if (state is ProudctsSuccess){
          return BestSellingGridView(products: state.products,);
        }
        else{
          return Skeletonizer.sliver(
            enabled: true,
            child: BestSellingGridView(products: getDummyProducts(),));
        }
      },
    );
  }
}
