import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('البنود والشروط')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          '1. الالتزام بقوانين الجمعية.\n'
          '2. دفع الاشتراكات في موعدها.\n'
          '3. المحافظة على سرية الحساب.\n'
          '4. يمكن تعديل البنود بموافقة الإدارة.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
