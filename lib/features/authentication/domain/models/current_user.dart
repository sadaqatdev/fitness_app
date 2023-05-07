import 'dart:convert';

import 'package:equatable/equatable.dart';

class CurrentUser extends Equatable {
  final String name;
  final String email;
  final String uid;
  final String profilePicUrl;
  const CurrentUser(
      {required this.name,
      required this.email,
      required this.uid,
      required this.profilePicUrl});

  @override
  List<Object?> get props => [];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'uid': uid});
    result.addAll({'profilePicUrl': profilePicUrl});

    return result;
  }

  factory CurrentUser.fromMap(Map<String, dynamic> map) {
    return CurrentUser(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
      profilePicUrl: map['profilePicUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentUser.fromJson(String source) =>
      CurrentUser.fromMap(json.decode(source));
}
