// بيانات وهمية للأعضاء
class MockData {
  static List<Map<String, dynamic>> members = [
    {
      'id': 1,
      'fullName': 'أحمد محمد علي',
      'phone': '0096771234567',
      'total': 3500,
      'withdraw': 200,
      'frozen': 3300,
      'deposited': 300,
      'afterWithdraw': 3500,
    },
    {
      'id': 2,
      'fullName': 'سارة خالد حسن',
      'phone': '0096772345678',
      'total': 4300,
      'withdraw': 300,
      'frozen': 4000,
      'deposited': 600,
      'afterWithdraw': 4300,
    },
    // ... يمكن إضافة المزيد (حتى 1000)
  ];

  static List<Map<String, dynamic>> transactions = [
    {
      'date': '2026/08/18',
      'time': '10:00 ص',
      'type': 'deposit',
      'amount': 300,
      'frozen': false,
    },
    {
      'date': '2026/08/18',
      'time': '09:00 ص',
      'type': 'withdraw',
      'amount': 200,
      'frozen': true,
    },
    // ... المزيد
  ];

  static List<Map<String, dynamic>> notifications = [
    {
      'title': 'تنبيه إيداع',
      'message': 'شكراً عزيزي العميل، لقد قمت بعملية إيداع، تفقد رصيدك',
      'type': 'deposit',
      'isRead': false,
    },
    {
      'title': 'تحديث التطبيق',
      'message': 'عزيزي العضو، يرجى تحديث التطبيق',
      'type': 'update',
      'isRead': true,
    },
  ];
}
