import 'package:products/domain/entity/products_api.dart';

abstract interface class ProductsUseCase {
  Future<List<ProductsApi>> getProducts();
}