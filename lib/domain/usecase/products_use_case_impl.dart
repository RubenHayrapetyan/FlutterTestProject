import 'package:products/domain/entity/products_api.dart';
import 'package:products/domain/repository/products_repository.dart';
import 'package:products/domain/usecase/products_use_case.dart';

class ProductsUseCaseImpl implements ProductsUseCase {
  ProductsRepository productsRepository;
  ProductsUseCaseImpl(this.productsRepository);

  @override
  Future<List<ProductsApi>> getProducts() async {
    final products = await productsRepository.getProducts();
    products.sort((a, b) => (a.category ?? '').compareTo(b.category ?? ''));
    return products;
  }
}