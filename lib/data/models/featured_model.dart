class FeaturedItem {
  final String image;
  final bool hasLike;
  final String productName;
  final String productPrice;

  FeaturedItem({required this.image, required this.hasLike, required this.productName, required this.productPrice});

  factory FeaturedItem.fromJson(Map<String, dynamic> json) {
    return FeaturedItem(
      image: json['image'],
      hasLike: json['hasLike'],
      productName: json['productName'],
      productPrice: json['productPrice'],
    );
  }
}
