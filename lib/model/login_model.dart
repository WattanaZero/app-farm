class LoginResponseModel {
  final String token;
  final String username;
  final String firstName;
  final String lastName;
  final String error;

  LoginResponseModel(
      {required this.username, required this.firstName, required this.lastName, required this.token, required this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      username: json["username"] != null ? json["username"] : "",
      firstName: json["firstName"] != null ? json["firstName"] : "",
      lastName: json["lastName"] != null ? json["lastName"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel({
    this.username = '',
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
