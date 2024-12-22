import 'package:taskflow/data/repositores/remote/auth_repository.dart';

class GoogleSignOutUseCase {
  final AuthRepository repository;

  GoogleSignOutUseCase({required this.repository});

  Future<void> signOut() async {
    return repository.signOut();
  }
}
