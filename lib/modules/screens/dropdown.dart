// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:snippet_coder_utils/FormHelper.dart';

// import '../../cubit/OrderCubit.dart';
// import '../models/order.dart';

// class dropdown extends StatefulWidget {
//   const dropdown({Key? key}) : super(key: key);

//   @override
//   State<dropdown> createState() => _dropdownState();
// }

// class _dropdownState extends State<dropdown> {
//   List<Map<String, dynamic>> countries = [];
//   List<Map<String, dynamic>> statemaster = [];
//   List<Map<String, dynamic>> states = [];

//   final houseno_tc = TextEditingController();
//   final street_tc = TextEditingController();
//   final city_tc = TextEditingController();

//   String? countryID;
//   String? stateID;

//   @override
//   void initState() {
//     super.initState();

//     this.countries.add({"id": 1, "label": "NORTH INDIA"});
//     this.countries.add({"id": 2, "label": "SOUTH INDIA"});
//     this.countries.add({"id": 3, "label": "EAST INDIA"});
//     this.countries.add({"id": 4, "label": "WEST INDIA"});
//     this.countries.add({"id": 5, "label": "CENTRAL INDIA"});

//     this.statemaster = [
//       {"ID": 1, "Name": "Himachal Pradesh", "ParentID": 1},
//       {"ID": 2, "Name": "Punjab", "ParentID": 1},
//       {"ID": 3, "Name": "Uttarakhand", "ParentID": 1},
//       {"ID": 4, "Name": "Uttar Pradesh", "ParentID": 1},
//       {"ID": 5, "Name": "Haryana", "ParentID": 1},
//       {"ID": 6, "Name": "Andhra Pradesh", "ParentID": 2},
//       {"ID": 7, "Name": "Karnataka", "ParentID": 2},
//       {"ID": 8, "Name": "Kerala", "ParentID": 2},
//       {"ID": 9, "Name": "Tamil Nadu", "ParentID": 2},
//       {"ID": 10, "Name": "Bihar", "ParentID": 3},
//       {"ID": 11, "Name": "Orissa", "ParentID": 3},
//       {"ID": 12, "Name": "Jharkhand", "ParentID": 3},
//       {"ID": 13, "Name": "West Bengal", "ParentID": 3},
//       {"ID": 14, "Name": "Rajasthan", "ParentID": 4},
//       {"ID": 15, "Name": "Gujarat", "ParentID": 4},
//       {"ID": 16, "Name": "Goa", "ParentID": 4},
//       {"ID": 17, "Name": "Maharashtra", "ParentID": 4},
//       {"ID": 18, "Name": "Madhya Pradesh", "ParentID": 5},
//       {"ID": 19, "Name": "Chhattisgarh", "ParentID": 5},
//       {"ID": 20, "Name": "Assam", "ParentID": 6},
//       {"ID": 21, "Name": "Sikkim", "ParentID": 6},
//       {"ID": 22, "Name": "Nagaland", "ParentID": 6},
//       {"ID": 23, "Name": "Meghalaya", "ParentID": 6},
//       {"ID": 24, "Name": "Manipur", "ParentID": 6},
//       {"ID": 25, "Name": "Mizoram", "ParentID": 6},
//       {"ID": 26, "Name": "Tripura", "ParentID": 6},
//       {"ID": 27, "Name": "Arunachal Pradesh", "ParentID": 6},
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     OrderCubit orderCubit = BlocProvider.of<OrderCubit>(context);
//     String setAddressString() {
//       String zone = "";
//       print(countries.length);
//       for (int i = 0; i < countries.length; i++) {
//         if (countries[i]["id"].toString() == countryID) {
//           zone = countries[i]["label"];
//           print("zone loop" + zone);
//         }
//       }

//       for (int i = 0; i < statemaster.length; i++) {
//         if (statemaster[i]["ID"].toString() == stateID) {
//           zone = zone + ", " + statemaster[i]["Name"];
//         }
//       }
//       return zone +
//           ", " +
//           houseno_tc.text +
//           ", " +
//           street_tc.text +
//           ", " +
//           city_tc.text;
//     }

//     return Scaffold(
//         backgroundColor: const Color.fromARGB(255, 240, 240, 240),
//         appBar: AppBar(
//           backgroundColor: Colors.deepPurple,
//           actions: [],
//           // ignore: prefer_const_constructors
//           title: Center(
//               child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Residental Address",
//               style: TextStyle(
//                 color: Color.fromARGB(255, 255, 255, 255),
//                 // decoration: TextDecoration.underline,
//                 // decorationStyle: TextDecorationStyle.solid,
//               ),
//             ),
//           )),
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Center(
//                 child: Text("Please fill your Current Address"),
//               ),
//             ),

//             // FormHelper.dropDownWidget(context, hintText, value, lstData, onChanged, onValidate),
//             FormHelper.dropDownWidgetWithLabel(
//                 context,
//                 "Country Zone",
//                 "Select Your Zone",
//                 this.countryID,
//                 this.countries, (onChangedVal) {
//               this.countryID = onChangedVal;
//               print("selectCountry $onChangedVal");
//               this.states = this
//                   .statemaster
//                   .where(
//                     (stateItem) =>
//                         stateItem["ParentID"].toString() ==
//                         onChangedVal.toString(),
//                   )
//                   .toList();
//               this.stateID = null;
//               setState(() {});
//             }, (onValidateVal) {
//               if (onValidateVal == null) {
//                 return "empty not allowed";
//               }
//               return null;
//             },
//                 borderColor: Colors.black,
//                 borderFocusColor: Colors.deepPurple,
//                 borderRadius: 10,
//                 optionValue: "id", //ID
//                 optionLabel: "label" // default id -name
//                 ),
//             FormHelper.dropDownWidgetWithLabel(context, "States",
//                 "Select Your State", this.stateID, this.states, (onChangedVal) {
//               this.stateID = onChangedVal;
//               print("Selected State : $onChangedVal");
//             }, (onValidate) {
//               return null;
//             },
//                 borderColor: Colors.black,
//                 borderFocusColor: Colors.deepPurple,
//                 borderRadius: 10,
//                 optionValue: "ID", //ID
//                 optionLabel: "Name"),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               // height: 200,
//               width: 490,
//               child: const TextField(
//                 decoration: InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide:
//                         BorderSide(color: Colors.deepPurple, width: 1.8),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide: BorderSide(
//                         color: Color.fromARGB(255, 40, 39, 39), width: 1.3),
//                   ),
//                   hintText: 'Enter city',
//                 ),
//                 controller: city_tc,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),

//             Container(
//               width: 490,
//               child: const TextField(
//                 decoration: InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide:
//                         BorderSide(color: Colors.deepPurple, width: 1.8),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide: BorderSide(
//                         color: Color.fromARGB(255, 40, 39, 39), width: 1.3),
//                   ),
//                   hintText: 'Enter Street',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),

//             Container(
//               width: 490,
//               child: const TextField(
//                 decoration: InputDecoration(
//                   // border: OutlineInputBorder(
//                   //    borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                   //   borderSide: BorderSide(color: Colors.deepPurple),
//                   // ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide:
//                         BorderSide(color: Colors.deepPurple, width: 1.8),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide: BorderSide(
//                         color: Color.fromARGB(255, 40, 39, 39), width: 1.3),
//                   ),
//                   hintText: 'Enter house number',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.deepPurple,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0)),
//                 ),
//                 onPressed: () {
//                   String add = setAddressString();
//                   Order order = Order();
//                   order.delivery_address = add;
//                   orderCubit.addData(order);
//                   Navigator.pushNamed(context, "/dashboard");
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "Save Your Details",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ))
//           ],
//         ));
//   }
// }

// ignore_for_file: prefer_const_constructors
// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_buyer_app/cubit/AddressCubit.dart';
import 'package:shopping_buyer_app/cubit/OrderCubit.dart';
import 'package:shopping_buyer_app/modules/models/order.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class dropdown extends StatefulWidget {
  const dropdown({Key? key}) : super(key: key);

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  List<Map<String, dynamic>> countries = [];
  List<Map<String, dynamic>> statemaster = [];
  List<Map<String, dynamic>> states = [];

  final houseno_tc = TextEditingController();
  final street_tc = TextEditingController();
  final city_tc = TextEditingController();

  String? countryID;
  String? stateID;

  @override
  void initState() {
    super.initState();

    this.countries.add({"id": 1, "label": "NORTH INDIA"});
    this.countries.add({"id": 2, "label": "SOUTH INDIA"});
    this.countries.add({"id": 3, "label": "EAST INDIA"});
    this.countries.add({"id": 4, "label": "WEST INDIA"});
    this.countries.add({"id": 5, "label": "CENTRAL INDIA"});

    this.statemaster = [
      {"ID": 1, "Name": "Himachal Pradesh", "ParentID": 1},
      {"ID": 2, "Name": "Punjab", "ParentID": 1},
      {"ID": 3, "Name": "Uttarakhand", "ParentID": 1},
      {"ID": 4, "Name": "Uttar Pradesh", "ParentID": 1},
      {"ID": 5, "Name": "Haryana", "ParentID": 1},
      {"ID": 6, "Name": "Andhra Pradesh", "ParentID": 2},
      {"ID": 7, "Name": "Karnataka", "ParentID": 2},
      {"ID": 8, "Name": "Kerala", "ParentID": 2},
      {"ID": 9, "Name": "Tamil Nadu", "ParentID": 2},
      {"ID": 10, "Name": "Bihar", "ParentID": 3},
      {"ID": 11, "Name": "Orissa", "ParentID": 3},
      {"ID": 12, "Name": "Jharkhand", "ParentID": 3},
      {"ID": 13, "Name": "West Bengal", "ParentID": 3},
      {"ID": 14, "Name": "Rajasthan", "ParentID": 4},
      {"ID": 15, "Name": "Gujarat", "ParentID": 4},
      {"ID": 16, "Name": "Goa", "ParentID": 4},
      {"ID": 17, "Name": "Maharashtra", "ParentID": 4},
      {"ID": 18, "Name": "Madhya Pradesh", "ParentID": 5},
      {"ID": 19, "Name": "Chhattisgarh", "ParentID": 5},
      {"ID": 20, "Name": "Assam", "ParentID": 6},
      {"ID": 21, "Name": "Sikkim", "ParentID": 6},
      {"ID": 22, "Name": "Nagaland", "ParentID": 6},
      {"ID": 23, "Name": "Meghalaya", "ParentID": 6},
      {"ID": 24, "Name": "Manipur", "ParentID": 6},
      {"ID": 25, "Name": "Mizoram", "ParentID": 6},
      {"ID": 26, "Name": "Tripura", "ParentID": 6},
      {"ID": 27, "Name": "Arunachal Pradesh", "ParentID": 6},
    ];
  }

  @override
  Widget build(BuildContext context) {
    OrderCubit orderCubit = BlocProvider.of<OrderCubit>(context);
    AddressCubit addressCubit = BlocProvider.of<AddressCubit>(context);

    String setAddressString() {
      String zone = "";
      print(countries.length);
      for (int i = 0; i < countries.length; i++) {
        if (countries[i]["id"].toString() == countryID) {
          zone = countries[i]["label"];
          print("zone loop" + zone);
        }
      }

      for (int i = 0; i < statemaster.length; i++) {
        if (statemaster[i]["ID"].toString() == stateID) {
          zone = zone + ", " + statemaster[i]["Name"];
        }
      }
      return zone +
          ", " +
          houseno_tc.text +
          ", " +
          street_tc.text +
          ", " +
          city_tc.text;
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // FormHelper.dropDownWidget(context, hintText, value, lstData, onChanged, onValidate),
              FormHelper.dropDownWidgetWithLabel(
                  context,
                  "Country Zone",
                  "Choose zone",
                  this.countryID,
                  this.countries, (onChangedVal) {
                this.countryID = onChangedVal;
                print("selectCountry $onChangedVal");
                // int.parse(onChangedVal);
                // Map<String, Object> mp = countries[onChangedVal];
                // print(mp["label"]);
                this.states = this
                    .statemaster
                    .where(
                      (stateItem) =>
                          stateItem["ParentID"].toString() ==
                          onChangedVal.toString(),
                    )
                    .toList();
                this.stateID = null;
                setState(() {});
              }, (onValidateVal) {
                if (onValidateVal == null) {
                  return "Empty not allowed";
                }
                return null;
              },
                  borderColor: Colors.black,
                  borderFocusColor: Colors.pink,
                  borderRadius: 10,
                  optionValue: "id", //ID
                  optionLabel: "label" // default id -name
                  ),
              FormHelper.dropDownWidgetWithLabel(
                  context, "States", "Choose States", this.stateID, this.states,
                  (onChangedVal) {
                this.stateID = onChangedVal;
                print("Selected State : $onChangedVal");
              }, (onValidate) {
                return null;
              },
                  borderColor: Colors.black,
                  borderFocusColor: Colors.pink,
                  borderRadius: 10,
                  optionValue: "ID", //ID
                  optionLabel: "Name"),
              SizedBox(
                height: 20,
              ),

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter city',
                ),
                controller: city_tc,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Street',
                  ),
                  controller: street_tc),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter house number',
                ),
                controller: houseno_tc,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  String add = setAddressString();
                  Order order = Order();
                  order.delivery_address = add;
                  orderCubit.addData(order);
                  Navigator.pushNamed(context, "/dashboard");
                },
                child: Text("Proceed"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
