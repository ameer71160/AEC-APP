import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/admin_login_screen.dart';
import 'screens/admin_dashboard.dart';
import 'screens/members_list_screen.dart';
import 'screens/member_detail_screen.dart';
import 'screens/features_screen.dart';
import 'screens/terms_screen.dart';
import 'screens/privacy_screen.dart';
import 'screens/my_notifications_screen.dart';
import 'screens/about_screen.dart';
import 'screens/archive_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/suggestions_screen.dart';
import 'screens/member_info_screen.dart';
import 'screens/advance_payment_screen.dart';
import 'screens/pay_other_member_screen.dart';
import 'screens/cash_withdrawal_screen.dart';
import 'screens/admin_notifications_screen.dart';
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
        '/suggestions': (context) => const SuggestionsScreen(),
        '/features': (context) => const FeaturesScreen(),
        '/terms': (context) => const TermsScreen(),
        '/privacy': (context) => const PrivacyScreen(),
        '/notifications': (context) => const MyNotificationsScreen(),
        '/about': (context) => const AboutScreen(),
        '/archive': (context) => const ArchiveScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/member_info': (context) => const MemberInfoScreen(),
        '/advance_payment': (context) => const AdvancePaymentScreen(),
        '/pay_other_member': (context) => const PayOtherMemberScreen(),
        '/cash_withdrawal': (context) => const CashWithdrawalScreen(),
        '/admin_notifications': (context) => const AdminNotificationsScreen(),
      },
    );
  }
}
