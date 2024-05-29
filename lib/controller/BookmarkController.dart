import 'package:project_tpm/controller/SharedPreferenceController.dart';
import 'package:project_tpm/main.dart';

class BookmarkController {
  late List<int> bookmark;
  String userEmail = SharedPreferenceController.sharedPrefData.getString('email')!;

  BookmarkController(){
    checkNull();
  }

  bool checkBookmark(int id) {
    if (bookmark.contains(id)) {
      return true;
    }
    return false;
  }

  void setBookmark(int id) {
    String status;

    if (bookmark.contains(id)) {
      bookmark.remove(id);
      status = 'Remove Favorite to $userEmail-bm';
    } else {
      status = 'Add Favorite to $userEmail-bm';
      bookmark.add(id);
    }
    print("FAVORITE LOGIC: $status");
    dataBox.put('$userEmail-bm', bookmark);
  }

  void checkNull(){
    if(dataBox.get('$userEmail-bm') == null){
      bookmark = [];
    }
    else {
      bookmark = dataBox.get('$userEmail-bm');
    }
  }
}