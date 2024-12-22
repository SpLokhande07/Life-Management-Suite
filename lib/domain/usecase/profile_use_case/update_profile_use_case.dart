import '../../../data/models/profile/profile_model.dart';
import '../../../data/repositores/remote/my_profile_repository.dart';

class UpdateProfileUseCase {
  ProfileRepo repo;
  UpdateProfileUseCase(this.repo);
  Future<Profile?> updateProfile(String id, Profile profile) async {
    return await repo.updateProfile(id, profile);
  }
}
