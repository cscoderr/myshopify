part of 'product_notifier.dart';

enum ProductStatus {
  initial,
  loading,
  success,
  failure,
}

class ProductState extends Equatable {
  const ProductState({
    this.status = ProductStatus.initial,
    this.products = const [],
    this.errorMessage = '',
  });

  ProductState copyWith({
    ProductStatus? status,
    List<Product>? products,
    String? errorMessage,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  final ProductStatus status;
  final List<Product> products;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, products, errorMessage];
}
