import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/admin_login_screen.dart';
import 'screens/admin_dashboard.dart';
import 'screens/members_list_screen.dart';
import 'screens/member_detail_screen.dart';
import 'screens/deposit_screen.dart';
import 'screens/features_screen.dart';
import 'screens/terms_screen.dart';
import 'screens/privacy_screen.dart';
import 'screens/my_notifications_screen.dart';
import 'screens/about_screen.dart';
import 'screens/archive_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/suggestions_screen.dart';
import 'screens/member_info_screen.dart';
import 'utils/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AEC Community',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/admin_login': (context) => const AdminLoginScreen(),
        '/admin_dashboard': (context) => const AdminDashboard(),
        '/members_list': (context) => const MembersListScreen(),
        '/member_detail': (context) => const MemberDetailScreen(),
        '/suggestions': (context) => const SuggestionsScreen(), // جديد
        '/features': (context) => const FeaturesScreen(),
        '/terms': (context) => const TermsScreen(),
        '/privacy': (context) => const PrivacyScreen(),
        '/notifications': (context) => const MyNotificationsScreen(),
        '/about': (context) => const AboutScreen(),
        '/archive': (context) => const ArchiveScreen(),
        '/settings': (context) => const SettingsScreen(), // جديد
        '/member_info': (context) => const MemberInfoScreen(), // سيتم إضافته لاحقاً
      },
    );
  }
}
