/// Created by Neloy on 3/25/2024
/// Email: taufiqneloy.swe@gmail.com

class APIConfig {
  static const String baseUrl = "https://s54w5l6n-7264.asse.devtunnels.ms/";
  static const String prefix = "apiAdmin/youBike/";
  static const String login = "${prefix}Login";
  static const String getAllBikes = "${prefix}GetAllBikes";
  static const String addBike = "${prefix}AddBike";
  static const String getSingleBike = "${prefix}GetSingleBike";
  static const String updateBike = "${prefix}UpdateBike";
  static const String deleteBike = "${prefix}DeleteBike";
  static const String getAllNotifications = "${prefix}GetAllNotifications";
  static const String readNotification = "${prefix}ReadNotification";
}
