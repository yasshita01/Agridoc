import 'dart:developer';

import 'package:agridoc/models/product.dart';
import 'package:agridoc/repository/handlers/product_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      emit(ProductsInitial());
      if (event is ProductFetchEvent) {
        try {
          var data = await ProductHandler().getProducts(event.category);

          emit(ProductFetch(product: data));
        } catch (e) {
          log(e.toString());
          log("Product Fetch error");
        }
      }
    });
  }
}
