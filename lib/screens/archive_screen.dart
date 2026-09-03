import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات وهمية للأرشيف
    final archives = [
      {'type': 'إيداع', 'amount': 300, 'date': '2026/08/18 10:00 ص', 'count': 1},
      {'type': 'سحب', 'amount': 200, 'date': '2026/08/18 09:00 ص', 'count': 1},
      {'type': 'إيداع', 'amount': 500, 'date': '2026/08/17 11:00 ص', 'count': 2},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('إرشيف الإدارة')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: archives.length,
        itemBuilder: (context, index) {
          final item = archives[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: item['type'] == 'إيداع' ? Colors.green : Colors.red,
                child: Text(item['count'].toString(), style: const TextStyle(color: Colors.white)),
              ),
              title: Text('${item['type']} - ${item['amount']}'),
              subtitle: Text(item['date']),
            ),
          );
        },
      ),
    );
  }
}
