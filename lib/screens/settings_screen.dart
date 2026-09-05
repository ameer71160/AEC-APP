import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  String _selectedLanguage = 'العربية';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات'),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: SwitchListTile(
              title: const Text('الوضع الليلي'),
              subtitle: const Text('تفعيل الوضع المظلم'),
              value: _darkMode,
              onChanged: (value) {
                setState(() => _darkMode = value);
                // تطبيق الثيم سيتم لاحقاً
              },
              secondary: const Icon(Icons.dark_mode),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('اللغة'),
              subtitle: Text(_selectedLanguage),
              leading: const Icon(Icons.language),
              onTap: () {
                _showLanguageDialog();
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('إشعارات التطبيق'),
              subtitle: const Text('تفعيل/تعطيل الإشعارات'),
              leading: const Icon(Icons.notifications),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('مسح البيانات المؤقتة'),
              subtitle: const Text('تحرير مساحة التخزين'),
              leading: const Icon(Icons.cleaning_services),
              onTap: () {
                _showClearCacheDialog();
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'الإصدار: 1.0.0',
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('اختر اللغة'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('العربية'),
              leading: const Icon(Icons.flag),
              onTap: () {
                setState(() => _selectedLanguage = 'العربية');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('English'),
              leading: const Icon(Icons.flag),
              onTap: () {
                setState(() => _selectedLanguage = 'English');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showClearCacheDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('مسح البيانات المؤقتة'),
        content: const Text('هل أنت متأكد من رغبتك في مسح جميع البيانات المؤقتة؟'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم مسح البيانات المؤقتة')),
              );
            },
            child: const Text('مسح'),
          ),
        ],
      ),
    );
  }
}
