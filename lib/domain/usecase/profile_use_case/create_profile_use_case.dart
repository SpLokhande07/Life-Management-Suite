import 'package:taskflow/data/models/profile/profile_model.dart';
import 'package:taskflow/data/repositores/remote/my_profile_repository.dart';

class CreateProfileUseCase {
  ProfileRepo repo;
  CreateProfileUseCase(this.repo);
  Future<void> createProfile(Profile profile) async {
    return await repo.createProfile(profile);
  }
}
