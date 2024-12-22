import 'package:taskflow/data/models/auth/google_auth_model.dart';
import 'package:taskflow/data/repositores/remote/auth_repository.dart';
import 'package:taskflow/domain/entity/auth/user_model.dart';

class GoogleSignInUseCase {
  final AuthRepository repository;

  GoogleSignInUseCase({required this.repository});

  Future<UserModel> googleSignIn() async {
    GoogleAuthModel? model = await repository.login();
    UserModel userModel = UserModel.fromGoogleAuthModel(model);
    return userModel;
  }
}
