import 'package:hive/hive.dart';
import 'package:your_bike_admin/network/api/api_login.dart';
import 'package:your_bike_admin/network/constant/config_values.dart';
import 'package:your_bike_admin/network/model/model_base.dart';
import 'package:your_bike_admin/utilities/app_strings.dart';

import '../manager/manager_login.dart';

/// Created by Neloy on 3/25/2024
/// Email: taufiqneloy.swe@gmail.com

class LoginHelper implements LoginManager {
  Future<void> connection({
    required String phone,
    required String password,
    required LoginManager manager,
  }) async {
    try {
      String result = await LoginAPI().run(
        phone: phone,
        password: password,
      );
      if (result != ValueConfigs.error) {
        BaseModel<String> baseModel = BaseModel.fromJson(result);
        if (baseModel.status == ValueConfigs.success) {
          var box = await Hive.openBox(ValueConfigs.token);
          await box.put(ValueConfigs.token, baseModel.data);
          manager.success(
            message: baseModel.message!,
          );
        } else {
          manager.fail(
            message: baseModel.message!,
          );
        }
      } else {
        manager.fail(
          message: AppStrings.checkYourInternet,
        );
      }
    } on Exception {
      manager.fail(
        message: AppStrings.checkYourInternet,
      );
    }
  }

  @override
  void fail({required String message}) {}

  @override
  void success({required String message}) {}
}
