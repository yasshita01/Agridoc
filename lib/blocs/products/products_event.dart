part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class ProductFetchEvent extends ProductsEvent {
  final String category;

  const ProductFetchEvent({required this.category});

  @override
  List<Object> get props => [category];
}
