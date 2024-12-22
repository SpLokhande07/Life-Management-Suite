import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/data/providers/profile_provider.dart';
import 'package:taskflow/domain/usecase/profile_use_case/create_profile_use_case.dart';
import 'package:taskflow/domain/usecase/profile_use_case/delete_profile_use_case.dart';
import 'package:taskflow/domain/usecase/profile_use_case/get_profile_use_case.dart';
import 'package:taskflow/domain/usecase/profile_use_case/update_profile_use_case.dart';

var getProfileUseCase = Provider<GetProfileUseCase>((ref) {
  var repo = ref.watch(profileProvider);
  return GetProfileUseCase(repo);
});

var createProfileUser = Provider<CreateProfileUseCase>((ref) {
  var repo = ref.watch(profileProvider);
  return CreateProfileUseCase(repo);
});

var updateProfileUser = Provider<UpdateProfileUseCase>((ref) {
  var repo = ref.watch(profileProvider);
  return UpdateProfileUseCase(repo);
});

var deleteProfileUser = Provider<DeleteProfileUseCase>((ref) {
  var repo = ref.watch(profileProvider);
  return DeleteProfileUseCase(repo);
});
