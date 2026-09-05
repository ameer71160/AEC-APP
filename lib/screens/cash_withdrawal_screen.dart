import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_theme.dart';
import '../widgets/logo_widget.dart';

class CashWithdrawalScreen extends StatefulWidget {
  const CashWithdrawalScreen({super.key});

  @override
  State<CashWithdrawalScreen> createState() => _CashWithdrawalScreenState();
}

class _CashWithdrawalScreenState extends State<CashWithdrawalScreen> {
  final TextEditingController _amountController = TextEditingController();
  
  // بيانات وهمية للعضو (سيتم جلبها من قاعدة البيانات لاحقاً)
  double _availableBalance = 3500.0;
  double _withdrawableAmount = 1750.0; // نصف الرصيد المتاح

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سحب نقدي'),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const LogoWidget(size: 60, rotateFull: true),
            const SizedBox(height: 24),
            
            // بطاقة المعلومات
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('الرصيد المتاح:'),
                        Text(
                          '${_availableBalance.toStringAsFixed(2)} ريال',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('المبلغ القابل للسحب:'),
                        Text(
                          '${_withdrawableAmount.toStringAsFixed(2)} ريال',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // مربع المبلغ
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              decoration: InputDecoration(
                labelText: 'المبلغ المراد سحبه',
                hintText: 'أدخل المبلغ',
                prefixIcon: const Icon(Icons.money_off_outlined),
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
            
            // زر التأكيد
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitWithdrawal,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: AppTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'تأكيد السحب',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitWithdrawal() {
    if (_amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال المبلغ')),
      );
      return;
    }

    final amount = double.tryParse(_amountController.text) ?? 0;

    if (amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال مبلغ صحيح')),
      );
      return;
    }

    if (amount > _withdrawableAmount) {
      // رسالة الخطأ
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('❌ عملية سحب غير ممكنة'),
          content: Text(
            'ليس لديك إمكانية سحب المبلغ الذي قمت بإدخاله.\n'
            'الحد الأقصى للسحب: ${_withdrawableAmount.toStringAsFixed(2)} ريال\n'
            'حاول سحب مبلغ أقل',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('حسناً'),
            ),
          ],
        ),
      );
      return;
    }

    // رسالة النجاح
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('✅ تم السحب بنجاح'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 60),
            const SizedBox(height: 16),
            Text(
              'لقد قمت بسحب مبلغ ${_amountController.text} ريال بنجاح',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'التاريخ: ${DateTime.now().toLocal().toString().split(' ')[0]}',
              style: const TextStyle(color: Colors.grey),
            ),
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
