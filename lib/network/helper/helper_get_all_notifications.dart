import 'package:your_bike_admin/network/api/api_get_all_notifications.dart';
import 'package:your_bike_admin/network/constant/config_values.dart';
import 'package:your_bike_admin/network/manager/manager_get_all_notification.dart';
import 'package:your_bike_admin/network/model/model_base.dart';
import 'package:your_bike_admin/network/model/model_notification.dart';
import 'package:your_bike_admin/utilities/app_strings.dart';

class GetAllNotificationHelper implements GetAllNotificationManager {
  Future<void> connection({
    required GetAllNotificationManager manager,
  }) async {
    try {
      String result = await GetAllNotificationAPI().run();

      if (result != ValueConfigs.error) {
        BaseModel baseModel = BaseModel.fromJson(result);
        if (baseModel.status == ValueConfigs.success) {
          List<NotificationModel> notifications = baseModel.data
              .map<NotificationModel>((e) => NotificationModel.fromJson(e))
              .toList();
          manager.success(
              notifications: notifications, message: baseModel.message!);
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
  void success(
      {required List<NotificationModel> notifications,
      required String message}) {}
}
