import 'package:project_tpm/controller/SharedPreferenceController.dart';
import 'package:project_tpm/main.dart';
import 'package:project_tpm/model/UserModel.dart';

class UserController {
  String userEmail = SharedPreferenceController.sharedPrefData.getString('email')!;

  void setUser(UserModel userData) {
    try{
      dataBox.put(userEmail, userData);
      print("USER LOGIC: Success");
    }
    catch (error){
      print("USER LOGIC: $error");
    }
  }

  UserModel? getUser() {
    UserModel? userData;

    try{
      userData = dataBox.get(userEmail);
      print("USER LOGIC: Success Get User Data");
      return userData;
    }
    catch (error){
      print("USER LOGIC: $error");
      return null;
    }
  }
}