import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taskflow/data/models/auth/google_auth_model.dart';

abstract class AuthRepository {
  Future<GoogleAuthModel?> login();
  Future<void> signOut();
  bool isSignedIn();
}

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRepositoryImpl({
    required this.googleSignIn,
    required this.firebaseAuth,
  });

  @override
  Future<GoogleAuthModel?> login() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account == null) {
        return null;
      }

      GoogleSignInAuthentication auth = await account.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: auth.accessToken, idToken: auth.idToken);

      UserCredential creds =
          await firebaseAuth.signInWithCredential(credential);

      GoogleAuthModel model = GoogleAuthModel().fromUserCred(creds.user!);
      return model;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }

  @override
  bool isSignedIn() {
    return firebaseAuth.currentUser != null;
  }
}
