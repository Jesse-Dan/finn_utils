// **************************************************************************
// LambokGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// Jesse Dan

import 'user.dart';

extension UserExtensions on User {
  Map<String, dynamic> toMap() {
    return {'firstName': firstName, 'age': age};
  }

  User copyWith({String? firstName, int? age}) {
    return User(firstName: firstName ?? this.firstName, age: age ?? this.age);
  }
}

// Factory method added to the original class
extension UserFromMap on User {
  static User fromMap(Map<String, dynamic> map) {
    return User(firstName: map['firstName'] as String, age: map['age'] as int);
  }
}
