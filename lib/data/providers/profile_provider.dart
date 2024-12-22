import 'package:riverpod/riverpod.dart';
import 'package:taskflow/data/repositores/remote/my_profile_repository.dart';

final profileProvider = Provider<ProfileRepoImpl>((ref) {
  return ProfileRepoImpl();
});
