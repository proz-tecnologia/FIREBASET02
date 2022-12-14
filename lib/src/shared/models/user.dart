import 'dart:convert';

class UserData {
  final double balance;
  final String userId;
  final String userName;
  UserData({
    this.balance = 0.0,
    required this.userId,
    required this.userName,
  });

  UserData copyWith({
    double? balance,
    String? userId,
    String? userName,
  }) {
    return UserData(
      balance: balance ?? this.balance,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'balance': balance,
      'userId': userId,
      'userName': userName,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      balance: map['balance']?.toDouble() ?? 0.0,
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));

  @override
  String toString() =>
      'User(balance: $balance, userId: $userId, userName: $userName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserData &&
        other.balance == balance &&
        other.userId == userId &&
        other.userName == userName;
  }

  @override
  int get hashCode => balance.hashCode ^ userId.hashCode ^ userName.hashCode;
}
