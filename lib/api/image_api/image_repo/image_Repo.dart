import 'dart:io';

import '../../baseurl/baseapiurl.dart';
import '../../serverhepler/apihelperserver.dart';
import '../image_Models/image_Model.dart';

class ImageRepo {
  Apihelperserver apihelper = Apihelperserver();

  Future<ImageModel?> selectimage(File imageFile) async {
    try {
      final String url = Baseapiurl.uplodimageUrl;
      final response = await apihelper.uploadImage(imageFile, url);
      final data = ImageModel.fromJson(response);
      print("URL: $url");
      print("Data: $data");

      print("✅ Image Upload Success");

      return data;
    } catch (e) {
      print("Error in fetchUserData: $e");
      return null;
    }
  }
}
