import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_ecommerce_app/core/entity/product_entity.dart';
import 'package:fruits_ecommerce_app/core/errors/failures.dart';
import 'package:fruits_ecommerce_app/core/model/product_model.dart';
import 'package:fruits_ecommerce_app/core/repos/products_repo.dart';
import 'package:fruits_ecommerce_app/core/services/database_service.dart';
import 'package:fruits_ecommerce_app/core/utils/backend_endpoint.dart';

class ProductsRepoImple implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImple({required this.databaseService});

  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =
          await databaseService.getData(
                path: BackendEndpoint.getProducts,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductModel> products = data
          .map((e) => ProductModel.fromJson(json: e))
          .toList();
      List<ProductEntity> productsEntity = products
          .map((e) => e.toEntity())
          .toList();

      return right(productsEntity);
    } catch (e) {
      log('Exception in  ProductsRepoImple.getBestSellingProducts : ${e.toString()}');
      return left(ServerFailure(errorMessage: 'Failed to get getBestSellingProducts '));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getData(path: BackendEndpoint.getProducts)
              as List<Map<String, dynamic>>;
      List<ProductModel> products = data
          .map((e) => ProductModel.fromJson(json: e))
          .toList();
      List<ProductEntity> productsEntity = products
          .map((e) => e.toEntity())
          .toList();

      return right(productsEntity);
    } catch (e) {
      log('Exception in  ProductsRepoImple.getProducts : ${e.toString()}');
      return left(ServerFailure(errorMessage: 'Failed to get products'));
    }
  }
}
