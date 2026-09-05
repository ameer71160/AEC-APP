import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/dashboard_card.dart';
import '../utils/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AEC Community'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: () {}),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.primaryColor, AppTheme.primaryGradientEnd],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const LogoWidget(size: 60),
              const SizedBox(height: 20),
              const Text(
                'مرحباً بك في جمعية AEC',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                    children: [
                      DashboardCard(
                        title: 'الإدارة',
                        icon: Icons.admin_panel_settings,
                        color: Colors.amber,
                        onTap: () => Navigator.pushNamed(context, '/admin_login'),
                      ),
                      DashboardCard(
                        title: 'معلوماتي',
                        icon: Icons.person_outline,
                        color: Colors.blue,
                        onTap: () => Navigator.pushNamed(context, '/member_info'),
                      ),
                      DashboardCard(
                        title: 'الاقتراحات', // بدلاً من الإيداع
                        icon: Icons.feedback_outlined,
                        color: Colors.green,
                        onTap: () => Navigator.pushNamed(context, '/suggestions'),
                      ),
                      DashboardCard(
                        title: 'الميزات',
                        icon: Icons.star_outline,
                        color: Colors.purple,
                        onTap: () => Navigator.pushNamed(context, '/features'),
                      ),
                      DashboardCard(
                        title: 'البنود والشروط',
                        icon: Icons.description_outlined,
                        color: Colors.orange,
                        onTap: () => Navigator.pushNamed(context, '/terms'),
                      ),
                      DashboardCard(
                        title: 'السياسة والخصوصية',
                        icon: Icons.privacy_tip_outlined,
                        color: Colors.teal,
                        onTap: () => Navigator.pushNamed(context, '/privacy'),
                      ),
                      DashboardCard(
                        title: 'إشعاراتي',
                        icon: Icons.notifications_outlined,
                        color: Colors.red,
                        onTap: () => Navigator.pushNamed(context, '/notifications'),
                      ),
                      DashboardCard(
                        title: 'الإعدادات', // صفحة جديدة
                        icon: Icons.settings_outlined,
                        color: Colors.grey,
                        onTap: () => Navigator.pushNamed(context, '/settings'),
                      ),
                      DashboardCard(
                        title: 'حول التطبيق',
                        icon: Icons.info_outline,
                        color: Colors.indigo,
                        onTap: () => Navigator.pushNamed(context, '/about'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
