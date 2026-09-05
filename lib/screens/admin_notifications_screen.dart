import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class AdminNotificationsScreen extends StatefulWidget {
  const AdminNotificationsScreen({super.key});

  @override
  State<AdminNotificationsScreen> createState() => _AdminNotificationsScreenState();
}

class _AdminNotificationsScreenState extends State<AdminNotificationsScreen> {
  // بيانات وهمية للإشعارات (سيتم جلبها من قاعدة البيانات لاحقاً)
  List<Map<String, dynamic>> _notifications = [
    {
      'memberName': 'أحمد محمد علي',
      'type': 'إيداع',
      'amount': 300,
      'date': '2026/08/18 10:00 ص',
      'message': 'لقد قمت بإيداع مبلغ 300 ريال',
      'isRead': false,
    },
    {
      'memberName': 'سارة خالد حسن',
      'type': 'سحب',
      'amount': 200,
      'date': '2026/08/18 09:00 ص',
      'message': 'لقد قمت بسحب مبلغ 200 ريال',
      'isRead': false,
    },
    {
      'memberName': 'أحمد محمد علي',
      'type': 'سداد مقدم',
      'amount': 500,
      'date': '2026/08/17 11:00 ص',
      'message': 'لقد قمت بسداد مقدم بقيمة 500 ريال',
      'isRead': true,
    },
    {
      'memberName': 'خالد سعيد',
      'type': 'سداد لحساب عضو آخر',
      'amount': 150,
      'date': '2026/08/16 02:30 م',
      'message': 'لقد قمت بالسداد إلى حساب محمد علي مبلغ 150 ريال',
      'isRead': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إشعارات الإدارة'),
        backgroundColor: AppTheme.primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.check_circle_outline),
            onPressed: () {
              setState(() {
                for (var notification in _notifications) {
                  notification['isRead'] = true;
                }
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم تعليم جميع الإشعارات كمقروءة')),
              );
            },
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? const Center(
              child: Text('لا توجد إشعارات', style: TextStyle(fontSize: 16)),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _getTypeColor(notification['type']),
                      child: Text(
                        notification['type'][0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      '${notification['memberName']} - ${notification['type']}',
                      style: TextStyle(
                        fontWeight: notification['isRead'] 
                            ? FontWeight.normal 
                            : FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notification['message']),
                        const SizedBox(height: 4),
                        Text(
                          notification['date'],
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: notification['isRead']
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : const Icon(Icons.circle, color: Colors.blue, size: 12),
                    onTap: () {
                      setState(() {
                        notification['isRead'] = true;
                      });
                      _showNotificationDetail(notification);
                    },
                  ),
                );
              },
            ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'إيداع':
        return Colors.green;
      case 'سحب':
        return Colors.red;
      case 'سداد مقدم':
        return Colors.blue;
      case 'سداد لحساب عضو آخر':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  void _showNotificationDetail(Map<String, dynamic> notification) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${notification['type']} - ${notification['memberName']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('المبلغ: ${notification['amount']} ريال'),
            const SizedBox(height: 8),
            Text('التاريخ: ${notification['date']}'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                notification['message'],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إغلاق'),
          ),
        ],
      ),
    );
  }
}
