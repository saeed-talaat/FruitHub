import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce_app/core/entity/product_entity.dart';
import 'package:fruits_ecommerce_app/core/repos/products_repo.dart';

part 'proudcts_state.dart';

class ProudctsCubit extends Cubit<ProudctsState> {
  ProudctsCubit({required this.productsRepo}) : super(ProudctsInitial());

  final ProductsRepo productsRepo;

  Future<void> getBestSellingProducts() async {
    emit(ProudctsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProudctsFailure(errorMessage: failure.errorMessage)),
      (products) {
        emit(ProudctsSuccess(products: products, productsLength: products.length ));
        
      },
    );
  }

  Future<void> getProducts() async {
    emit(ProudctsLoading());
    final result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProudctsFailure(errorMessage: failure.errorMessage)),
      (products) {
        emit(ProudctsSuccess(products: products, productsLength:  products.length));
        
      },
    );
  }
}
