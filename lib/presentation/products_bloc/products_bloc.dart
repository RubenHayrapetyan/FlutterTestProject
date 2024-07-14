import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/domain/entity/products_api.dart';
import 'package:products/domain/usecase/products_use_case.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsUseCase productsUseCase;

  ProductsBloc(this.productsUseCase) : super(ProductsInitial()) {
    on<GetProducts>((event, emit) async {
      emit(ProductsLoading());
      try {
        final products = await productsUseCase.getProducts();
        emit(ProductsSuccess(products));
      } catch (e) {
        emit(ProductsFailure("Failed 0to load products: $e"));
      }
    });
  }
}
