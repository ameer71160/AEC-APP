import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/animated_text.dart';
import '../widgets/custom_textfield.dart';
import '../utils/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.primaryGradientStart, AppTheme.primaryGradientEnd],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // شعار متحرك
                  const LogoWidget(size: 100),
                  const SizedBox(height: 20),
                  // نص ترحيبي متحرك
                  AnimatedText(
                    text: 'أهلاً بك عزيزي العضو في جمعية Advanced Empowerment Community المحترمة',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 40),
                  // بطاقة الدخول
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          CustomTextField(
                            hintText: 'أدخل اسمك الكامل',
                            prefixIcon: Icons.person_outline,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            hintText: 'أدخل كلمة مرورك',
                            prefixIcon: Icons.lock_outline,
                            obscureText: true,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('نسيت كلمة المرور؟', style: TextStyle(color: AppTheme.primaryColor)),
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            hintText: 'أدخل رقم هاتف الحساب',
                            prefixIcon: Icons.phone_outlined,
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/dashboard');
                              },
                              child: const Text('دخول', style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () {},
                            child: const Text('طلب عضوية', style: TextStyle(fontSize: 16, color: AppTheme.primaryColor)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
