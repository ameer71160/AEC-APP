import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';

class MembersListScreen extends StatelessWidget {
  const MembersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة الأعضاء'),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
          IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columnSpacing: 16,
            headingRowColor: MaterialStateProperty.all(
              AppTheme.primaryColor.withOpacity(0.1),
            ),
            columns: const [
              DataColumn(label: Text('اسم العضو', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('المبلغ الكلي', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('مبلغ السحب', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('المبلغ المجمد', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('المبلغ المودع', style: TextStyle(fontWeight: FontWeight.bold))),
              // ✅ تم حذف عمود "مبلغ السحب بعد الإيداع"
            ],
            rows: MockData.members.map((member) {
              return DataRow(
                cells: [
                  DataCell(
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/member_detail'),
                      child: Text(
                        member['fullName'],
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  DataCell(Text(member['total'].toString())),
                  DataCell(Text(member['withdraw'].toString())),
                  DataCell(Text(member['frozen'].toString())),
                  DataCell(Text(member['deposited'].toString())),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
