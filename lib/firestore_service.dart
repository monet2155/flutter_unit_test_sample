import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firestore;

  FirestoreService({required this.firestore});

  Future<Map<String, dynamic>?> getDocument(
      String collection, String docId) async {
    final docSnapshot = await firestore.collection(collection).doc(docId).get();
    return docSnapshot.data();
  }
}
