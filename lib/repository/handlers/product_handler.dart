import 'dart:developer';
import 'dart:io';

import 'package:agridoc/models/cart.dart';
import 'package:agridoc/models/favourites.dart';
import 'package:agridoc/models/product.dart';
import 'package:agridoc/repository/services/api_request.dart';
import 'package:get/get.dart';

class ProductHandler {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Product>> getProducts(String category) async {
    List<Product> products = [];
    final response = await _helper.get('product/get', category) as List;

    products = response.map((e) => Product.fromJson(e)).toList();
    print(products);
    Future.delayed(Duration(seconds: 3));
    return products;
  }

  Future<bool> addToFavourites(String productId) async {
    final response = await _helper
        .post('f/fav', {"pid": productId, "uid": "636168e2bff7e5c064790323"});

    log(response.toString());
    if (response != null) {
      return true;
    }
    return false;
  }

  Future<bool> deleteFavourites(String productId) async {
    final response = await _helper.post(
        'f/delete', {"pid": productId, "uid": "636168e2bff7e5c064790323"});

    log(response.toString());
    if (response != null) {
      return true;
    }
    return false;
  }

  Future<List<Favourite>> getFavourites() async {
    List<Favourite> products = [];
    final response = (await _helper
        .post('f/get', {"uid": "636168e2bff7e5c064790323"}))['result'] as List;

    products = response.map((e) => Favourite.fromJson(e)).toList();
    print(products);

    return products;
  }

  Future addToCart(String product, int quantity) async {
    try {
      final response = (await _helper.post('cart/add', {
        "product": product,
        "quantity": quantity,
        "userEmail": "parbat@gmail.com"
      }));

      Get.snackbar("Success", "product added to cart");
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future<List<cart>> getCart() async {
    List<cart> products = [];
    final response = (await _helper.post(
        'cart/get', {"userEmail": "parbat@gmail.com"}))['message'] as List;

    products = response.map((e) => cart.fromJson(e)).toList();
    print(products);

    return products;
  }

  Future addDelivery(Map<String, dynamic> deliveryDetails) async {
    try {
      final response = await _helper.post('delivery/add', deliveryDetails);
      log(response.toString());
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
