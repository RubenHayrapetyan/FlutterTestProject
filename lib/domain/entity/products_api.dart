import 'package:json_annotation/json_annotation.dart';

part 'products_api.g.dart';

@JsonSerializable()
class ProductsApi {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductsApi({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  }) {
    // Set default value if title is null
    id ??= -1;
    title ??= '';
    price ??= 0.0;
    description ??= '';
    category ??= '';
    image ??= '';
    rating ??= Rating(rate: 0.0, count: -1);
  }

  factory ProductsApi.fromJson(Map<String, dynamic> json) =>
      _$ProductsApiFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsApiToJson(this);
}

@JsonSerializable()
class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
