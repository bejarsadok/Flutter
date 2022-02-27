import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter1/Complaint.dart';

class FirebaseService {

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Complaint>> getAllComplaints() {
    return _firebaseFirestore.collection("complaints").snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Complaint.fromSnapshot(doc)).toList();
    });
  }
}
