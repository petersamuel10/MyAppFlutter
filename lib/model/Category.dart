class Category {
  final String categoryId;
  final String categoryIcon;
  final String categoryTitleAr;
  final String categoryTitleEn;

  Category(
      {this.categoryId,
      this.categoryIcon,
      this.categoryTitleAr,
      this.categoryTitleEn});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'],
      categoryIcon: json['category_icon'],
      categoryTitleAr: json['category_title_ar'],
      categoryTitleEn: json['category_title_en'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["category_id"] = categoryId;
    map["category_icon"] = categoryIcon;
    map["category_title_ar"] = categoryTitleAr;
    map["category_title_en"] = categoryTitleEn;

    return map;
  }
}
