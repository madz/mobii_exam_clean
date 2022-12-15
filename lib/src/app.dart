import 'package:flutter/material.dart';
import 'package:mobii_exam_clean/src/core/dependency_injector/injector.dart';
import 'package:mobii_exam_clean/src/shared/constants/app_constants.dart';
import 'package:mobii_exam_clean/src/shared/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>().router;

    return MaterialApp.router(
      title: AppConstants.appName,
      routerConfig: appRouter,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
