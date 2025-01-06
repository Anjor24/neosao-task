import 'package:flutter/material.dart';
import '../models/user.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  UserDetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.firstName} ${user.lastName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(user.picture, height: 150),
            SizedBox(height: 16),
            Text('ID: ${user.id}', style: TextStyle(fontSize: 16)),
            Text('Name: ${user.firstName} ${user.lastName}', style: TextStyle(fontSize: 16)),
            // Add more user details here if needed
          ],
        ),
      ),
    );
  }
}
