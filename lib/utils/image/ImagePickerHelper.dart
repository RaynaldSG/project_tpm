import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerHelper {
  File? _image;

  Future<String> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if(pickedImage != null){
      _image = File(pickedImage.path);
      return await saveImage(_image!);
    }
    return '';
  }

  Future<String> saveImage(File image) async {
    try {
      final directory = await getApplicationCacheDirectory();
      final imagePath = join(directory.path, basename(image.path));
      final savedImage = await image.copy(imagePath);

      print('IMAGE HELPER: success, image path: $imagePath');
      return imagePath;
    }
    catch (error){
      print('IMAGE HELPER: $error');
      return '';
    }
  }
}