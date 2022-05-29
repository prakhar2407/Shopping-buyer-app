import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class dropdown extends StatefulWidget {
  const dropdown({Key? key}) : super(key: key);

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  List<dynamic> countries = [];
  List<dynamic> statemaster = [];
  List<dynamic> states = [];

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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            // FormHelper.dropDownWidget(context, hintText, value, lstData, onChanged, onValidate),
            FormHelper.dropDownWidgetWithLabel(context, "Country Zone",
                "enter zone", this.countryID, this.countries, (onChangedVal) {
              this.countryID = onChangedVal;
              print("selectCountry $onChangedVal");
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
                return "empty not allowed";
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
                context, "States", "states", this.stateID, this.states,
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

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter city',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Street',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter house number',
              ),
            ),
          ],
        ));
  }
}
