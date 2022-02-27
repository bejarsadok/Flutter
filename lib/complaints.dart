import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter1/list_users.dart';
import 'theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'FirebaseService.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ComplaintsPage extends StatefulWidget {
  @override
  _ComplaintsPageState createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  String? selectedValue;
  List<String> items = [
    'Fahmi Zouari',
    'Taoufik Ben Abdallah',
    'Mohamed Mazzouzi',
    'Ahmed Ben Arrab',
    'Ahmed Jmal',
    'Noura Azzaez',
  ];
  final TextEditingController controllerSubject = new TextEditingController();
  final TextEditingController controllerDepartment =
      new TextEditingController();

  final TextEditingController controllerDescription =
      new TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void getCustomerNames() {
    List<String> customerNames = [];

    // Future<QuerySnapshot?> customerList = FirebaseService().getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add a complaint',
                  style: heading2.copyWith(color: textBlack),
                ),
                SizedBox(
                  height: 5,
                ),
                Image.asset(
                  'assets/images/accent.png',
                  width: 99,
                  height: 4,
                ),
              ],
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 16.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: textWhiteGrey,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Subject',
                    hintStyle: heading6.copyWith(color: textGrey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  controller: controllerSubject,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: textWhiteGrey,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Department',
                    hintStyle: heading6.copyWith(color: textGrey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  controller: controllerDepartment,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: const [
                        Icon(
                          Icons.list,
                          size: 16,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Select Item',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.blueAccent,
                    iconDisabledColor: Colors.grey,
                    buttonHeight: 50,
                    buttonWidth: 160,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color(0XFFf1f1f5),
                    ),
                    buttonElevation: 2,
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 200,
                    dropdownWidth: MediaQuery.of(context).size.width,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    offset: const Offset(-20, 0),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: textWhiteGrey,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: heading6.copyWith(color: textGrey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  controller: controllerDescription,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 56,
                child: ElevatedButton(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white, fontSize: heading5.fontSize),
                    ),
                    onPressed: () async {
                      await firestore.collection("complaints").add({
                        "subject": controllerSubject.text,
                        "department": controllerDepartment.text,
                        "teacher": selectedValue,
                        "description": controllerDescription.text
                      });
                      controllerSubject.clear();
                      controllerDepartment.clear();

                      controllerDescription.clear();

                      setState(() {});

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListUserPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: primaryBlue,
                      onPrimary: Colors.white,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(14.0),
                      ),
                    )),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
