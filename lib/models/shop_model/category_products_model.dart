class CategoryProductsModel {
  bool? status;
  Null? message;
  Data? data;

  CategoryProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<CatProduct>? data;
  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CatProduct>[];
      json['data'].forEach((v) {
        data!.add(CatProduct.fromJson(v));
      });
    }
  }

}

class CatProduct {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  bool? inFavorites;
  bool? inCart;


  CatProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
