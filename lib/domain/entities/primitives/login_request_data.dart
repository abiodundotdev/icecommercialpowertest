class LoginRequestData {
  LoginRequestData({this.username, this.password});
  String? username;
  String? password;

  Map<String, dynamic> toMap() {
    return {'username': username, 'password': password};
  }

  bool get isValid => username != null && password != null;

  @override
  String toString() {
    return "LoginRequestData(username : $username, password : $password)";
  }
}
