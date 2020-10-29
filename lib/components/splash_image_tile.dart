import 'package:flutter/material.dart';
import 'package:koleksyon/models/splash_image.dart';
import 'package:koleksyon/components/collection_list.dart';
import 'package:koleksyon/screens/add_collection.dart';

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
              return SimpleDialog(
                title: Text('Add to collection'),
                children: <Widget>[
                  CollectionList(),
                  FlatButton.icon(
                      onPressed: (){
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (context){
                              return AddCollection();
                            }
                        );
                      },
                      icon: Icon(Icons.add),
                      label: Text("New Collection")
                  ),
                ],
              );
            }
        );
      },
    );
  }
}
