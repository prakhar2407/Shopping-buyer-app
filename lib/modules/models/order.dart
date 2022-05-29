import 'package:shopping_buyer_app/modules/models/product.dart';

class Order {
  late String id;
  late List<Product> products;
  // late String user_emailid;
  late double price;
  // late String order_status;
  late String delivery_address;
  // late String delivery_zone;
  // late int delivery_by;
  // late DateTime date;

  Order() {}

  Order.takeOrder({
    required this.id,
    required this.products,
    // required this.user_emailid,
    required this.price,
    // required this.order_status,
    required this.delivery_address,
    // required this.delivery_zone,
    // required this.delivery_by,
    // required this.date,
  });
}
