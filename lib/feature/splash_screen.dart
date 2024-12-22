import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskflow/domain/providers/auth/auth_usecase_proivder.dart';
import 'package:taskflow/feature/home/home_view.dart';

import 'auth/view/sign_in_view.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var isSignedIn = ref.watch(isUserSignedInProvider);
    return isSignedIn.isSignedIn() ? HomeView() : SignInView();
  }
}
