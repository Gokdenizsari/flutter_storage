import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter_storage/model/my_model.dart';

class FileStorageService {
  _getFilePath() async {
    var filePath = await getApplicationDocumentsDirectory();
    return filePath.path;
  }

  FileStorageService() {
    _createFile();
  }

  Future<File> _createFile() async {
    var file = File(await _getFilePath() + "/info.txt");
    return file;
  }

  void saveData(UserImformation userImformation) async {
    var file = await _createFile();
    await file.writeAsString(jsonEncode(userImformation));
  }

  Future readData() async {
    var file = await _createFile();
    var pageString = await file.readAsString();
    var json = jsonDecode(pageString);
    return;
  }
}
