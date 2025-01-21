import 'package:your_bike_admin/network/manager/manager_bike_details.dart';
import 'package:your_bike_admin/network/model/model_bike.dart';

import '../../utilities/app_strings.dart';
import '../api/api_edit_bike_details.dart';
import '../constant/config_values.dart';
import '../model/model_base.dart';

/// Created by Neloy on 3/29/2024
/// Email: taufiqneloy.swe@gmail.com

class EditBikeHelper implements BikeDetailsManager {
  Future<void> connection({
    required BikeModel bike,
    required BikeDetailsManager manager,
  }) async {
    try {
      String result = await EditBikeDetailsAPI().run(bike: bike);

      if (result != ValueConfigs.error) {
        BaseModel baseModel = BaseModel.fromJson(result);
        if (baseModel.status == ValueConfigs.success) {
          BikeModel bike = BikeModel.fromMap(baseModel.data);
          manager.success(bike: bike, message: baseModel.message!);
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
  void success({required BikeModel bike, required String message}) {}
}
