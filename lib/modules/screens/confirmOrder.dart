// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shopping_buyer_app/cubit/OrderCubit.dart';
// import 'package:shopping_buyer_app/modules/models/order.dart';
// import 'package:shopping_buyer_app/modules/models/product.dart';

// class ConfirmOrder extends StatefulWidget {
//   @override
//   _ConfirmOrderState createState() => _ConfirmOrderState();
// }

// class _ConfirmOrderState extends State<ConfirmOrder> {
//   static const platform = const MethodChannel("razorpay_flutter");
//   late Razorpay _razorpay;
//   // Order order = Order();
//   // void initState() {
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: BlocBuilder<OrderCubit, Order>(
//           builder: (context, state) {
//             return Container(
//               color: Colors.white54,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Container(
//                     padding: const EdgeInsets.all(40),
//                     margin: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                         color: Colors.yellow,
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.black, width: 2)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: const Text(
//                             "Address",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 fontFamily: 'Montserrat',
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Text(state.delivery_address),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: MediaQuery.of(context).size.height * 0.5,
//                     child: ListView.builder(
//                       scrollDirection: Axis.vertical,
//                       shrinkWrap: true,
//                       itemCount: state.products.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           leading: Image.network(state.products[index].url),
//                           title: Text(state.products[index].name),
//                           subtitle: Text(state.products[index].desc),
//                           trailing: Text(
//                             state.products[index].price.toString(),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Container(
//                     child: Text("Total Amount: ${state.price}"),
//                   ),
//                   ElevatedButton(
//                       onPressed: openCheckout, child: Text('Confirm Order')),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }

//   void openCheckout() async {
//     OrderCubit orderCubit = BlocProvider.of<OrderCubit>(context);
//     var options = {
//       'key': 'rzp_live_ILgsfZCZoFIKMb',
//       'amount': orderCubit.amount * 100,
//       'name': 'Acme Corp.',
//       'description': 'Order',
//       'retry': {'enabled': true, 'max_count': 1},
//       'send_sms_hash': true,
//       'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error: e');
//     }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     print('Success Response: $response.paymentId');
//     Fluttertoast.showToast(
//         webBgColor: "linear-gradient(to right, #00b09b, #96c93d)",
//         msg: "Payment was successfull");
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     print('Error Response: $response');

//     Fluttertoast.showToast(
//         webBgColor: "linear-gradient(to right, #00b09b, #96c93d)",
//         msg: "Payment was not successfull");
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     print('External SDK Response: $response');
//     Fluttertoast.showToast(
//         webBgColor: "linear-gradient(to right, #00b09b, #96c93d)",
//         msg: "Some error occured");
//   }
// }
