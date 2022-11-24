import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restomation_admin/src/core/extensions/context_extension.dart';
import 'package:restomation_admin/src/core/themes/app_styles.dart';
import 'package:restomation_admin/src/core/widgets/custom_button.dart';
import 'package:restomation_admin/src/core/widgets/widgets.dart';
import 'package:restomation_admin/src/feature/auth/providers/auth_provider.dart';

class AuthView extends HookWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    final password = useTextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900, minWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login to Continue', style: AppStyles.text24PxBold),
                20.verticalSpace,
                CustomTextField(controller: email, hintText: 'Email'),
                20.verticalSpace,
                CustomTextField(
                  controller: password,
                  hintText: 'Password',
                  obsecureText: true,
                ),
                40.verticalSpace,
                Consumer(
                  builder: (context, ref, _) {
                    return CustomButton(
                      title: 'Login',
                      isDisabled: false,
                      onPressed: () async {
                        try {
                          await ref.read(authProvider.notifier).login(
                              email: email.text, password: password.text);
                        } catch (e) {
                          context.showSnackbar(message: e.toString());
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
