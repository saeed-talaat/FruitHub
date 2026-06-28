import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:fruits_ecommerce_app/core/cubits/products/proudcts_cubit.dart';
import 'package:fruits_ecommerce_app/core/repos/products_repo.dart';
import 'package:fruits_ecommerce_app/core/services/get_it_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProudctsCubit(productsRepo: getIt<ProductsRepo>()),
      child: HomeViewBody(),
    );
  }
}
