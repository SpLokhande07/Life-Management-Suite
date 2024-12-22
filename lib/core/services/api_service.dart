import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Create a document
  Future<void> createDocument(String collectionPath, Map<String, dynamic> data) async {
    await _db.collection(collectionPath).add(data);
  }

  // Read a document
  Future<DocumentSnapshot> readDocument(String collectionPath, String documentId) async {
    return await _db.collection(collectionPath).doc(documentId).get();
  }

  // Update a document
  Future<void> updateDocument(String collectionPath, String documentId, Map<String, dynamic> data) async {
    await _db.collection(collectionPath).doc(documentId).update(data);
  }

  // Delete a document
  Future<void> deleteDocument(String collectionPath, String documentId) async {
    await _db.collection(collectionPath).doc(documentId).delete();
  }

  // Aggregate operation example: Count documents
  Future<int> countDocuments(String collectionPath) async {
    QuerySnapshot snapshot = await _db.collection(collectionPath).get();
    return snapshot.docs.length;
  }
}