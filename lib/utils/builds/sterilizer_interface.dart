// lib/utils/builds/sterilizer_interface.dart
library sterilizer_interface;

abstract class SterilizerInterface<T> {
  Map<String, dynamic> toMap(T type);

  T fromMap(Map<String, dynamic> jsonString);

  T copyWith(T type);

  @override
  String toString();
}
