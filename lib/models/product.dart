class Product {
  List<String>? productImages;
  String? sId;
  String? name;
  String? description;
  Category? category;
  int? price;
  int? quantity;
  List<String>? images;
  List<String>? reviews;
  int? iV;
  bool? isFavourite;

  Product({
    this.productImages,
    this.sId,
    this.name,
    this.description,
    this.category,
    this.price,
    this.quantity,
    this.images,
    this.reviews,
    this.iV,
    this.isFavourite,
  });

  Product.fromJson(Map<String, dynamic> json) {
    if (json['product_images'] != null) {
      productImages = <String>[];
      json['product_images'].forEach((v) {
        productImages!.add(v);
      });
    }
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    price = json['price'];
    quantity = json['quantity'];
    images = json['images'].cast<String>();
    if (json['reviews'] != null) {
      reviews = <String>[];
      json['reviews'].forEach((v) {
        reviews!.add(v);
      });
    }
    iV = json['__v'];
    isFavourite = json['isFavourite'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productImages != null) {
      data['product_images'] = this.productImages!.map((v) => v).toList();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['images'] = this.images;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Category {
  String? categoryAvatar;
  String? sId;
  String? name;
  String? description;
  String? avatar;
  int? iV;

  Category(
      {this.categoryAvatar,
      this.sId,
      this.name,
      this.description,
      this.avatar,
      this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    categoryAvatar = json['category_avatar'];
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    avatar = json['avatar'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_avatar'] = this.categoryAvatar;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['avatar'] = this.avatar;
    data['__v'] = this.iV;
    return data;
  }
}
