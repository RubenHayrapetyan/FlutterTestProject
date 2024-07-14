import 'package:products/domain/entity/products_api.dart';
import 'package:products/data/service/products_api_service.dart';
import 'package:products/domain/repository/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  ProductsApiService productsApiService;
  ProductsRepositoryImpl(this.productsApiService);

  @override
  Future<List<ProductsApi>> getProducts() async {
    final products = await productsApiService.getProducts();
    return products;
  }
}