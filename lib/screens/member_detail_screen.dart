import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';

class MemberDetailScreen extends StatelessWidget {
  const MemberDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل العضو'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'custom', child: Text('إرسال إشعار مخصص')),
              PopupMenuItem(value: 'deposit', child: Text('تنبيه إيداع')),
              PopupMenuItem(value: 'withdraw', child: Text('تنبيه سحب')),
              PopupMenuItem(value: 'update', child: Text('تنبيه تحديث')),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const LogoWidget(size: 50),
            const SizedBox(height: 20),
            const Text('أحمد محمد علي', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            // بطاقات المعلومات
            Row(
              children: [
                Expanded(child: _infoCard('الرصيد الكلي', '3500', Colors.blue)),
                Expanded(child: _infoCard('القابل للسحب', '3500', Colors.green)),
                Expanded(child: _infoCard('المجمد', '3300', Colors.orange)),
              ],
            ),
            const SizedBox(height: 24),
            // الجدول
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('تاريخ الإيداع(1)')),
                  DataColumn(label: Text('المبلغ المودع(1)')),
                  DataColumn(label: Text('الرصيد المجمد(1)')),
                  DataColumn(label: Text('تاريخ السحب(1)')),
                  DataColumn(label: Text('المبلغ المسحوب(1)')),
                  DataColumn(label: Text('الرصيد القابل(1)')),
                  DataColumn(label: Text('تاريخ الإيداع(2)')),
                  DataColumn(label: Text('المبلغ المودع(2)')),
                  DataColumn(label: Text('الرصيد المجمد(2)')),
                  DataColumn(label: Text('تاريخ السحب(2)')),
                  DataColumn(label: Text('المبلغ المسحوب(2)')),
                  DataColumn(label: Text('الرصيد الكلي')),
                ],
                rows: MockData.transactions.map((t) {
                  return DataRow(cells: [
                    DataCell(Text(t['date'])),
                    DataCell(Text(t['amount'].toString())),
                    DataCell(Text('3300')),
                    DataCell(Text(t['date'])),
                    DataCell(Text('200')),
                    DataCell(Text('3500')),
                    DataCell(Text(t['date'])),
                    DataCell(Text(t['amount'].toString())),
                    DataCell(Text('3300')),
                    DataCell(Text(t['date'])),
                    DataCell(Text('200')),
                    DataCell(Text('3500')),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String label, String value, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
            Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
