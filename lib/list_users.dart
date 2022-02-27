import 'dart:html';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/CatalogComplains.dart';
import 'package:flutter1/ComplaintController.dart';
import 'package:flutter1/complaints.dart';
import 'theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'FirebaseService.dart';
import 'package:get/get.dart';

class ListUserPage extends StatefulWidget {
  @override
  _ListUserPageState createState() => _ListUserPageState();
}





class _ListUserPageState extends State<ListUserPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final complaintController = Get.put(ComplainController());
  // CatalogComplains({Key? key}):super(key:key);

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
                Center(
                  child: Image.asset(
                    'assets/images/logoISB1-1.png',
                    width: 200,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'list of complaints',
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
            SizedBox(
              height: 20,
            ),
            Flexible(child: CatalogComplains()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16.0,
                ),


                // Container(
                //   height: 400,
                //   child: FutureBuilder(
                //     future: firestore.collection("complaints").get(),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasError)
                //         return Text(snapshot.error.toString());
                //       else if (snapshot.hasData) {
                //         print(snapshot.data);
                //         QuerySnapshot querySnapshot =
                //             snapshot.data as QuerySnapshot;
                //         List<dynamic> list = querySnapshot.docs;
                //
                //
                //         return ListView.builder(
                //           itemCount: list.length,
                //           itemBuilder: (context, index) {
                //             return Center(
                //                 child: Card(
                //                     child: Column(
                //                         mainAxisSize: MainAxisSize.min,
                //                         children: <Widget>[
                //                   const ListTile(
                //                     leading: Icon(Icons.album),
                //                     title: Text(lis[index].),
                //                     subtitle: Text(
                //                         'Music by Julie Gable. Lyrics by Sidney Stein.'),
                //                   ),
                //                   Row(
                //                     mainAxisAlignment: MainAxisAlignment.end,
                //                     children: <Widget>[
                //                       TextButton(
                //                         child: const Text('BUY TICKETS'),
                //                         onPressed: () {
                //                           /* ... */
                //                         },
                //                       ),
                //                       const SizedBox(width: 8),
                //                       TextButton(
                //                         child: const Text('LISTEN'),
                //                         onPressed: () {
                //                           /* ... */
                //                         },
                //                       ),
                //                       const SizedBox(width: 8),
                //                     ],
                //                   ),
                //                 ])));
                //
                //             // return Row(
                //             //   mainAxisAlignment: MainAxisAlignment.center,
                //             //   children: [
                //             //     Padding(
                //             //       padding: const EdgeInsets.all(8.0),
                //             //       child: Text(list[index].get("subject")),
                //             //     ),
                //             //     Padding(
                //             //       padding: const EdgeInsets.all(8.0),
                //             //       child: Text(list[index].get("department")),
                //             //     ),
                //             //     Padding(
                //             //       padding: const EdgeInsets.all(8.0),
                //             //       child: Text(list[index].get("teacher")),
                //             //     ),
                //             //     Padding(
                //             //       padding: const EdgeInsets.all(8.0),
                //             //       child: Text(list[index].get("description")),
                //             //     ),
                //             //   ],
                //             // );
                //           },
                //         );
                //       }
                //       ;
                //       return CircularProgressIndicator();
                //     },
                //   ),
                // )
              ],
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("clicked");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ComplaintsPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
