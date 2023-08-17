import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tamdan/app/services/api_helper.dart';

class LoginController extends GetxController{
    final helper = APIhelper();
    final box = GetStorage();
    void login ({required String email,required String password})async{
      try {
        box.remove('access_token');
        final login = await helper.login(
          email:email,
          password:password
        );
        Get.offAllNamed('home');
        setToken(login.toString());
      }catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }
    void setToken(String token) async {
      await box.write("access_token", token);
    }
}