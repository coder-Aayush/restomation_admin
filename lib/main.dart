import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restomation_admin/firebase_options.dart';
import 'package:restomation_admin/src/core/themes/app_colors.dart';
import 'package:restomation_admin/src/feature/auth/views/auth_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(1280, 750),
        builder: (context, _) {
          return MaterialApp(
            title: 'Restomation Admin',
            home: const AuthView(),
            theme: ThemeData(colorSchemeSeed: AppColors.primaryColor),
          );
        },
      ),
    );
  }
}
