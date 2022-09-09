import 'package:flutter_storage/model/my_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceServices {
  void saveData(UserImformation userImformation) async {
    final _name = userImformation.name;
    final preferences = await SharedPreferences.getInstance();
    preferences.setString("name", _name);
    preferences.setBool("student", userImformation.student);
    preferences.setInt("gender", userImformation.gender.index);
    preferences.setStringList("colors", userImformation.colors1);
  }

  Future readData() async {
    final preferences = await SharedPreferences.getInstance();

    var _name = preferences.getString("name") ?? "";
    var _student = preferences.getBool("student") ?? false;
    var _gender = Gender.values[preferences.getInt("gender") ?? 0];
    var _colors1 = preferences.getStringList("colors") ?? <String>[];

    return UserImformation(_name, _gender, _colors1, _student);
  }
}
