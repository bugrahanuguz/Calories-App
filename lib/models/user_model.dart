// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:softito_final_project/models/nutritions_model.dart';

class UserModel {
  String? id;
  String? name;
  int? age;
  String? email;
  String? password;
  List<Nutritions>? nutritions;
  UserModel({
    this.id,
    this.name,
    this.age,
    this.email,
    this.password,
    this.nutritions,
  });

  UserModel copyWith({
    String? id,
    String? name,
    int? age,
    String? email,
    String? password,
    List<Nutritions>? nutritions,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
      password: password ?? this.password,
      nutritions: nutritions ?? this.nutritions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'email': email,
      'password': password,
      'nutritions': nutritions?.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      nutritions: map['nutritions'] != null
          ? List<Nutritions>.from(
              (map['nutritions'] as List<int>).map<Nutritions?>(
                (x) => Nutritions.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, age: $age, email: $email, password: $password, nutritions: $nutritions)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.age == age &&
        other.email == email &&
        other.password == password &&
        listEquals(other.nutritions, nutritions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        age.hashCode ^
        email.hashCode ^
        password.hashCode ^
        nutritions.hashCode;
  }
}
