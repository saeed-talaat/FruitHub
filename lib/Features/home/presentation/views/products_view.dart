import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/products_view_body.dart';
import 'package:fruits_ecommerce_app/core/cubits/products/proudcts_cubit.dart';
import 'package:fruits_ecommerce_app/core/repos/products_repo.dart';
import 'package:fruits_ecommerce_app/core/services/get_it_service.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProudctsCubit(productsRepo: getIt<ProductsRepo>()),
        child: ProductsViewBody(),
      ),
    );
  }
}
