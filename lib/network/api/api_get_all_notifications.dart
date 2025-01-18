import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import '../constant/config_api.dart';
import '../constant/config_values.dart';

/*
* Created by Neloy on 20 December, 2024.
* Email: taufiqneloy.swe@gmail.com
*/

class GetAllNotificationsAPI {
  Future<String> run() async {
    try {
      var box = await Hive.openBox(ValueConfigs.token);

      var request = http.Request(
        ValueConfigs.requestGet,
        Uri.parse(
          APIConfig.baseUrl + APIConfig.getAllNotifications,
        ),
      );

      var headers = {
        ValueConfigs.authorization:
            ValueConfigs.bearer + await box.get(ValueConfigs.token),
        ValueConfigs.accept: ValueConfigs.applicationJson,
      };

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      return await response.stream.bytesToString();
    } on Exception {
      return ValueConfigs.error;
    }
  }
}
