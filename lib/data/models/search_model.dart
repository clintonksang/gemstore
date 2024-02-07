class SearchModel {
  final String image;
  final String productName;
  final String productPrice;
  final String reviews;
  final bool hasLike;
  final int starCount;

  SearchModel({
    required this.image,
    required this.productName,
    required this.reviews,
    required this.productPrice,
    required this.hasLike,
    required this.starCount,
  });
}
