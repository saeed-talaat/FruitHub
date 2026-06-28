import 'package:fruits_ecommerce_app/Features/auth/data/repos/auth_repo_imple.dart';
import 'package:fruits_ecommerce_app/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_ecommerce_app/core/repos/products_repo.dart';
import 'package:fruits_ecommerce_app/core/repos/products_repo_imple.dart';
import 'package:fruits_ecommerce_app/core/services/database_service.dart';
import 'package:fruits_ecommerce_app/core/services/firebase_auth_service.dart';
import 'package:fruits_ecommerce_app/core/services/firestore_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<DatabaseService>(FirestoreService());
   getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImple(databaseService: getIt<DatabaseService>()));
 
  
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImple(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
}
