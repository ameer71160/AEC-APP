import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حول التطبيق')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('الإصدار: 1.0.0', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text('تحديثات: لا توجد تحديثات جديدة.', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('AEC Community تطبيق لإدارة حسابات الجمعية.', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
