import 'package:flutter_assignment/data/models/featured_model.dart';

class FeaturedItemService {
  static List<FeaturedItem> getFeaturedItems() {
    List<Map<String, dynamic>> itemsJson = [
      {
        "image":
            "https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady4.jpg?alt=media&token=2930fd86-19b0-4bed-8175-cbd4f7a65e83",
        "hasLike": false,
        "productName": "Turtleneck Sweater",
        "productPrice": "39.99",
      },
      {
        "image":
            "https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady5.jpg?alt=media&token=4aebda0f-9ebf-4ae8-a9af-05d45a31197d",
        "hasLike": false,
        "productName": "Long Sleeve Dress",
        "productPrice": "45.00",
      },
      {
        "image":
            "https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady6.png?alt=media&token=702d60b8-9bda-478c-8977-01752246e1eb",
        "hasLike": false,
        "productName": "Sportwear Set",
        "productPrice": "80.00",
      },
    ];

    return itemsJson
        .map((itemJson) => FeaturedItem.fromJson(itemJson))
        .toList();
  }
}
