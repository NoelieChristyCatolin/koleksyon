import 'package:flutter/material.dart';
import 'package:koleksyon/models/splash_collection.dart';
import 'package:koleksyon/models/collection_view_model.dart';
import 'loading.dart';

class CollectionList extends StatefulWidget {
  @override
  _CollectionListState createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  CollectionViewModel collectionViewModel  = CollectionViewModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SplashCollection>>(
        future: collectionViewModel.getCollections(),
        builder: (context, snapshot){
          return snapshot.hasData ? Container(
            width: double.maxFinite,
            child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(color: Colors.black,),
                itemBuilder: (context, index){
                  return ListTile(title: Text(snapshot.data[index].name),);
                },
                itemCount: snapshot.data.length),
          ) : Loading();
        });
  }
}
