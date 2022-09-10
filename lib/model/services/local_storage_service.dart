import 'package:flutter_storage/model/my_model.dart';

abstract class LocalStorageService {
  Future<void> saveData(UserImformation userImformation);

  Future<UserImformation> readData();
}
