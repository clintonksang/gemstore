class SearchModel {
  final String image;
  final String productName;
  final String productPrice;
  final bool hasLike;
  final int starCount;

  SearchModel({
    required this.image,
    required this.productName,
    required this.productPrice,
    required this.hasLike,
    required this.starCount,
  });
}
