import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../constant/config_api.dart';
import '../constant/config_values.dart';

/// Created by Neloy on 3/28/2024
/// Email: taufiqneloy.swe@gmail.com

class BikeDetailsAPI {
  Future<String> run({required String id}) async {
    try {
      var box = await Hive.openBox(ValueConfigs.token);

      var request = http.Request(
        ValueConfigs.requestGet,
        Uri.parse(
          APIConfig.baseUrl + APIConfig.getSingleBike + id,
        ),
      );

      var headers = {
        ValueConfigs.authorization:
            ValueConfigs.bearer + await box.get(ValueConfigs.token),
      };

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      return await response.stream.bytesToString();
    } catch (e) {
      return ValueConfigs.error;
    }
  }
}
