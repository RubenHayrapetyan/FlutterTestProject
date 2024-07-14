import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/di/di.dart';
import 'package:products/extentitons/uppercase.dart';
import 'package:products/presentation/products_bloc/products_bloc.dart';
import 'package:products/presentation/ui/product_details_ui.dart';

class ProductsUI extends StatelessWidget {
  const ProductsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(getIt())..add(GetProducts()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductsSuccess) {
              return ListView.builder(
                itemCount: state.productsApi.length,
                itemBuilder: (context, index) {
                  final product = state.productsApi[index];
                  String title = product.title ?? '';
                  String productImg = product.image ?? '';
                  String category = product.category?.capitalize() ?? '';
                  String price = product.price?.toString() ?? '';
                  int rating = product.rating?.count ?? 0;
                  double rate = product.rating?.rate ?? 0.0;

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsUI(product: product),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(title),
                      subtitle: Row(
                        children: [
                          Image.network(
                            productImg,
                            width: 120,
                            height: 120,
                            fit: BoxFit.fill,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    category,
                                    softWrap: true,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text('Price: $price'),
                                  Text('Rate count: $rating'),
                                  Text('Rate: $rate'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is ProductsFailure) {
              return Center(
                child: Text('Failed to load products: ${state.message}'),
              );
            } else {
              return const Center(
                child: Text('Unknown state')
              );
            }
          },
        ),
      ),
    );
  }
}
