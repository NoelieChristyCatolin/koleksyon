import 'package:koleksyon/service/splash_api.dart';
import 'package:koleksyon/models/splash_image.dart';
import 'splash_image.dart';

class SplashImageViewModel {
  SplashAPI api = SplashAPI();
  List<SplashImage> imageLinks = [];

  Future<List<SplashImage>> searchImage(String key) async{
    var result = await api.searchImage("office");
    return result;
  }

}