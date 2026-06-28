import 'package:dartz/dartz.dart';
import 'package:fruits_ecommerce_app/core/entity/product_entity.dart';
import 'package:fruits_ecommerce_app/core/errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failures , List<ProductEntity>>> getProducts();
  Future<Either<Failures , List<ProductEntity>>> getBestSellingProducts();
}