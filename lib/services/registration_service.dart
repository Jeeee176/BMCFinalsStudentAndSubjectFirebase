import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerStudent({
    required String name,
    required String section,
    required String course,
    required String subject1,
    required String time1,
    required String subject2,
    required String time2,
  }) async {
    await _firestore.collection('registrations').add({
      'name': name,
      'section': section,
      'course': course,
      'subject1': subject1,
      'time1': time1,
      'subject2': subject2,
      'time2': time2,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}