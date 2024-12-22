import '../../../data/repositores/remote/my_profile_repository.dart';

class DeleteProfileUseCase {
  ProfileRepo repo;
  DeleteProfileUseCase(this.repo);
  Future<void> deleteProfile(String id) async {
    return await repo.deleteProfile(id);
  }
}
