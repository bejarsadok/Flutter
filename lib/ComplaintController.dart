import 'package:flutter1/Complaint.dart';
import 'package:flutter1/FirebaseService.dart';
import 'package:get/get.dart';

class ComplainController extends GetxController{

    final complaints = <Complaint>[].obs;
    @override
  void onInit(){
      complaints.bindStream(FirebaseService().getAllComplaints());
      super.onInit();
    }
}