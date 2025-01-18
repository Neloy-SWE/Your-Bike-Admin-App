/*
* Created by Neloy on 18 January, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

import '../constant/config_api.dart';
import '../constant/config_values.dart';

class ReadNotificationAPI {
  Future<String> run({required int notificationId}) async {
    try {
      var box = await Hive.openBox(ValueConfigs.token);

      var request = http.Request(
        ValueConfigs.requestPut,
        Uri.parse(
          APIConfig.baseUrl +
              APIConfig.readNotification +
              notificationId.toString(),
        ),
      );

      var headers = {
        ValueConfigs.authorization:
            ValueConfigs.bearer + await box.get(ValueConfigs.token),
      };

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      return await response.stream.bytesToString();
    } on Exception {
      return ValueConfigs.error;
    }
  }
}
