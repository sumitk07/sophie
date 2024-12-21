import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:sophie/app/data/models/user_model.dart';

mixin CacheManager {
  final box = GetStorage();

  Future<void> cacheAuthData(String token, UserModel user) async {
    try {
      await box.write(CacheManagerKey.TOKEN.toString(), token);
      await box.write(CacheManagerKey.USER.toString(), user);
    } catch (err) {
      log("Error writing cache");
    }
  }

  Future<Map<String, dynamic>?> getCachedAuthData() async {
    try {
      final token = await box.read(CacheManagerKey.TOKEN.toString());
      final user = await box.read(CacheManagerKey.USER.toString());

      if (token == null || user == null) {
        return null;
      }

      return {"token": token, "user": user};
    } catch (err) {
      log("Error reading cache");
      return null;
    }
  }

  Future<void> removeCachedAuthData() async {
    try {
      await box.remove(CacheManagerKey.TOKEN.toString());
      await box.remove(CacheManagerKey.USER.toString());
    } catch (err) {
      log("Error removing cache");
    }
  }
}

enum CacheManagerKey { TOKEN, USER }
