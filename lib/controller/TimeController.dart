class TimeController {

  DateTime timeConvert(String location, DateTime time){
    DateTime finalTime;

    switch (location) {
      case "WITA":
        finalTime = time.add(const Duration(hours: 1));
        break;
      case "WIT":
        finalTime = time.add(const Duration(hours: 2));
        break;
      case "LDN":
        finalTime = time.add(const Duration(hours: -6));
        break;
      case "SGT":
        finalTime = time.add(const Duration(hours: 1));
        break;
      case "JST":
        finalTime = time.add(const Duration(hours: 2));
        break;
      default:
        finalTime = time;
        break;
    }

    return finalTime;
  }

  int timeConvertHour(String location){
    int finalTime;

    switch (location) {
      case "WITA":
        finalTime = 1;
        break;
      case "WIT":
        finalTime = 2;
        break;
      case "LDN":
        finalTime = -6;
        break;
      case "SGT":
        finalTime = 1;
        break;
      case "JST":
        finalTime = 2;
        break;
      default:
        finalTime = 0;
        break;
    }

    return finalTime;
  }
}