import '../model/model_bike.dart';

/// Created by Neloy on 3/26/2024
/// Email: taufiqneloy.swe@gmail.com

abstract class GetAllBikesManager {
  void success({required List<BikeModel> bikes, required String message});

  void fail({required String message});
}
