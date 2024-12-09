import 'package:base_app/app.dart';
import 'package:base_app/app_globals/colors.dart';
import 'package:base_app/app_globals/dimens.dart';
import 'package:base_app/app_globals/images.dart';
import 'package:base_app/app_globals/sounds.dart';


import '../generated/l10n.dart';

class R {
  static final AppImage image = AppImage();
  static final AppDimens dim = AppDimens();
  static final AppColor color = AppColor();
  static final AppSounds sound = AppSounds();
  static final S string = S.of(BaseApp.appGlobalKey.currentContext!);
}
