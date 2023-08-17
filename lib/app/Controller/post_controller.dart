import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tamdan/app/Model/post_data_model.dart';
import 'package:tamdan/app/services/api_helper.dart';

class PostController extends GetxController {
  bool isLoading = false;
  GetStorage box = GetStorage();
  final helper = APIhelper();
  PostData post = PostData();
  @override
  void onInit() {
    super.onInit();
    getPost();
  }
  void getPost() async {
    try{
      isLoading= true;
      final accessToken = box.read('access_token');
      final resPost = await helper.getPost(accessToken: accessToken);
      post = PostData.fromJson(resPost);
      isLoading = false;
    }catch(e){
      Get.snackbar('Error Controller',e.toString());
    }
  }
}