import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_auth_buttons/res/buttons/google_auth_button.dart';
import 'package:taskflow/domain/providers/auth/auth_usecase_proivder.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var signInProvider = ref.read(signInUsecaseProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return GoogleAuthButton(onPressed: () async {
                await signInProvider.googleSignIn();
              });
            } else {
              return SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.1),
                  child: GoogleAuthButton(onPressed: () async {
                    await signInProvider.googleSignIn();
                  }),
                ),
              );
            }
          })
        ],
      ),
    );
  }
}
