class AuthValidators {
  AuthValidators._();

  // ─── Field-level validators ────────────────────────────────────────────────

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Name is required';
    if (value.trim().length < 3) return 'Name must be at least 3 characters';
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) return 'Enter a valid email address';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  static String? Function(String?) validateConfirmPassword(String? password) {
    return (String? value) {
      if (value == null || value.isEmpty) return 'Please confirm your password';
      if (value != password) return 'Passwords do not match';
      return null;
    };
  }

  // ─── Form-level helpers ────────────────────────────────────────────────────

  /// Returns the first validation error for the Sign In form, or null if valid.
  static String? getFirstSignInError({
    required String? email,
    required String? password,
  }) {
    return validateEmail(email) ?? validatePassword(password);
  }

  /// Returns the first validation error for the Sign Up form, or null if valid.
  static String? getFirstSignUpError({
    required String? name,
    required String? email,
    required String? password,
    required String? confirmPassword,
  }) {
    return validateName(name) ??
        validateEmail(email) ??
        validatePassword(password) ??
        validateConfirmPassword(password)(confirmPassword);
  }
}
