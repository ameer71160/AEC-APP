import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../widgets/logo_widget.dart';

class SuggestionsScreen extends StatefulWidget {
  const SuggestionsScreen({super.key});

  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  final TextEditingController _suggestionController = TextEditingController();
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاقتراحات'),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const LogoWidget(size: 60),
            const SizedBox(height: 30),
            const Text(
              'اقتراحاتك تهمنا',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'اكتب اقتراحك أو ملاحظاتك وسيتم إرسالها إلى الإدارة',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: _suggestionController,
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: 'اكتب اقتراحك هنا...',
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
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isSubmitting ? null : _submitSuggestion,
                        child: _isSubmitting
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('إرسال الاقتراح', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitSuggestion() async {
    if (_suggestionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى كتابة اقتراحك قبل الإرسال')),
      );
      return;
    }

    setState(() => _isSubmitting = true);
    
    // محاكاة الإرسال (سيتم ربطه بقاعدة البيانات لاحقاً)
    await Future.delayed(const Duration(seconds: 1));
    
    setState(() => _isSubmitting = false);
    _suggestionController.clear();
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم إرسال اقتراحك بنجاح، شكراً لك')),
    );
    
    // في المستقبل: إرسال إشعار إلى صفحة الإدارة
  }
}
