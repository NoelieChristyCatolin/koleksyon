import 'package:flutter/material.dart';
import 'package:koleksyon/service/splash_api.dart';
import 'package:koleksyon/models/splash_image.dart';
import 'package:koleksyon/models/splash_collection.dart';
import 'splash_image.dart';

class SplashImageViewModel extends ChangeNotifier{
  SplashAPI api = SplashAPI();

  List<SplashImage> imageLinks = [];
  List<SplashCollection> _collections = [SplashCollection(
      name: "food",
      splashImages: [
        SplashImage(id: '1', description: "Conference", url: "https://images.unsplash.com/photo-1497366811353-6870744d04b2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE3NzkzMH0",likes: 1548)
      ]),
  ];

  List<SplashCollection> get collections {
    return _collections;
  }


  Future<List<SplashImage>> searchImage(String key) async{
    var result = await api.searchImage(key);
    return result;
  }

  void addToCollection(int index, SplashImage splashImage){
    _collections[index].splashImages.add(splashImage);
    notifyListeners();
  }

  void createNewCollection(String newCollecton){
    _collections.add(SplashCollection(name: newCollecton, splashImages: []));
    notifyListeners();
  }

  void editCollection(String collectionName, int index) {
    _collections[index].name = collectionName;
    notifyListeners();
  }

  void deleteCollection(int index){
    _collections.removeAt(index);
    notifyListeners();
  }

  void deleteCollectionImage(int collectionIndex, int imageIndex){
    _collections[collectionIndex].splashImages.removeAt(imageIndex);
    notifyListeners();
  }
}