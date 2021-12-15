import 'package:myshopify_api/myshopify_api.dart';
import 'package:myshopify_repository/myshopify_repository.dart';

class TagError implements Exception {}

class TagRequestError implements Exception {}

class ProductError implements Exception {}

class ProductRequestError implements Exception {}

class MyShopifyRepository {
  MyShopifyRepository({MyShopifyApi? shopifyApi})
      : _shopifyApi = shopifyApi ?? MyShopifyApi();

  final MyShopifyApi _shopifyApi;

  Future<List<Tag>> getTags() async {
    try {
      final response = await _shopifyApi.getProducts();
      final products =
          response.map((product) => Product.fromJson(product)).toList();
      final tags = <Tag>[];
      products.map((product) {
        final productTags = product.tags!.split(',');
        // ignore: avoid_function_literals_in_foreach_calls
        return productTags.forEach(
          (element) {
            final isExists = tags.where((tag) =>
                tag.name!.toLowerCase() == element.trim().toLowerCase());
            if (isExists.isEmpty) {
              tags.add(Tag.fromJson({'name': element.trim()}));
            }
          },
        );
      }).toList();
      tags.sort((a, b) => a.name!.compareTo(b.name!));
      return tags;
    } on HttpRequestError {
      throw TagRequestError();
    } on HttpError {
      throw TagError();
    } on Exception {
      throw TagError();
    }
  }

  Future<List<Product>> getProductsWithTag(String tag) async {
    try {
      final response = await _shopifyApi.getProducts();
      final products =
          response.map((product) => Product.fromJson(product)).toList();
      final tagsProduct = products
          .where((product) => product.tags!.contains(tag))
          .map((e) => e)
          .toList();
      return tagsProduct;
    } on HttpRequestError {
      throw ProductRequestError();
    } on HttpError {
      throw ProductError();
    } on Exception {
      throw ProductError();
    }
  }

  Future<Product> getProductsWithId(int id) async {
    try {
      final response = await _shopifyApi.getProducts();
      final products =
          response.map((product) => Product.fromJson(product)).toList();
      final product = products.where((product) => product.id == id).first;
      return product;
    } on HttpRequestError {
      throw ProductRequestError();
    } on HttpError {
      throw ProductError();
    } on Exception {
      throw ProductError();
    }
  }
}
