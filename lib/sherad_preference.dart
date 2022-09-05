import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_storage/model/gender.dart';

class SharePreferencePage extends StatefulWidget {
  const SharePreferencePage({Key? key}) : super(key: key);

  @override
  State<SharePreferencePage> createState() => _SharePreferencePageState();
}

class _SharePreferencePageState extends State<SharePreferencePage> {
  var _selectedGender = Gender.Women;

  var _selectedColors = [];

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
          _buildRadioListTiles("Man", Gender.Man),
          _buildRadioListTiles("Women", Gender.Women),
          _buildRadioListTiles("Other", Gender.Other),
          _buildChecboxListTiles(Colors1.Blue),
          _buildChecboxListTiles(Colors1.Red),
          _buildChecboxListTiles(Colors1.Purple),
          _buildChecboxListTiles(Colors1.Orange),
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
