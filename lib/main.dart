import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_buyer_app/cubit/OrderCubit.dart';
import 'package:shopping_buyer_app/modules/models/order.dart';
import 'package:shopping_buyer_app/modules/screens/AddressInput.dart';
import 'package:shopping_buyer_app/modules/screens/dashboard.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(
    child: MaterialApp(
      title: "Buyer App",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => MyAddress(),
        "/dashboard": (context) => Dashboard(),
      }, //once initial route defined no need to mention home
      // initialRoute: RouteConstants.DASHBOARD, //inital or base route
      // routes: getRoutes(), //all routes are loaded here
    ),
    providers: [
      BlocProvider(create: (context) => OrderCubit(Order())),
    ],
  ));
}
