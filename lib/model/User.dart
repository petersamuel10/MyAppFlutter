class User {
  final String userId;
  final String userName;
  final String userEmail;
  final String userTelep;
  final String userAddress;

  User(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userTelep,
      this.userAddress});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userId: json['user_id'],
        userName: json['user_name'],
        userEmail: json['user_email'],
        userTelep: json['user_telep'],
        userAddress: json['user_address']);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["user_id"] = userId;
    map["user_name"] = userName;
    map["user_email"] = userEmail;
    map["user_telep"] = userTelep;
    map["user_address"] = userAddress;

    return map;
  }
}
