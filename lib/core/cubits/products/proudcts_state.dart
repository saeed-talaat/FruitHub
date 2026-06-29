part of 'proudcts_cubit.dart';


abstract class ProudctsState {}

final class ProudctsInitial extends ProudctsState {}
final class ProudctsLoading extends ProudctsState {}
final class ProudctsFailure extends ProudctsState {
  final String errorMessage;

  ProudctsFailure({required this.errorMessage});
}
final class ProudctsSuccess extends ProudctsState {
  final List<ProductEntity> products;
  final int productsLength;

  ProudctsSuccess({required this.products, required this.productsLength});
}


