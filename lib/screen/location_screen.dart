class Notificaiton {
  String? getNotification(int con) {
    if (con < 400) {
      return "Perfect weather";
    } else if (con == 721) {
      return "Cold";
    } else {
      return "Warm";
    }
  }
}
