import '../model/model_notification.dart';

abstract class GetAllNotificationManager {
  void success({required List<NotificationModel> notifications, required String message});

  void fail({required String message});
}