import 'package:flutter/material.dart';
import 'package:koleksyon/models/splash_image_view_model.dart';
import 'package:koleksyon/screens/create_collection.dart';
import 'package:koleksyon/models/splash_image.dart';
import 'package:koleksyon/models/splash_collection.dart';
import 'package:provider/provider.dart';

class AddToCollectionView extends StatelessWidget {
  SplashImage splashImage;

  AddToCollectionView(this.splashImage);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Add to collection'),
      children: <Widget>[
        Container(
          width: double.maxFinite,
          child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(color: Colors.black,),
              itemBuilder: (context, index){
                SplashCollection collection = Provider.of<SplashImageViewModel>(context, listen: true).collections[index];
                return ListTile(
                  title: Text(collection.name),
                  onTap: (){
                    Provider.of<SplashImageViewModel>(context, listen: false).addToCollection(index, splashImage);
                    Navigator.pop(context, true);
                  },
                );
              },
              itemCount: Provider.of<SplashImageViewModel>(context, listen: true).collections.length),
        ),
        FlatButton.icon(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (context){
                    return CreateCollection();
                  }
              );
            },
            icon: Icon(Icons.add),
            label: Text("New Collection")
        ),
      ],
    );
  }
}
