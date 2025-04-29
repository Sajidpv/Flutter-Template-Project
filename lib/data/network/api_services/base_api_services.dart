import 'package:image_picker/image_picker.dart';

abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url, {bool isAuthorize = false});

  Future<dynamic> getPostApiResponse(
    String url,
    dynamic data, {
    bool isAuthorize = false,
    String? token,
    List<XFile>? imageFiles,
    Map<String, String>? customHeader,
  });

  Future<dynamic> getPutApiResponse(
    String url,
    dynamic data, {
    bool isAuthorize = false,
    Map<String, String>? customHeader,
  });

  Future<dynamic> getPatchApiResponse(
    String url,
    dynamic data, {
    bool isAuthorize = false,
    Map<String, String>? customHeader,
  });

  Future<dynamic> getDeleteApiResponse(
    String url,
    dynamic data, {
    bool isAuthorize = false,
    Map<String, String>? customHeader,
  });
}
