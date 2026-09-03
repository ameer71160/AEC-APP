import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../widgets/custom_textfield.dart';
import '../utils/app_theme.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إيداع')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const LogoWidget(size: 60),
            const SizedBox(height: 30),
            CustomTextField(hintText: 'أدخل اسمك الكامل', prefixIcon: Icons.person),
            const SizedBox(height: 16),
            CustomTextField(hintText: 'أدخل المبلغ المودع', prefixIcon: Icons.attach_money, keyboardType: TextInputType.number),
            const SizedBox(height: 16),
            CustomTextField(hintText: 'أدخل تاريخ الإيداع', prefixIcon: Icons.calendar_today),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('تأكيد الإرسال'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
