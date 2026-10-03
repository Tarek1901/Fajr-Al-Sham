import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> signInWithEmailDirect(String email, String password) async {
  // مفتاح الـ API الخاص بمشروعك (تستطيع جلبه من ملف google-services.json تحت حقل current_key)
  const String apiKey = 'AIzaSyCkNo6ySEgBWk1c1iet9LQN4KcDVy9wBOI';
  
  final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey');
  
  try {
    final response = await http.post(
      url,
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // تم تسجيل الدخول بنجاح!
      String idToken = responseData['idToken'];
      print('تم تسجيل الدخول بنجاح، الرمز: $idToken');
      // هنا تنقل المستخدم إلى الشاشة الرئيسية
    } else {
      // حدث خطأ (مثل كلمة المرور خاطئة أو الإيميل غير موجود)
      String errorMessage = responseData['error']['message'];
      print('خطأ في تسجيل الدخول: $errorMessage');
    }
  } catch (e) {
    print('خطأ في الاتصال: $e');
  }
}
