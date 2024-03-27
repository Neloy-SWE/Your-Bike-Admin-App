import 'package:your_bike_admin/network/api/api_get_all_bikes.dart';
import 'package:your_bike_admin/network/manager/manager_get_all_bikes.dart';

import '../../utilities/app_strings.dart';
import '../constant/config_values.dart';
import '../model/model_base.dart';
import '../model/model_bike.dart';

/// Created by Neloy on 3/25/2024
/// Email: taufiqneloy.swe@gmail.com

class GetAllBikesHelper implements GetAllBikesManager {
  Future<void> connection({
    required GetAllBikesManager manager,
  }) async {
    String result = await GetAllBikesAPI().run();

    if (result != ValueConfigs.error) {
      BaseModel baseModel = BaseModel.fromJson(result);
      if (baseModel.status == ValueConfigs.success) {
        List<BikeModel> bikes =
        baseModel.data.map<BikeModel>((e) => BikeModel.fromMap(e)).toList();
        manager.success(bikes: bikes, message: baseModel.message!);
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
  }

  @override
  void fail({required String message}) {}

  @override
  void success({required List<BikeModel> bikes, required String message}) {}
}
