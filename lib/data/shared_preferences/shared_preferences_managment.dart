import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesManager {
  final _userEmail = "user_email2";
  final _userId = "user_id2";
  final _userFullName = "user_full_name2";
  final _customerId = "customer_id2";
  final _userPassword = "user_password2";
  final _accessToken = "access_token2";
  final _savedCredentials = "saved_credentials2";
  final _baseUrlKey = "base_url2";

  final _pushNotifications = "push_notifications";
  final _biometricAuth = "biometric_auth";
  final contactsFilter = "_contactsFilter7";
  final contactsSort = "_contactsSort";

  final _customerMaxStorage = "max_storage";

  // Future<bool> cleanAll() async {
  //   await setBaseUrl(Endpoint.apiBaseUrl);
  //   await setUserEmail('');
  //   await setAccessToken('');
  //   await setUserId('');
  //   await setCustomerId('');
  //   await setUserPassword('');
  //   await setSavedCredentials(false);
  //   await setNodeScanNavPref(false);
  //   await setTermsAccepted(false);
  //
  //   /// Remember to do it
  //   // AdaptiveTheme.of(context).persist();
  //   return true;
  // }

  Future<double> getMaximumStorage() async {
    var value = (await SharedPreferences.getInstance()).getDouble(_customerMaxStorage);
    if(value == null) {
      value = 0.0;
      setMaximumStorage(value);
    }
    return value;
  }

  Future<bool> setMaximumStorage(double newValue) async {
    var res = (await SharedPreferences.getInstance())
        .setDouble(_customerMaxStorage, newValue);
    return res;
  }

  Future<bool> getBiometricAuth() async {
    var value = (await SharedPreferences.getInstance()).getBool(_biometricAuth);
    if (value == null) {
      value = true;
      setBiometricAuth(value);
    }
    return value;
  }

  Future<bool> setBiometricAuth(bool newValue) async {
    var res = (await SharedPreferences.getInstance())
        .setBool(_biometricAuth, newValue);
    return res;
  }

  // Future<bool> getPushNotifications() async {
  //   var value =
  //       (await SharedPreferences.getInstance()).getBool(_pushNotifications);
  //   if (value == null) {
  //     value = true;
  //     setPushNotifications(value);
  //   }
  //   return value;
  // }
  //
  // Future<bool> setPushNotifications(bool newValue) async {
  //   var res = (await SharedPreferences.getInstance())
  //       .setBool(_pushNotifications, newValue);
  //   return res;
  // }

  // Future<String> getBaseUrl() async {
  //   var value = (await SharedPreferences.getInstance()).getString(_baseUrlKey);
  //   if (value == null) {
  //     value = Endpoint.apiBaseUrl;
  //     setBaseUrl(value);
  //   }
  //   return value;
  // }
  //
  // Future<bool> setBaseUrl(String newValue) async {
  //   var res = (await SharedPreferences.getInstance())
  //       .setString(_baseUrlKey, newValue);
  //   return res;
  // }

  // Future<bool> getTermsAccepted() async {
  //   var value = (await SharedPreferences.getInstance()).getBool(_termsAccepted);
  //   if (value == null) {
  //     value = false;
  //     await setTermsAccepted(value);
  //   }
  //   return value;
  // }
  //
  // Future<bool> setTermsAccepted(bool newValue) async {
  //   var value = (await SharedPreferences.getInstance())
  //       .setBool(_termsAccepted, newValue);
  //
  //   return value;
  // }


  Future<String> getUserEmail() async {
    var value = (await SharedPreferences.getInstance()).getString(_userEmail);
    if (value == null) {
      value = '';
      await setUserEmail(value);
    }
    return value;
  }

  Future<bool> setUserEmail(String newValue) async {
    var res =
        (await SharedPreferences.getInstance()).setString(_userEmail, newValue);
    return res;
  }

  Future<String> getAccessToken() async {
    var value = (await SharedPreferences.getInstance()).getString(_accessToken);
    if (value == null) {
      value = '';
      setAccessToken(value);
    }
    return value;
  }

  Future<bool> setAccessToken(String newValue) async {
    var res = (await SharedPreferences.getInstance())
        .setString(_accessToken, newValue);
    return res;
  }

  Future<String> getUserId() async {
    var value = (await SharedPreferences.getInstance()).getString(_userId);
    if (value == null) {
      value = '';
      await setUserId(value);
    }
    return value;
  }

  Future<bool> setUserId(String newValue) async {
    var res =
        (await SharedPreferences.getInstance()).setString(_userId, newValue);
    return res;
  }

  Future<String> getUserFullName() async {
    var value =
        (await SharedPreferences.getInstance()).getString(_userFullName);
    if (value == null) {
      value = '';
      await setUserFullName(value);
    }
    return value;
  }

  Future<bool> setUserFullName(String newValue) async {
    var res = (await SharedPreferences.getInstance())
        .setString(_userFullName, newValue);
    return res;
  }

  Future<String> getUserPassword() async {
    var value =
        (await SharedPreferences.getInstance()).getString(_userPassword);
    if (value == null) {
      value = '';
      await setUserPassword(value);
    }
    return value;
  }

  Future<bool> setUserPassword(String newValue) async {
    var res = (await SharedPreferences.getInstance())
        .setString(_userPassword, newValue);
    return res;
  }

  Future<bool> getSavedCredentials() async {
    var value =
        (await SharedPreferences.getInstance()).getBool(_savedCredentials);
    if (value == null) {
      value = false;
      await setSavedCredentials(value);
    }
    return value;
  }

  Future<bool> setSavedCredentials(bool newValue) async {
    var res = (await SharedPreferences.getInstance())
        .setBool(_savedCredentials, newValue);
    return res;
  }

  Future<String> getString({required String key, String defValue = ''}) async {
    try {
      final value = (await SharedPreferences.getInstance()).getString(
        key,
      );
      if (value != null) return value;
      return defValue;
    } catch (e) {
      return defValue;
    }
  }

  Future<bool> saveString({required String key, required String value}) async {
    try {
      await (await SharedPreferences.getInstance()).setString(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<int> getInt({required String key, int defValue = -1}) async {
    try {
      final value = (await SharedPreferences.getInstance()).getInt(
        key,
      );
      if (value != null) return value;
      return defValue;
    } catch (e) {
      return defValue;
    }
  }

  Future<bool> saveInt({required String key, required int value}) async {
    try {
      await (await SharedPreferences.getInstance()).setInt(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
