import 'dart:async';
import 'package:flutter/material.dart';
import 'package:your_bike_admin/network/helper/helper_get_all_notifications.dart';
import 'package:your_bike_admin/network/manager/manager_get_all_notification.dart';
import 'package:your_bike_admin/network/model/model_notification.dart';
import '../components/custom_dialogue.dart';
import '../utilities/app_size.dart';
import '../utilities/app_strings.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationState();
}

class _NotificationState extends State<Notifications>
    implements GetAllNotificationManager {
  List<NotificationModel> notificationList = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _getAllNotification();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addNewBikeRequest),
      ),
      body: notificationList.isEmpty
          ? const SizedBox()
          : ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(25),
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: notificationList.length,
                    itemBuilder: (context, index) {
                      return _elementNotification(
                          notification: notificationList[index]);
                    }),
                AppSize.gapH60,
              ],
            ),
    );
  }

  Widget _elementNotification({required NotificationModel notification}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification.brand!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    AppSize.gapW10,
                    Text(notification.read! ? AppStrings.newNotification : "",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                AppSize.gapH10,
                Text(
                  notification.model!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        AppSize.gapH20,
      ],
    );
  }

  Future<void> _getAllNotification() async {
    CustomDialogue.loading(context: context);
    await GetAllNotificationHelper().connection(
      manager: this,
    );
  }

  @override
  void fail({required String message}) {
    Navigator.of(context).pop();
    Timer(
      const Duration(seconds: 1),
      () {
        CustomDialogue.simple(
          context: context,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icons.error_outline_outlined,
          message: message,
          buttonText: AppStrings.close,
        );
      },
    );
  }

  @override
  void success(
      {required List<NotificationModel> notifications,
      required String message}) {
    // ref.read(allNotificationList.notifier).state = notifications;

    Navigator.of(context).pop();
    Timer(
      const Duration(seconds: 1),
      () {
        CustomDialogue.simple(
          context: context,
          onPressed: () {
            setState(() {
              notificationList = notifications;
            });
            Navigator.of(context).pop();
          },
          icon: Icons.verified_outlined,
          message: message,
          buttonText: AppStrings.close,
        );
      },
    );
  }
}
