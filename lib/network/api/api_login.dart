import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:your_bike_admin/network/constant/config_api.dart';
import 'package:your_bike_admin/network/constant/config_values.dart';

/// Created by Neloy on 3/24/2024
/// Email: taufiqneloy.swe@gmail.com

class LoginAPI {
  Future<String> run({
    required String phone,
    required password,
  }) async {
    try {
      var request = http.Request(
        ValueConfigs.requestPost,
        Uri.parse(
          APIConfig.baseUrl + APIConfig.login,
        ),
      );

      var headers = {
        ValueConfigs.contentType: ValueConfigs.applicationJson,
      };

      request.body = json.encode({
        "id": "1",
        "phone": phone,
        "password": password,
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      return await response.stream.bytesToString();
    } on Exception {
      return ValueConfigs.error;
    }
  }
}
