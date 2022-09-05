import 'package:flutter/material.dart';
import 'package:flutter_storage/model/gender.dart';

class SharePreferencePage extends StatefulWidget {
  const SharePreferencePage({Key? key}) : super(key: key);

  @override
  State<SharePreferencePage> createState() => _SharePreferencePageState();
}

class _SharePreferencePageState extends State<SharePreferencePage> {
  var _selectedGender = Gender.Women;

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
}
