import 'package:flutter/material.dart';
import 'package:mobii_exam_clean/src/domain/entities/user/user_entity.dart';

class UserPage extends StatelessWidget {
  const UserPage({
    super.key,
    required this.userEntity,
  });

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userEntity.name),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text('User ID: ${userEntity.id}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.network(userEntity.imageUrl),
            ),
          ],
        ),
      ),
    );
  }
}
