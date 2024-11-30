import 'package:base_app/app.dart';
import 'package:base_app/res/values/colors.dart';
import 'package:base_app/res/values/dimens.dart';
import 'package:base_app/res/values/images.dart';
import 'package:base_app/res/values/sounds.dart';

import '../generated/l10n.dart';

class R {
  static final AppImage image = AppImage();
  static final AppDimens dim = AppDimens();
  static final AppColor color = AppColor();
  static final AppSounds sound = AppSounds();
  static final S string = S.of(BaseApp.appGlobalKey.currentContext!);
}
