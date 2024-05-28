
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
}
