part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductFetch extends ProductsState {
  final List<Product> product;

  const ProductFetch({required this.product});
}
