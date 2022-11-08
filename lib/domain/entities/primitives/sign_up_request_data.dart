class SignUpRequestData {
  SignUpRequestData(
      {this.username, this.password, this.firstname, this.lastname});

  String? password;

  String? username;

  String? firstname;

  String? lastname;

  bool get isValid =>
      username != null &&
      password != null &&
      firstname != null &&
      lastname != null;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
      'username': username,
      'first_name': firstname,
      'last_name': lastname
    };
  }
}
