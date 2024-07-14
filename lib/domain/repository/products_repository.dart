import 'package:products/domain/entity/products_api.dart';

abstract interface class ProductsRepository {
  Future<List<ProductsApi>> getProducts();
}