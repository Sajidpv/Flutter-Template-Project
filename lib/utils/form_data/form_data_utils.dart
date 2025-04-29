import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class FormDataUtil {
  static FormData buildFormData(
    dynamic data,
    List<XFile> images, {
    String fieldName = 'images',
  }) {
    final formData = FormData.fromMap(Map<String, dynamic>.from(data));

    for (var image in images) {
      formData.files.add(
        MapEntry(
          fieldName,
          MultipartFile.fromFileSync(image.path, filename: image.name),
        ),
      );
    }

    return formData;
  }
}
