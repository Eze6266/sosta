import 'dart:developer';
import 'dart:io';

// import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final _picker = ImagePicker();

  Future<File?> pickImageFromCamera() async {
    try {
      var image = await (_picker.pickImage(
          source: ImageSource.camera, imageQuality: 50));

      if (image != null) {
        File? file = File(image.path);
        log('image gotten');
        return file;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<File?> pickImageFromGallery() async {
    try {
      var image = await _picker.pickImage(
          imageQuality: 60, source: ImageSource.gallery);
      log('image gotten');

      if (image != null) {
        var file = File(image.path);

        return file;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<File?> pickVideoFromGallery() async {
    try {
      var image = await (_picker.pickVideo(source: ImageSource.gallery));

      if (image != null) {
        File? file = File(image.path);
        log('video gotten');
        return file;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<void> getLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.files != null) {
      for (final XFile file in response.files!) {
        log(file.path);
      }
    } else {
      log(response.exception.toString());
    }
  }
}
