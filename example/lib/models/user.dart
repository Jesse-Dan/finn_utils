import 'package:finn_utils/utils/builds/lambok/lambok.dart';
import 'package:finn_utils_example/models/user.lambok.g.dart';

@Sterilized()
@Getter()
@Setter()
class User {
  final String firstName;
  final int age;

  User({required this.firstName, required this.age});
}

void main() {
  final user = User(firstName: 'John', age: 30);

  // Example usage of generated code
  print(user.toMap());
  final newUser = user.copyWith(age: 35);
  print(newUser.age);
}
