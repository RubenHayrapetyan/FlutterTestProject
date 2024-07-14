import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../../domain/entity/products_api.dart';

part 'products_api_service.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com/')
abstract class ProductsApiService {
  factory ProductsApiService(Dio dio, {String baseUrl}) = _ProductsApiService;

  @GET('products')
  Future<List<ProductsApi>> getProducts();
}
