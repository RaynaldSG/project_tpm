class TimeController {

  String convertCountryToCode(String location){
    String finalLocationCode = 'WIB';

    if(location.contains('Singapore')){
      finalLocationCode = 'SGT';
    }
    if(location.contains('Japan')){
      finalLocationCode = 'JST';
    }

    return finalLocationCode;
  }

  DateTime timeConvert(String location, DateTime time){
    DateTime finalTime;

    switch (location) {
      case "WIB":
        finalTime = time.add(const Duration(hours: 7));
        break;
      case "WITA":
        finalTime = time.add(const Duration(hours: 8));
        break;
      case "WIT":
        finalTime = time.add(const Duration(hours: 9));
        break;
      case "LDN":
        finalTime = time.add(const Duration(hours: 1));
        break;
      case "SGT":
        finalTime = time.add(const Duration(hours: 8));
        break;
      case "JST":
        finalTime = time.add(const Duration(hours: 9));
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
      case "WIB":
        finalTime = 7;
        break;
      case "WITA":
        finalTime = 8;
        break;
      case "WIT":
        finalTime = 9;
        break;
      case "LDN":
        finalTime = 1;
        break;
      case "SGT":
        finalTime = 8;
        break;
      case "JST":
        finalTime = 9;
        break;
      default:
        finalTime = 0;
        break;
    }

    return finalTime;
  }
}