import 'package:your_bike_admin/network/manager/manager_delete_bike.dart';

import '../../utilities/app_strings.dart';
import '../api/api_delete_bike.dart';
import '../constant/config_values.dart';
import '../model/model_base.dart';

/// Created by Neloy on 3/31/2024
/// Email: taufiqneloy.swe@gmail.com

class DeleteBikeHelper implements DeleteBikeManager {
  Future<void> connection({
    required int id,
    required DeleteBikeManager manager,
  }) async {
    String result = await DeleteBikeAPI().run(id: id.toString());

    if (result != ValueConfigs.error) {
      BaseModel baseModel = BaseModel.fromJson(result);
      if (baseModel.status == ValueConfigs.success) {
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
  }

  @override
  void fail({required String message}) {}

  @override
  void success({required String message}) {}
}
