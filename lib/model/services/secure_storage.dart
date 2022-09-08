import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_storage/model/gender.dart';

class SecureStorageService {
  late final FlutterSecureStorage preferences;
  void saveData(UserImformation userImformation) async {
    final _name = userImformation.name;

    await preferences.write(key: "name", value: _name);
    await preferences.write(
        key: "student", value: userImformation.student.toString());
    await preferences.write(
        key: "gender", value: userImformation.gender.index.toString());

    await preferences.write(
        key: "colors", value: jsonEncode(userImformation.colors1));
  }

  Future readData() async {
    preferences = FlutterSecureStorage();
    var _name = await preferences.read(key: "name") ?? "";
    var _studentString = await preferences.read(key: "student") ?? "false";
    var _student = _studentString.toLowerCase() == "true" ? true : false;
    var _genderString = await preferences.read(key: "gender") ?? "0";
    var _gender = Gender.values[int.parse(_genderString)];
    var _colors1String = await preferences.read(key: "colors") ?? "";
    var _colors1 =_colors1String==null ? <String>[] : List<String>.from(jsonDecode(_colors1String));

    return UserImformation(_name, _gender, _colors1, _student);
  }
}
