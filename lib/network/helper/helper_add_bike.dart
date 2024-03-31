import 'package:your_bike_admin/network/api/api_add_bike.dart';
import 'package:your_bike_admin/network/model/model_add_bike.dart';
import 'package:your_bike_admin/network/model/model_bike.dart';

import '../../utilities/app_strings.dart';
import '../constant/config_values.dart';
import '../manager/manager_get_all_bikes.dart';
import '../model/model_base.dart';

/// Created by Neloy on 3/26/2024
/// Email: taufiqneloy.swe@gmail.com

class AddBikeHelper implements GetAllBikesManager {
  Future<void> connection({
    required GetAllBikesManager manager,
    required AddBikeModel bike,
  }) async {
    try {
      String result = await AddBikeAPI().run(bike: bike);

      if (result != ValueConfigs.error) {
        BaseModel baseModel = BaseModel.fromJson(result);
        if (baseModel.status == ValueConfigs.success) {
          List<BikeModel> bikes = baseModel.data
              .map<BikeModel>((e) => BikeModel.fromMap(e))
              .toList();
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
    } on Exception catch (e) {
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
