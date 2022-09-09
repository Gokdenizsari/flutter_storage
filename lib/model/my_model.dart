import 'package:flutter/foundation.dart';

enum Gender { Women, Man, Other }

enum Colors1 { Blue, Orange, Red, Purple }

class UserImformation {
  final String name;
  final Gender gender;
  final List<String> colors1;
  final bool student;

  UserImformation(this.name, this.gender, this.colors1, this.student);

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "gender": describeEnum(gender),
      "colors": colors1,
      "student": student
    };
  }
}
