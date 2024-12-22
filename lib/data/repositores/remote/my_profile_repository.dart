import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskflow/data/models/profile/profile_model.dart';

import '../../../core/services/api_service.dart';

abstract class ProfileRepo {
  Future<void> createProfile(Profile profile);
  Future<Profile?> readProfile(String id);
  Future<void> deleteProfile(String id);
  Future<Profile?> updateProfile(String id, Profile profile);
}

class ProfileRepoImpl extends ProfileRepo {
  final FirestoreService _firestoreService = FirestoreService();
  final String collectionPath = 'profiles';

  // Create a new profile
  @override
  Future<void> createProfile(Profile profile) async {
    // await _firestoreService.createDocument(
    //     collectionPath, profile.toJson(profile));
  }

  // Read a profile
  @override
  Future<Profile?> readProfile(String id) async {
    DocumentSnapshot snapshot =
        await _firestoreService.readDocument(collectionPath, id);
    return snapshot.exists
        ? Profile.fromJson(snapshot.data() as Map<String, dynamic>)
        : null;
  }

  // Update a profile
  @override
  Future<Profile?> updateProfile(String id, Profile profile) async {
    // await _firestoreService.updateDocument(
    //     collectionPath, id, profile.toJson(profile));
  }

  // Delete a profile
  @override
  Future<void> deleteProfile(String id) async {
    await _firestoreService.deleteDocument(collectionPath, id);
  }

  // Count profiles
  Future<int> countProfiles() async {
    return await _firestoreService.countDocuments(collectionPath);
  }
}
