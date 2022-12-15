import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobii_exam_clean/src/core/dependency_injector/injector.dart';
import 'package:mobii_exam_clean/src/presentation/cubits/user_list/users_cubit.dart';
import 'package:mobii_exam_clean/src/shared/enums/process_status.dart';
import 'package:mobii_exam_clean/src/shared/router/app_router_names.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    getIt<UsersCubit>().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<UsersCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: BlocBuilder<UsersCubit, UserState>(
          builder: (context, state) {
            if (state.status == ProcessStatus.inProgress) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == ProcessStatus.successful) {
              if (state.usersEntity == null || state.usersEntity!.isEmpty) {
                return const Center(child: Text('No users found'));
              }

              final distinctUsers = state.usersEntity!.toSet().toList();

              return ListView.builder(
                itemCount: distinctUsers.length,
                itemBuilder: (context, index) {
                  final user = distinctUsers[index];

                  return Card(
                    child: ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.id),
                      onTap: () => context.pushNamed(
                        AppRouterNames.user,
                        params: {'id': user.id},
                        extra: user,
                      ),
                    ),
                  );
                },
              );
            } else if (state.status == ProcessStatus.failed) {
              return Center(
                child: Text(state.errorMessage!),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
