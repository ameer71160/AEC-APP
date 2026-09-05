import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/logo_widget.dart';
import '../widgets/animated_text.dart';
import '../widgets/custom_textfield.dart';
import '../utils/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  bool _obscurePassword = true;

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
                  // شعار دوار 360 درجة
                  LogoWidget(size: 100, rotateFull: true),
                  const SizedBox(height: 20),
                  
                  // نص ترحيبي متحرك ببطء
                  AnimatedText(
                    text: 'أهلاً بك في جمعيتنا المميزة AEC',
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    speed: 80,
                  ),
                  const SizedBox(height: 40),
                  
                  // بطاقة الدخول
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _fullNameController,
                              hintText: 'أدخل اسمك الكامل',
                              prefixIcon: Icons.person_outline,
                              validator: (v) => v!.isEmpty ? 'يرجى إدخال الاسم' : null,
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: 'أدخل كلمة مرورك',
                              prefixIcon: Icons.lock_outline,
                              obscureText: _obscurePassword,
                              suffixIcon: IconButton(
                                icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                              ),
                              validator: (v) => v!.length < 6 ? 'كلمة المرور 6 أحرف على الأقل' : null,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  // إرسال كلمة مرور مؤقتة إلى البريد الإلكتروني
                                  _showForgotPasswordDialog();
                                },
                                child: const Text('نسيت كلمة المرور؟', style: TextStyle(color: AppTheme.primaryColor)),
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              controller: _phoneController,
                              hintText: 'أدخل رقم هاتف الحساب',
                              prefixIcon: Icons.phone_outlined,
                              keyboardType: TextInputType.phone,
                            ),
                            const SizedBox(height: 16),
                            // حقل البريد الإلكتروني الجديد
                            CustomTextField(
                              controller: _emailController,
                              hintText: 'أدخل بريدك الإلكتروني',
                              prefixIcon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              validator: (v) {
                                if (v!.isEmpty) return 'يرجى إدخال البريد الإلكتروني';
                                if (!v.contains('@')) return 'بريد إلكتروني غير صحيح';
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushReplacementNamed(context, '/dashboard');
                                  }
                                },
                                child: const Text('دخول', style: TextStyle(fontSize: 18)),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextButton(
                              onPressed: _showMembershipRequestDialog,
                              child: const Text('طلب عضوية', style: TextStyle(fontSize: 16, color: AppTheme.primaryColor)),
                            ),
                          ],
                        ),
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

  void _showForgotPasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إعادة تعيين كلمة المرور'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('سيتم إرسال كلمة مرور مؤقتة إلى بريدك الإلكتروني.'),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _emailController,
              hintText: 'أدخل بريدك الإلكتروني',
              prefixIcon: Icons.email_outlined,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
          ElevatedButton(
            onPressed: () {
              // إرسال OTP إلى البريد الإلكتروني (سيتم ربطه لاحقاً)
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم إرسال كلمة مرور مؤقتة إلى بريدك الإلكتروني')),
              );
            },
            child: const Text('إرسال'),
          ),
        ],
      ),
    );
  }

  void _showMembershipRequestDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('طلب عضوية'),
        content: const Text('سيتم إرسال طلب عضويتك إلى الإدارة للموافقة عليه.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم إرسال طلب العضوية إلى الإدارة')),
              );
              // في المستقبل: إرسال إشعار إلى صفحة الإدارة
            },
            child: const Text('إرسال'),
          ),
        ],
      ),
    );
  }
}
