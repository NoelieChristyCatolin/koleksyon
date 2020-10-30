import 'package:flutter/material.dart';

import 'package:koleksyon/screens/create_collection.dart';
import 'package:koleksyon/models/splash_image.dart';
import 'package:koleksyon/models/collection_view_model.dart';
import 'package:koleksyon/models/splash_collection.dart';
import 'package:koleksyon/components/loading.dart';

class AddToCollectionView extends StatelessWidget {
  SplashImage splashImage;
  AddToCollectionView(this.splashImage);

  @override
  Widget build(BuildContext context) {
    CollectionViewModel collectionViewModel = CollectionViewModel();
    return SimpleDialog(
      title: Text('Add to collection'),
      children: <Widget>[
        FutureBuilder<List<SplashCollection>>(
            future: collectionViewModel.getCollections(),
            builder: (context, snapshot){
              return snapshot.hasData ? Container(
                width: double.maxFinite,
                child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => Divider(color: Colors.black,),
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text(snapshot.data[index].name),
                        onTap: (){
                          collectionViewModel.addToCollection(index, splashImage);
                        },
                      );
                    },
                    itemCount: snapshot.data.length),
              ) : Loading();
            }),
        FlatButton.icon(
            onPressed: (){
              Navigator.pop(context);
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
