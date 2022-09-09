import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_storage/model/gender.dart';
import 'package:flutter_storage/model/services/file_storage%20.dart';
import 'package:flutter_storage/model/services/secure_storage.dart';
import 'package:flutter_storage/model/services/sherad_pref_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencePage extends StatefulWidget {
  const SharePreferencePage({Key? key}) : super(key: key);

  @override
  State<SharePreferencePage> createState() => _SharePreferencePageState();
}

class _SharePreferencePageState extends State<SharePreferencePage> {
  var _selectedGender = Gender.Women;

  var _selectedColors = <String>[];

  var _student = false;

  TextEditingController _nameController = TextEditingController();
  var _preferenceService = FileStorageService();

  @override
  void initState() {
    super.initState();
    _preferenceService.readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Enter  Your Name"),
            ),
          ),
          /*RadioListTile(
              title: Text("Women"),
              value: Gender.Women,
              groupValue: _selectedGender,
              onChanged: (Gender? selectedGender) {
                setState(() {
                  _selectedGender = selectedGender!;
                });
              }),
          ListTile(
            title: TextField(
              decoration: InputDecoration(labelText: "Enter  Your Name"),
            ),
          ),
          RadioListTile(
              title: Text("Man"),
              value: Gender.Man,
              groupValue: _selectedGender,
              onChanged: (Gender? selectedGender) {
                setState(() {
                  _selectedGender = selectedGender!;
                });
              }),
          ListTile(
            title: TextField(
              decoration: InputDecoration(labelText: "Enter  Your Name"),
            ),
          ),
          RadioListTile(
              title: Text("Other"),
              value: Gender.Other,
              groupValue: _selectedGender,
              onChanged: (Gender? selectedGender) {
                setState(() {
                  _selectedGender = selectedGender!;
                });
              }),*/
          for (var item in Gender.values)
            _buildRadioListTiles(describeEnum(item), item),
          /* _buildRadioListTiles("Man", Gender.Man),
          _buildRadioListTiles("Women", Gender.Women),
          _buildRadioListTiles("Other", Gender.Other),*/
          for (var item in Colors1.values) _buildChecboxListTiles(item),
          /* _buildChecboxListTiles(Colors1.Blue),
          _buildChecboxListTiles(Colors1.Red),
          _buildChecboxListTiles(Colors1.Purple),
          _buildChecboxListTiles(Colors1.Orange),*/
          /*   CheckboxListTile(
              title: Text(describeEnum(Colors1.Purple)),
              value: _selectedColors.contains(Colors1.Purple),
              onChanged: (bool? value) {
                if (value == false) {
                  _selectedColors.remove(describeEnum(Colors1.Purple));
                } else {
                  _selectedColors.add(describeEnum(Colors1.Purple));
                }
                setState(() {});
              })*/
          SwitchListTile(
              title: Text("Are you student ?"),
              value: _student,
              onChanged: (bool student) {
                setState(() {
                  _student = student;
                });
              }),
          TextButton(
              onPressed: () {
                var _userInformation = UserImformation(_nameController.text,
                    _selectedGender, _selectedColors, _student);
                _preferenceService.saveData(_userInformation);
              },
              child: Text("Save")),
        ],
      ),
    );
  }

  Widget _buildRadioListTiles(String title, Gender gender) {
    return RadioListTile(
        title: Text(title),
        value: gender,
        groupValue: _selectedGender,
        onChanged: (Gender? selectedGender) {
          setState(() {
            _selectedGender = selectedGender!;
          });
        });
  }

  Widget _buildChecboxListTiles(Colors1 colors1) {
    return CheckboxListTile(
        title: Text(describeEnum(colors1)),
        value: _selectedColors.contains(colors1),
        onChanged: (bool? value) {
          if (value == false) {
            _selectedColors.remove(describeEnum(colors1));
          } else {
            _selectedColors.add(describeEnum(colors1));
          }
          setState(() {});
        });
  }
}
