abstract class HandleTime {
  static String convertMsToHour(int unit) {
    final duration = Duration(milliseconds: unit);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    String hours = twoDigits(duration.inHours);
    if (hours == "00")
      hours = '';
    else
      hours = "$hours:";
    return "$hours$minutes:$seconds";
  }
}
