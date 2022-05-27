// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_buyer_app/modules/models/product.dart';

class ConfirmOrder extends StatefulWidget {
  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
  final String address =
      "Near Rotary Public School Cartarpuri Alias, Huda, Sector 23A, Gurugram, Haryana 122017";
  static List<Product> arr = [
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
    Product.takeProduct(
        name: "Mac",
        desc: "description",
        price: 400,
        qty: 10,
        url:
            "https://inventstore.in/wp-content/uploads/2022/03/Untitled-design-18-300x300.png")
  ];

  double amount = arr
      .map((prodcut) => prodcut.price)
      .reduce((value, current) => value + current);
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  static const platform = const MethodChannel("razorpay_flutter");

  late Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(40),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Address",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.address),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: ConfirmOrder.arr.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(ConfirmOrder.arr[index].url),
                      title: Text(ConfirmOrder.arr[index].name),
                      subtitle: Text(ConfirmOrder.arr[index].desc),
                      trailing: Text(
                        ConfirmOrder.arr[index].price.toString(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: Text("Total Amount: ${widget.amount}"),
              ),
              ElevatedButton(
                  onPressed: openCheckout, child: Text('Confirm Order')),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': widget.amount * 100,
      'name': 'Acme Corp.',
      'description': 'Order',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response.paymentId');
    Fluttertoast.showToast(
        webBgColor: "linear-gradient(to right, #00b09b, #96c93d)",
        msg: "Payment was successfull");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');

    Fluttertoast.showToast(
        webBgColor: "linear-gradient(to right, #00b09b, #96c93d)",
        msg: "Payment was not successfull");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    Fluttertoast.showToast(
        webBgColor: "linear-gradient(to right, #00b09b, #96c93d)",
        msg: "Some error occured");
  }
}
