import 'package:base_app/base/error_handler.dart';
import 'package:base_app/data/remote/result.dart';
import 'package:base_app/data/shared_preferences/shared_preferences_managment.dart';
import 'package:base_app/base/bloc_base.dart';
import 'package:base_app/domain/user/i_user_repository.dart';
import 'package:base_app/domain/user/user_model.dart';
import 'package:rxdart/subjects.dart';


class SplashBloc extends BaseBloC with ErrorHandler{
  final IUserRepository _userRepository;
  final SharedPreferencesManager _sharedP;

  SplashBloc(this._userRepository, this._sharedP);

  BehaviorSubject<UserModel> _profileSubject = BehaviorSubject();

  Stream<UserModel> get profileStream => _profileSubject.stream;

  void getProfile() async {
    final token = await _sharedP.getAccessToken();
    final saveCredentials = await _sharedP.getSavedCredentials();
    if (token.isEmpty || !saveCredentials)
      _profileSubject.sink.add(UserModel());
    else {
      UserModel? model;
      final res = await _userRepository.getUserProfile();
      if (res is ResultSuccess<UserModel>) {
        model = res.value;
      }
      _profileSubject.sink.add(model ?? UserModel());
    }
  }

  // Future<LicenseApiModel?> getLicense() async {
  //   final res = await _licenseRepository.getLicense();
  //   if(res is ResultSuccess<LicenseApiModel>){
  //     await _sharedP.setMaximumStorage(res.value.maximumStorage);
  //     return res.value;
  //   }
  //   showErrorMessageFromString(R.string.commons_failObtainingLicense);
  //   return null;
  // }

  @override
  void dispose() {
    disposeErrorHandlerBloC();
  }
}
