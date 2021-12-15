part of 'details_notifier.dart';

enum DetailsStatus {
  initial,
  loading,
  success,
  failure,
}

class DetailsState extends Equatable {
  const DetailsState({
    this.status = DetailsStatus.initial,
    this.product,
  });

  DetailsState copyWith({
    DetailsStatus? status,
    Product? product,
  }) {
    return DetailsState(
      status: status ?? this.status,
      product: product ?? this.product,
    );
  }

  final DetailsStatus status;
  final Product? product;

  @override
  List<Object?> get props => [status, product];
}
