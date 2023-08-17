import 'package:get/get.dart';
import 'package:tamdan/app/Model/User_Data_Model.dart';
import 'package:tamdan/app/screen/login_register/login.dart';
import 'package:tamdan/app/services/api_helper.dart';
import 'package:get_storage/get_storage.dart';
class ProfileController extends GetxController {
  final helper = APIhelper();
  final box = GetStorage();
  bool isLoading = false;
  UserData userData = UserData();
  @override
  void onInit() {
    super.onInit();
    getUser();
  }
  void logout () async {
    try{
      final accessToken = box.read('access_token');
      final message = await helper.logout(accessToken: accessToken);
      box.remove('access_token');
      Get.snackbar('Message',message);
      Get.to(()=>login_screen());
    }catch(e){
      Get.snackbar('Error', e.toString());
    }
  }
  void getUser() async {
    try {
      isLoading = true;
      final accessToken = box.read('access_token');
      final resUser = await helper.getProfile(accessToken: accessToken);
      userData = UserData.fromJson(resUser);
      isLoading=false;
    }catch(e){
      isLoading=false;
      Get.offAllNamed('login');
    }
  }
}
