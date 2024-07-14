import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:products/data/repository/products_repository_impl.dart';
import 'package:products/data/service/products_api_service.dart';
import 'package:products/domain/repository/products_repository.dart';
import 'package:products/domain/usecase/products_use_case.dart';
import 'package:products/domain/usecase/products_use_case_impl.dart';
import 'package:products/presentation/products_bloc/products_bloc.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerFactory(() => ProductsApiService(getIt()));
  getIt.registerFactory<ProductsRepository>(
          () => ProductsRepositoryImpl(getIt()));
  getIt.registerFactory<ProductsUseCase>(() => ProductsUseCaseImpl(getIt()));
  getIt.registerFactory(() => ProductsBloc(getIt()));
  getIt.registerFactory(() => ProductsUseCaseImpl(getIt()));
}
