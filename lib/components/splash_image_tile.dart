import 'package:flutter/material.dart';
import 'package:koleksyon/models/splash_image.dart';
import 'package:koleksyon/screens/add_to_collection_view.dart';

class SplashImageTile extends StatelessWidget {
 SplashImage splashImage = SplashImage();
 SplashImageTile(this.splashImage);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Colors.red,
      leading: Text("${splashImage.likes} Likes!"),
      title: Image.network(
        splashImage.url,
        width: 400,
        height: 400,
      ),
      onLongPress: (){
        showDialog(
            context:  context,
            builder: (context){
              return AddToCollectionView(splashImage);
            }
        );
      },
    );
  }
}
