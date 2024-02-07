import 'package:flutter_assignment/data/models/fab_items.dart';

class FabService {
  static List<FabItem> fetchFabItems() {
    return [
      FabItem(
        image:
            'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady17.png?alt=media&token=e3d76f26-16d9-4a39-85f8-98e5eeccf6d2',
        subtitle: 'The\nOffice\nLife',
        title: 'T-Shirts',
      ),
      FabItem(
        image:
            'https://firebasestorage.googleapis.com/v0/b/xplore-26809.appspot.com/o/lady18.png?alt=media&token=81e54164-1aa8-4032-b8b7-448bb8c27459',
        subtitle: 'Elegant\nDesign',
        title: 'Dress',
      ),
    ];
  }
}
