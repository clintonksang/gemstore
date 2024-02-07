import 'package:flutter_assignment/data/models/search_model.dart';

List<SearchModel> fetchDressItems() {
  return [
    SearchModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady9.jpg?alt=media&token=2116ff29-8c28-4183-87cb-f41c6927853b',
      productName: 'Linen Dress',
      productPrice: '52.00',
      hasLike: true,
      starCount: 6,
      reviews: '64',
    ),
    SearchModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady10.jpg?alt=media&token=1d1be72e-cb8e-4519-bfcb-46c1ef110255',
      productName: 'Filted Waist Dress',
      productPrice: '47.99',
      hasLike: false,
      starCount: 5,
      reviews: '53',
    ),
    SearchModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady11.jpg?alt=media&token=48a9c5fa-a2c0-428d-ba1d-99021d5c172a',
      productName: 'Maxi Dress',
      productPrice: '68.00',
      hasLike: false,
      starCount: 4,
      reviews: '46',
    ),
    SearchModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady12.jpg?alt=media&token=a690826a-49d2-4ab2-b13b-06b04dabc4e1',
      productName: 'Front Tie Mini Dress',
      productPrice: '59.00',
      hasLike: true,
      starCount: 4,
      reviews: '38',
    ),
    SearchModel(
        image:
            'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady13.jpg?alt=media&token=7a23c6a8-d4cc-4e6c-9576-0eef4c25a8f9',
        productName: 'Ohara Dress',
        productPrice: '85.00',
        hasLike: true,
        starCount: 4,
        reviews: '50'),
    SearchModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady14.jpg?alt=media&token=b633b4f1-57bb-496b-987c-d6457f382872',
      productName: 'Tie Back Mini Dress',
      productPrice: '67.00',
      hasLike: true,
      starCount: 4,
      reviews: '50',
    ),
    SearchModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady15.jpg?alt=media&token=3511fcf5-482b-4151-a521-c9076e600ca4',
      productName: 'Leaves Green Dress',
      productPrice: '64.00',
      hasLike: false,
      starCount: 4,
      reviews: '39',
    ),
    SearchModel(
      image:
          'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady16.jpg?alt=media&token=d5ba37c3-dc4d-4fd7-8ec9-19cbf648879e',
      productName: 'Off Shoulder Dress',
      productPrice: '78.99',
      hasLike: false,
      starCount: 4,
      reviews: '83',
    ),
  ];
}
