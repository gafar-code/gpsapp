class DateFormarter {
  static String getTimer(int timestamp) {
    int currentTs =
        DateTime.now().millisecondsSinceEpoch; // mengambil timestamp saat ini
    int timer = currentTs - timestamp; // waktu berlalu
    return DateTime.fromMillisecondsSinceEpoch(timer).hour.toString();
  }
}
