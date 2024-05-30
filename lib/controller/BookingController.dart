import 'package:flutter/material.dart';

class BookingController {
  Map<String, double> usdConversion =
    {
      'IDR' : 16248.00,
      'SGD' : 1.35,
      'JPY' : 157.19,
    };

  Map<String, double> idrConversion =
  {
    'USD' : 0.000062,
    'SGD' : 0.000083,
    'JPY' : 0.0097,
  };

  double calculateTotal(DateTime start, DateTime end, int pricePDay, String currency){
    int dayDifference = end.difference(start).inDays;
    int total = pricePDay * dayDifference;
    double finalTotal;

    finalTotal = currencyConverter(currency, total);
    return finalTotal;
  }

  double currencyConverter(String currency, int priceIDR){
    double finalTotal;

    switch (currency) {
      case 'USD':
        finalTotal = priceIDR * idrConversion['USD']!;
        break;
      case 'SGD':
        finalTotal = priceIDR * idrConversion['SGD']!;
        break;
      case 'JPY':
        finalTotal = priceIDR * idrConversion['JPY']!;
        break;
      default:
        finalTotal = priceIDR.toDouble();
        break;
    }
    return finalTotal;
  }

  bool checkTime(TimeOfDay time, DateTime start, TimeOfDay todayTime){
    DateTime timeNow = DateTime.now();
    if(DateUtils.isSameDay(start, timeNow)){
      if(todayTime.hour >= time.hour && todayTime.minute >= time.minute){
        return false;
      }
    }
    return true;
  }
}