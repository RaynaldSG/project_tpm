import 'package:project_tpm/controller/SharedPreferenceController.dart';
import 'package:project_tpm/main.dart';
import 'package:project_tpm/model/HistoryModel.dart';

class HistoryController {
  late List<HistoryModel> historyList;
  String userEmail = SharedPreferenceController.sharedPrefData.getString('email')!;

  HistoryController(){
    checkNull();
  }

  void setHistory(HistoryModel bookingHistoryData) {
    HistoryModel bookingHistory = bookingHistoryData;

    historyList.add(bookingHistory);
    dataBox.put('$userEmail-history', historyList);
    print("HISTORY LOGIC: SUCCESS");
  }

  List<HistoryModel> getHistory(){
    return historyList;
  }

  void checkNull(){
    if(dataBox.get('$userEmail-history') == null){
      historyList = [];
    }
    else {
      historyList = dataBox.get('$userEmail-history');
    }
  }
}