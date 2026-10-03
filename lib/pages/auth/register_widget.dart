Future<void> signUpWithEmailDirect(String email, String password) async {
  const String apiKey = 'ضع_مفتاح_الـ_API_هنا';
  
  final url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey');
  
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
      // تم إنشاء الحساب بنجاح!
      print('تم إنشاء الحساب بنجاح');
      // هنا تنقل المستخدم إلى الشاشة الرئيسية
    } else {
      String errorMessage = responseData['error']['message'];
      print('خطأ في إنشاء الحساب: $errorMessage');
    }
  } catch (e) {
    print('خطأ في الاتصال: $e');
  }
}
