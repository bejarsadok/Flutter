import 'package:cloud_firestore/cloud_firestore.dart';

class Complaint{

    final String subject;
    final String departement;
    final String teacher;
    final String description;

    const Complaint({
      required this.subject,
      required this.departement,
      required this.teacher,
      required this.description,
});

    static Complaint fromSnapshot(DocumentSnapshot snap){
      Complaint comp = Complaint(
        subject: snap['subject'],
          departement: snap['department'],
        teacher: snap['teacher'],
        description: snap['description'],
      );
      return comp;
    }
}