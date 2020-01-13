class Product {
  final String productId;
  final String productTitleAr;
  final String productTitleEn;
  final String productPrice;
  final String productDiscount;
  final String productImg;

  Product({
    this.productId,
    this.productTitleAr,
    this.productTitleEn,
    this.productPrice,
    this.productDiscount,
    this.productImg,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        productId: json['product_id'],
        productTitleAr: json['product_title_ar'],
        productTitleEn: json['product_title_en'],
        productPrice: json['product_price'],
        productDiscount: json['product_discount'],
        productImg: json['product_img']);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["category_id"] = productId;
    map["product_title_ar"] = productTitleAr;
    map["product_title_en"] = productTitleEn;
    map["product_price"] = productPrice;
    map["product_discount"] = productDiscount;
    map["product_img"] = productImg;

    return map;
  }
}
