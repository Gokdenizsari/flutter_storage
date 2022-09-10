import 'dart:convert';
import 'dart:io';

import 'package:flutter_storage/model/services/local_storage_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_storage/model/my_model.dart';

class FileStorageService implements LocalStorageService {
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

  Future<void> saveData(UserImformation userImformation) async {
    var file = await _createFile();
    await file.writeAsString(jsonEncode(userImformation));
  }

  Future<UserImformation> readData() async {
    var file = await _createFile();
    var pageString = await file.readAsString();
    var json = jsonDecode(pageString);
    return json;
  }
}
