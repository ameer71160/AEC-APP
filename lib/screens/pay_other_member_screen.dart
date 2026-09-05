import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_theme.dart';
import '../widgets/logo_widget.dart';

class PayOtherMemberScreen extends StatefulWidget {
  const PayOtherMemberScreen({super.key});

  @override
  State<PayOtherMemberScreen> createState() => _PayOtherMemberScreenState();
}

class _PayOtherMemberScreenState extends State<PayOtherMemberScreen> {
  final TextEditingController _payerNameController = TextEditingController();
  final TextEditingController _payerPhoneController = TextEditingController();
  final TextEditingController _receiverNameController = TextEditingController();
  final TextEditingController _receiverPhoneController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  // بيانات وهمية للعضو الحالي (سيتم جلبها من قاعدة البيانات لاحقاً)
  double _availableBalance = 3500.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سداد لحساب عضو آخر'),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const LogoWidget(size: 60, rotateFull: true),
            const SizedBox(height: 24),
            
            // بطاقة الرصيد المتاح
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.primaryColor.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'الرصيد المتاح:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${_availableBalance.toStringAsFixed(2)} ريال',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // الدائن (الذي يقوم بالسداد)
            const Text(
              'بيانات الدائن (أنت)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _payerNameController,
              decoration: InputDecoration(
                labelText: 'اسم الدائن',
                hintText: 'أدخل اسمك الكامل',
                prefixIcon: const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _payerPhoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'رقم الدائن',
                hintText: 'أدخل رقم هاتفك',
                prefixIcon: const Icon(Icons.phone_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
            ),
            
            const SizedBox(height: 24),
            
            // المديون (الذي يتم السداد لحسابه)
            const Text(
              'بيانات المديون (المستلم)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _receiverNameController,
              decoration: InputDecoration(
                labelText: 'اسم المديون',
                hintText: 'أدخل اسم العضو المستلم',
                prefixIcon: const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _receiverPhoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'رقم المديون',
                hintText: 'أدخل رقم هاتف المستلم',
                prefixIcon: const Icon(Icons.phone_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // المبلغ
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              decoration: InputDecoration(
                labelText: 'المبلغ (ريال سعودي)',
                hintText: 'أدخل المبلغ المراد تحويله',
                prefixIcon: const Icon(Icons.attach_money),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
            ),
            
            const SizedBox(height: 24),
            
            // زر التأكيد
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitPayment,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: AppTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'تأكيد السداد',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitPayment() {
    // التحقق من المدخلات
    if (_amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال المبلغ')),
      );
      return;
    }

    final amount = double.tryParse(_amountController.text) ?? 0;
    
    // التحقق من الرصيد
    if (amount > _availableBalance) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '⚠️ الرصيد غير كافٍ! الرصيد المتاح: ${_availableBalance.toStringAsFixed(2)} ريال',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // محاكاة الإرسال
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('✅ تم السداد بنجاح'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('تم تحويل ${_amountController.text} ريال'),
            const SizedBox(height: 8),
            Text('من: ${_payerNameController.text}'),
            Text('إلى: ${_receiverNameController.text}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('تم'),
          ),
        ],
      ),
    );
  }
}
