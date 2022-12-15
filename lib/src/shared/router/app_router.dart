import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:mobii_exam_clean/src/domain/entities/user/user_entity.dart';
import 'package:mobii_exam_clean/src/presentation/pages/user/user_page.dart';
import 'package:mobii_exam_clean/src/presentation/pages/users/users_page.dart';
import 'package:mobii_exam_clean/src/shared/router/app_router_names.dart';

@lazySingleton
class AppRouter {
  GoRouter get router => GoRouter(
        routes: [
          GoRoute(
            name: AppRouterNames.home,
            path: '/',
            builder: (BuildContext context, GoRouterState state) =>
                const UsersPage(),
          ),
          GoRoute(
            name: AppRouterNames.user,
            path: '/${AppRouterNames.user}/:id',
            builder: (BuildContext context, GoRouterState state) {
              final userEntity = state.extra! as UserEntity;

              return UserPage(userEntity: userEntity);
            },
          ),
        ],
      );
}
