import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('السياسة والخصوصية')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'نحن نلتزم بحماية بيانات الأعضاء.\n'
          'لا نشارك معلوماتك مع أطراف خارجية.\n'
          'يمكنك طلب حذف بياناتك في أي وقت.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
