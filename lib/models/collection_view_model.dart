import 'package:flutter/cupertino.dart';
import 'package:koleksyon/models/splash_collection.dart';
import 'package:koleksyon/models/splash_image.dart';
import 'package:koleksyon/service/splash_api.dart';

class CollectionViewModel extends ChangeNotifier{
  SplashAPI api = SplashAPI();
  List<SplashCollection> _collections = [SplashCollection(name: "food", splashImages: ["https://images.unsplash.com/photo-1497366811353-6870744d04b2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE3NzkzMH0"]),
    SplashCollection(name: "cake", splashImages: ["https://images.unsplash.com/photo-1497366811353-6870744d04b2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE3NzkzMH0"]),
    SplashCollection(name: "beach", splashImages: ["https://images.unsplash.com/photo-1497366811353-6870744d04b2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE3NzkzMH0"]),
    SplashCollection(name:  "office", splashImages: ["https://images.unsplash.com/photo-1497366811353-6870744d04b2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE3NzkzMH0"])];

  Future<List<SplashCollection>>  getCollections() async{
    return await _collections;
  }

  void addToCollection(int index, SplashImage splashImage){
    _collections[index].splashImages.add(splashImage.url);
  }

}