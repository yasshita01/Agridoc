import 'package:agridoc/models/product.dart';

class cart {
  String? sId;
  Product? product;
  int? quantity;
  String? buyerEmail;
  int? iV;

  cart({this.sId, this.product, this.quantity, this.buyerEmail, this.iV});

  cart.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    buyerEmail = json['buyerEmail'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['quantity'] = this.quantity;
    data['buyerEmail'] = this.buyerEmail;
    data['__v'] = this.iV;
    return data;
  }
}
