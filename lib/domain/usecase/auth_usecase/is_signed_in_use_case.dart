import 'package:taskflow/data/repositores/remote/auth_repository.dart';

class IsSignedInUseCase {
  AuthRepository repository;
  IsSignedInUseCase({required this.repository});

  bool isSignedIn() {
    return repository.isSignedIn();
  }
}
