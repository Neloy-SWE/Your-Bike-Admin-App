import 'package:your_bike_admin/network/manager/manager_bike_details.dart';
import 'package:your_bike_admin/network/model/model_bike.dart';

import '../../utilities/app_strings.dart';
import '../api/api_bike_details.dart';
import '../constant/config_values.dart';
import '../model/model_base.dart';

/// Created by Neloy on 3/28/2024
/// Email: taufiqneloy.swe@gmail.com

class BikeDetailsHelper implements BikeDetailsManager {
  Future<void> connection({
    required int id,
    required BikeDetailsManager manager,
  }) async {
    try {
      String result = await BikeDetailsAPI().run(id: id.toString());

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
    } on Exception catch (e) {
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
