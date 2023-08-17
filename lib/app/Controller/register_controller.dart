import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tamdan/app/screen/login_register/login.dart';
import 'package:tamdan/app/services/api_helper.dart';

class RegisterController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  final _helper = APIhelper();
  Rx<File?> _selectedImage = Rx<File?>(null);

  File? get selectedImage => _selectedImage.value;

  Future<void> pickImage() async {
    try {
      final pickedImage = await _imagePicker.getImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        _selectedImage.value = File(pickedImage.path);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
  void register ({
    required String name,
    required String email,
    required String password,
    File? profile,
}) async {
    try {
      final registered = await _helper.register(
        name: name,
        email: email,
        password: password,
        profile: profile!,
      );
      Get.snackbar('Message',registered);
      Get.to(()=>login_screen());
    }catch (e){
      Get.snackbar('Error',e.toString());
      print(e);
    }
  }
}

