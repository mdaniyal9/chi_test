class LoginResult {
  final String? token;
  final String? userType;

  LoginResult(this.token, this.userType);

  static LoginResult fromMap(Map<String, dynamic> resp) {
    return LoginResult(resp['Token'] as String?, resp['user_type'] as String?);
  }
}