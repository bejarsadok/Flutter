import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/Complaint.dart';
import 'package:flutter1/ComplaintController.dart';
import 'Complaint.dart';
import 'package:get/get.dart';

class CatalogComplains extends StatelessWidget {

  final complaintcontroller = Get.put(ComplainController());
  CatalogComplains({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                    itemCount: complaintcontroller.complaints.length,

                    itemBuilder: (BuildContext context, int index) {
                      return CatalogComplainsCard(index: index);
                    });


  }
}

class CatalogComplainsCard extends StatelessWidget {
  final int index;
  final ComplainController complainController = Get.find();

  CatalogComplainsCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SizedBox(

    child: Row(
    children: [
    SizedBox(
      width: MediaQuery.of(context).size.width*0.5,
      child: Card(
      child: Column(
      children: <Widget>[
      ListTile(
      leading: Icon(Icons.album),
      title: Text(complainController.complaints[index].subject),
      subtitle: Text(complainController.complaints[index].departement),
      ),
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      TextButton(
      child: Text('Détails'),
      onPressed: () {/* ... */},
      ),
      ],
      ),
      ],
      ),
      ),
    ),
    ]
    ),);


  }
}
