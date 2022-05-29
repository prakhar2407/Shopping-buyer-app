import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_buyer_app/modules/models/order.dart';

import '../modules/models/product.dart';

class OrderCubit extends Cubit<Order> {
  OrderCubit(Order myOrder) : super(myOrder);

  late double amount;

  void addData() {
    const String address =
        "Near Rotary Public School Cartarpuri Alias, Huda, Sector 23A, Gurugram, Haryana 122017";
    List<Product> arr = [
      Product.takeProduct(
          name: "IPhone",
          desc: "description",
          price: 100,
          qty: 10,
          url:
              "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-pro-family-hero?wid=940&hei=1112&fmt=png-alpha&.v=1644969385433"),
      Product.takeProduct(
          name: "IPhone",
          desc: "description",
          price: 100,
          qty: 10,
          url:
              "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-pro-family-hero?wid=940&hei=1112&fmt=png-alpha&.v=1644969385433"),
      Product.takeProduct(
          name: "IPad",
          desc: "description",
          price: 200,
          qty: 10,
          url:
              "https://www.aptronixindia.com/media/catalog/product/cache/31f0162e6f7d821d2237f39577122a8a/1/1/11-inch128gbipadprowi-ficelluar-spacegrey_1.png"),
      Product.takeProduct(
          name: "MacBook",
          desc: "description",
          price: 300,
          qty: 10,
          url:
              "https://help.apple.com/assets/6062258EBFC7E7487E19DBB0/60622591BFC7E7487E19DBBA/en_US/540d7697864354f0c0bed1741209d7f1.png"),
      Product.takeProduct(
          name: "Mac",
          desc: "description",
          price: 400,
          qty: 10,
          url:
              "https://inventstore.in/wp-content/uploads/2022/03/Untitled-design-18-300x300.png"),
      Product.takeProduct(
          name: "Mac",
          desc: "description",
          price: 400,
          qty: 10,
          url:
              "https://inventstore.in/wp-content/uploads/2022/03/Untitled-design-18-300x300.png"),
      Product.takeProduct(
          name: "Mac",
          desc: "description",
          price: 400,
          qty: 10,
          url:
              "https://inventstore.in/wp-content/uploads/2022/03/Untitled-design-18-300x300.png"),
      Product.takeProduct(
          name: "Mac",
          desc: "description",
          price: 400,
          qty: 10,
          url:
              "https://inventstore.in/wp-content/uploads/2022/03/Untitled-design-18-300x300.png"),
    ];

    double amount = arr
        .map((prodcut) => prodcut.price)
        .reduce((value, current) => value + current);

    Order order = Order();
    order.id = "1";
    order.delivery_address = address;
    order.price = amount;
    this.amount = amount;
    order.products = arr;
    emit(order);
  }
}
