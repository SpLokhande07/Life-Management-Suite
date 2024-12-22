import '../../../data/models/profile/profile_model.dart';
import '../../../data/repositores/remote/my_profile_repository.dart';

class GetProfileUseCase {
  ProfileRepo repo;
  GetProfileUseCase(this.repo);
  Future<Profile?> getProfile(String id) async {
    return await repo.readProfile(id);
  }
}
