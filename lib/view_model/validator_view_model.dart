class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email kiritilishi kerak';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email formati noto‘g‘ri';
    }

    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Foydalanuvchi nomi kiritilishi kerak';
    }

    if (value.length < 3) {
      return 'Foydalanuvchi nomi kamida 3 ta belgidan iborat bo‘lishi kerak';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Parol kiritilishi kerak';
    }

    if (value.length < 6) {
      return 'Parol kamida 6 ta belgidan iborat bo‘lishi kerak';
    }

    return null;
  }
}
