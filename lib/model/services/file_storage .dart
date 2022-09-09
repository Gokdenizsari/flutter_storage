import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter_storage/model/gender.dart';

class FileStorageService {
  _getFilePath() async {
    var filePath = await getApplicationDocumentsDirectory();
    return filePath.path;
  }

  FileStorageService() {
    _createFile();
  }

  _createFile() async {
    var file = File(await _getFilePath() + "/info.txt");
    await file.writeAsString("trial content");
  }

  void saveData(UserImformation userImformation) async {}

  Future readData() async {
    return UserImformation("Try", Gender.Other, ["Purple"], false);
  }
}
