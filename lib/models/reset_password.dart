// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResetPasswordModel {
  String email;
  String requestType;
  ResetPasswordModel({
    required this.email,
    required this.requestType,
  });

  ResetPasswordModel copyWith({
    String? email,
    String? requestType,
  }) {
    return ResetPasswordModel(
      email: email ?? this.email,
      requestType: requestType ?? this.requestType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'requestType': requestType,
    };
  }

  factory ResetPasswordModel.fromMap(Map<String, dynamic> map) {
    return ResetPasswordModel(
      email: map['email'] as String,
      requestType: map['requestType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResetPasswordModel.fromJson(String source) =>
      ResetPasswordModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ResetPasswordModel(email: $email, requestType: $requestType)';

  @override
  bool operator ==(covariant ResetPasswordModel other) {
    if (identical(this, other)) return true;

    return other.email == email && other.requestType == requestType;
  }

  @override
  int get hashCode => email.hashCode ^ requestType.hashCode;
}
