import 'dart:convert';

import 'package:bank_app/core/error/exceptions.dart';
import 'package:bank_app/features/credit/data/models/user_data_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  /// Get the chached [UserModel] whisch the last internet connection of the user.
  ///
  /// Throws a [CatchException] for all error codes
  Future<UserDataModel> getUserBasicData();

  Future<void> cacheUserBasicData(UserDataModel userDataToCache);
}

const user_data_key = 'user_data_key';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserDataModel> getUserBasicData() {
    final jsonString = sharedPreferences.getString(user_data_key);

    if (jsonString != null) {
      return Future.value(UserDataModel.fromJson(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUserBasicData(UserDataModel userDataToCache) {
    return sharedPreferences.setString(
      user_data_key,
      userDataToCache.toJson(),
    );
  }
}
