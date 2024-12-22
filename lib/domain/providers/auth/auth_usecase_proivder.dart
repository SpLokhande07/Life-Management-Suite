import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/data/providers/auth_provider.dart';
import 'package:taskflow/domain/usecase/auth_usecase/google/google_sign_in_usecase.dart';
import 'package:taskflow/domain/usecase/auth_usecase/google/google_sign_out_usecase.dart';
import 'package:taskflow/domain/usecase/auth_usecase/is_signed_in_use_case.dart';

var signInUsecaseProvider = Provider<GoogleSignInUseCase>((ref) {
  var repo = ref.read(authProvider);
  return GoogleSignInUseCase(repository: repo);
});

var signOutUsecaseProvider = Provider<GoogleSignOutUseCase>((ref) {
  var repo = ref.read(authProvider);
  return GoogleSignOutUseCase(repository: repo);
});

var isUserSignedInProvider = Provider<IsSignedInUseCase>((ref) {
  var repo = ref.read(authProvider);
  return IsSignedInUseCase(repository: repo);
});
