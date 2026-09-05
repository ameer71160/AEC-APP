import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../widgets/dashboard_card.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة المدير'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
          children: [
            DashboardCard(
              title: 'قائمة الأعضاء',
              icon: Icons.people,
              color: Colors.blue,
              onTap: () => Navigator.pushNamed(context, '/members_list'),
            ),
            DashboardCard(
              title: 'إرشيف الإدارة',
              icon: Icons.archive,
              color: Colors.brown,
              onTap: () => Navigator.pushNamed(context, '/archive'),
            ),
            DashboardCard(
              title: 'الإشعارات',
              icon: Icons.notifications_active,
              color: Colors.red,
              onTap: () => Navigator.pushNamed(context, '/admin_notifications'),
            ),
            DashboardCard(
              title: 'الإعدادات',
              icon: Icons.settings,
              color: Colors.grey,
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
      ),
    );
  }
}
