import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:your_bike_admin/network/model/model_add_bike.dart';

import '../constant/config_api.dart';
import '../constant/config_values.dart';

/// Created by Neloy on 3/26/2024
/// Email: taufiqneloy.swe@gmail.com

class AddBikeAPI {
  Future<String> run({required AddBikeModel bike}) async {
    try {
      var box = await Hive.openBox(ValueConfigs.token);

      var request = http.Request(
        ValueConfigs.requestPost,
        Uri.parse(
          APIConfig.baseUrl + APIConfig.addBike,
        ),
      );

      request.body = bike.toJson();

      var headers = {
        ValueConfigs.authorization:
            ValueConfigs.bearer + await box.get(ValueConfigs.token),
        ValueConfigs.contentType: ValueConfigs.applicationJson,
      };

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      return await response.stream.bytesToString();
    } on Exception {
      return ValueConfigs.error;
    }
  }
}
