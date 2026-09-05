import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';
import '../utils/app_theme.dart';
import 'advance_payment_screen.dart';
import 'pay_other_member_screen.dart';
import 'cash_withdrawal_screen.dart';

class MemberInfoScreen extends StatefulWidget {
  const MemberInfoScreen({super.key});

  @override
  State<MemberInfoScreen> createState() => _MemberInfoScreenState();
}

class _MemberInfoScreenState extends State<MemberInfoScreen> {
  // بيانات وهمية للعضو
  final String fullName = 'أحمد محمد علي';
  final String phoneNumber = '0096771234567';
  double frozenAmount = 3300.0;
  double withdrawnAmount = 200.0;
  double lastDepositAmount = 300.0;
  double availableAmount = 3500.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('معلوماتي'),
        backgroundColor: AppTheme.primaryColor,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // التنقل إلى الصفحات المطلوبة
              switch (value) {
                case 'سداد مقدم':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdvancePaymentScreen(),
                    ),
                  );
                  break;
                case 'سداد لحساب عضو آخر':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PayOtherMemberScreen(),
                    ),
                  );
                  break;
                case 'سحب نقدي':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CashWithdrawalScreen(),
                    ),
                  );
                  break;
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'سداد مقدم', child: Text('سداد مقدم')),
              PopupMenuItem(value: 'سداد لحساب عضو آخر', child: Text('سداد لحساب عضو آخر')),
              PopupMenuItem(value: 'سحب نقدي', child: Text('سحب نقدي')),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const LogoWidget(size: 60, rotateFull: true),
            const SizedBox(height: 20),
            Text(
              fullName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              phoneNumber,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            
            // الجدول (4 أعمدة × صفان)
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Table(
                  border: TableBorder.all(color: Colors.grey.shade300),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                  },
                  children: [
                    // الصف الأول (العناوين)
                    TableRow(
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withOpacity(0.1),
                      ),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('الرصيد المجمد', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('المبلغ المسحوب', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('المبلغ المودع (آخر مرة)', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('المبلغ القابل للسحب', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    // الصف الثاني (القيم العددية)
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(frozenAmount.toStringAsFixed(0), style: const TextStyle(fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(withdrawnAmount.toStringAsFixed(0), style: const TextStyle(fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(lastDepositAmount.toStringAsFixed(0), style: const TextStyle(fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            availableAmount.toStringAsFixed(0),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // سجل العمليات
            const Text(
              'سجل العمليات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildTransactionItem(
                    type: 'إيداع',
                    amount: 300,
                    date: '2026/08/18 10:00 ص',
                    isDeposit: true,
                  ),
                  _buildTransactionItem(
                    type: 'سحب',
                    amount: 200,
                    date: '2026/08/18 09:00 ص',
                    isDeposit: false,
                  ),
                  _buildTransactionItem(
                    type: 'إيداع',
                    amount: 500,
                    date: '2026/08/17 11:00 ص',
                    isDeposit: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required String type,
    required double amount,
    required String date,
    required bool isDeposit,
  }) {
    return ListTile(
      leading: Icon(
        isDeposit ? Icons.arrow_downward : Icons.arrow_upward,
        color: isDeposit ? Colors.green : Colors.red,
      ),
      title: Text(type),
      subtitle: Text(date),
      trailing: Text(
        isDeposit ? '+$amount' : '-$amount',
        style: TextStyle(
          color: isDeposit ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
