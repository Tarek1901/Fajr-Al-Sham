import 'package:flutter/material.dart';
import '../home_dashboard/home_dashboard_widget.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  static String routeName = 'Register';
  static String routePath = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F766E),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'إنشاء حساب جديد',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'انضم إلى فجر الشام للاستثمار',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
              ),
              const SizedBox(height: 6),
              const Text(
                'أدخل بياناتك الأساسية لإنشاء محفظتك الاستثمارية',
                style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 24),

              // حقل الاسم الكامل
              const Text('الاسم الكامل', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person_outline, color: Color(0xFF94A3B8)),
                    hintText: 'الاسم الثلاثي',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Color(0xFFCBD5E1), fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // حقل البريد الإلكتروني
              const Text('البريد الإلكتروني', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email_outlined, color: Color(0xFF94A3B8)),
                    hintText: 'name@example.com',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Color(0xFFCBD5E1), fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // حقل رقم الهاتف / شام كاش
              const Text('رقم الهاتف أو حساب شام كاش', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone_outlined, color: Color(0xFF94A3B8)),
                    hintText: '09xxxxxxxx',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Color(0xFFCBD5E1), fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // حقل كلمة المرور
              const Text('كلمة المرور', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock_outline, color: Color(0xFF94A3B8)),
                    hintText: '••••••••',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Color(0xFFCBD5E1), fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // زر تأكيد إنشاء الحساب (ينقلك للرئيسية)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeDashboardWidget()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F766E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'إنشاء الحساب الان',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
