part of 'products_bloc.dart';

@immutable
sealed class ProductsState {
  const ProductsState();
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductsApi> productsApi;
  const ProductsSuccess(this.productsApi);
}

final class ProductsFailure extends ProductsState {
  final String message;
  const ProductsFailure(this.message);
}