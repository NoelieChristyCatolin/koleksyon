import 'package:flutter/material.dart';
import 'package:koleksyon/models/splash_image.dart';
import 'package:koleksyon/models/splash_collection.dart';
import 'package:koleksyon/models/collection_view_model.dart';
import 'package:koleksyon/components/loading.dart';
import 'create_collection.dart';

class CollectionsView extends StatefulWidget {
  @override
  _CollectionsViewState createState() => _CollectionsViewState();
}

class _CollectionsViewState extends State<CollectionsView> {
  CollectionViewModel collectionViewModel = CollectionViewModel();
  SplashImage splashImage = SplashImage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        //todo: show collection
                        },
                      );
                    },
                    itemCount: snapshot.data.length),
              ) : Loading();
            }),
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
