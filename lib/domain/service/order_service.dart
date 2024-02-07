import '../../data/models/order_model.dart';

class OrderService {
  static List<Order> getOrders() {
    return [
      Order(
        orderNumber: '1514',
        date: '13/05/2021',
        quantity: '3',
        subtotal: '110',
        trackingNumber: 'IK987362341',
      ),
      Order(
        orderNumber: '1679',
        date: '12/05/2021',
        quantity: '3',
        subtotal: '450',
        trackingNumber: 'IK3873218890',
      ),
      Order(
        orderNumber: '1671',
        date: '10/05/2021',
        quantity: '3',
        subtotal: '400',
        trackingNumber: 'IK237368881',
      ),
  
    ];
  }
}
