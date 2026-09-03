import 'package:flutter/material.dart';
import '../utils/constants.dart';

class MyNotificationsScreen extends StatelessWidget {
  const MyNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إشعاراتي')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: MockData.notifications.length,
        itemBuilder: (context, index) {
          final n = MockData.notifications[index];
          return Card(
            child: ListTile(
              title: Text(n['title']),
              subtitle: Text(n['message']),
              trailing: n['isRead'] ? const Icon(Icons.check_circle, color: Colors.green) : const Icon(Icons.circle, color: Colors.blue),
            ),
          );
        },
      ),
    );
  }
}
