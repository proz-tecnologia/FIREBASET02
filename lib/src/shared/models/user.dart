import 'dart:convert';

class AppUser {
  final double balance;
  final String userId;
  final String userName;
  AppUser({
    this.balance = 0.0,
    required this.userId,
    required this.userName,
  });

  AppUser copyWith({
    double? balance,
    String? userId,
    String? userName,
  }) {
    return AppUser(
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

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      balance: map['balance']?.toDouble() ?? 0.0,
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() =>
      'User(balance: $balance, userId: $userId, userName: $userName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.balance == balance &&
        other.userId == userId &&
        other.userName == userName;
  }

  @override
  int get hashCode => balance.hashCode ^ userId.hashCode ^ userName.hashCode;
}
