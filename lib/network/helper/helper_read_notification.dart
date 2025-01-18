/*
* Created by Neloy on 18 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_bike_admin/network/constant/config_values.dart';
import 'package:your_bike_admin/network/model/model_base.dart';

import '../../components/custom_dialogue.dart';
import '../../utilities/app_strings.dart';
import '../api/api_read_notification.dart';

class ReadNotificationHelper {
  Future<bool> connection(
      {required int notificationId, required BuildContext context}) async {
    try {
      String result =
          await ReadNotificationAPI().run(notificationId: notificationId);
      if (result != ValueConfigs.error) {
        BaseModel baseModel = BaseModel.fromJson(result);
        if (baseModel.status == ValueConfigs.success) {
          return true;
        } else {
          if (context.mounted) {
            CustomDialogue.simple(
              context: context,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icons.error_outline_outlined,
              message: baseModel.message!,
              buttonText: AppStrings.close,
            );
          }

          return false;
        }
      } else {
        if (context.mounted) {
          CustomDialogue.simple(
            context: context,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icons.error_outline_outlined,
            message: AppStrings.checkYourInternet,
            buttonText: AppStrings.close,
          );
        }
        return false;
      }
    } on Exception catch (e) {
      if (context.mounted) {
        CustomDialogue.simple(
          context: context,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icons.error_outline_outlined,
          message: AppStrings.checkYourInternet,
          buttonText: AppStrings.close,
        );
      }
      return false;
    }
  }
}
