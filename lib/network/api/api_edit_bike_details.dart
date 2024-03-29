import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../constant/config_api.dart';
import '../constant/config_values.dart';
import '../model/model_bike.dart';

/// Created by Neloy on 3/29/2024
/// Email: taufiqneloy.swe@gmail.com

class EditBikeDetailsAPI {
  Future<String> run({required BikeModel bike}) async {
    try {
      var box = await Hive.openBox(ValueConfigs.token);

      var request = http.Request(
        ValueConfigs.requestPut,
        Uri.parse(
          APIConfig.baseUrl + APIConfig.updateBike,
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
    } catch (e) {
      return ValueConfigs.error;
    }
  }
}