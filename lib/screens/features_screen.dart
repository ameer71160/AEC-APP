import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الميزات')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text('ميزة 1: حسابات شفافة')),
          ListTile(title: Text('ميزة 2: سهولة الإيداع والسحب')),
          ListTile(title: Text('ميزة 3: إشعارات فورية')),
          ListTile(title: Text('ميزة 4: تقارير شهرية')),
        ],
      ),
    );
  }
}
