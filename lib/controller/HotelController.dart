import 'package:flutter/material.dart';
import 'package:project_tpm/model/HotelsModel.dart';

class HotelController {
  List<Hotel> getHotelsData(HotelsModel hotelsData, String location, String search,
      {bool sort = false}) {
    List<Hotel> revisedHotelsData;

    switch (location) {
      case 'Indonesia':
        revisedHotelsData = hotelsData.data!
            .where((element) => element.country == 'Indonesia')
            .toList();
        break;
      case 'Singapore':
        revisedHotelsData = hotelsData.data!
            .where((element) => element.country == 'Singapore')
            .toList();
        break;
        case 'Japan':
        revisedHotelsData = hotelsData.data!
            .where((element) => element.country == 'Japan')
            .toList();
        break;
      default:
        revisedHotelsData = hotelsData.data!.toList();
        break;
    }

    if(sort){
      revisedHotelsData.sort((a, b) => double.parse(b.reviewScore!).compareTo(double.parse(a.reviewScore!)));
    }

    if(search.isNotEmpty){
      revisedHotelsData = revisedHotelsData.where((element) => element.name!.toLowerCase().contains(search.toLowerCase())).toList();
    }

    return revisedHotelsData;
  }

  IconData getFacilitiesIcon(String iconInfo){
    iconInfo = iconInfo.toLowerCase();
    if(iconInfo.contains('pool')){
      return Icons.pool;
    }if(iconInfo.contains('shuttle')){
      return Icons.airport_shuttle;
    }if(iconInfo.contains('spa')){
      return Icons.spa;
    }if(iconInfo.contains('pool')){
      return Icons.pool;
    }if(iconInfo.contains('fitness')){
      return Icons.fitness_center;
    }if(iconInfo.contains('service')){
      return Icons.room_service;
    }if(iconInfo.contains('parking')){
      return Icons.local_parking;
    }if(iconInfo.contains('wifi')){
      return Icons.wifi;
    }if(iconInfo.contains('maker')){
      return Icons.coffee;
    }if(iconInfo.contains('bar')){
      return Icons.wine_bar;
    }if(iconInfo.contains('breakfast')){
      return Icons.fastfood;
    }if(iconInfo.contains('non-smoking')){
      return Icons.smoke_free;
    }if(iconInfo.contains('restaurant')){
      return Icons.restaurant;
    }if(iconInfo.contains('disabled')){
      return Icons.wheelchair_pickup;
    }if(iconInfo.contains('family')){
      return Icons.family_restroom;
    }if(iconInfo.contains('desk')){
      return Icons.access_time;
    }if(iconInfo.contains('lift')){
      return Icons.elevator;
    }if(iconInfo.contains('housekeeping')){
      return Icons.cleaning_services;
    }if(iconInfo.contains('heating')){
      return Icons.hot_tub;
    }if(iconInfo.contains('luggage')){
      return Icons.luggage;
    }
    return Icons.question_mark;
  }
}
