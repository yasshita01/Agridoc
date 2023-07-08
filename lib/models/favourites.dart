class Favourite {
  String? sId;
  ProductId? productId;
  String? userId;
  int? iV;

  Favourite({this.sId, this.productId, this.userId, this.iV});

  Favourite.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productId = json['product_id'] != null
        ? new ProductId.fromJson(json['product_id'])
        : null;
    userId = json['user_id'];
    iV = json['__v'];
  }
}

class ProductId {
  List<Null>? productImages;
  String? sId;
  String? name;
  String? description;
  String? category;
  int? price;
  int? quantity;
  List<String>? images;
  List<Null>? reviews;
  int? iV;

  ProductId(
      {this.productImages,
      this.sId,
      this.name,
      this.description,
      this.category,
      this.price,
      this.quantity,
      this.images,
      this.reviews,
      this.iV});

  ProductId.fromJson(Map<String, dynamic> json) {
    if (json['product_images'] != null) {
      productImages = <Null>[];
      json['product_images'].forEach((v) {
        productImages!.add(v);
      });
    }
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    quantity = json['quantity'];
    images = json['images'].cast<String>();

    iV = json['__v'];
  }
}
