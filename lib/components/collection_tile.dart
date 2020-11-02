import 'package:flutter/material.dart';
import 'package:koleksyon/models/splash_collection.dart';

class CollectionTile extends StatefulWidget {
  SplashCollection collection = SplashCollection();
  Function onCollectionTap;
  CollectionTile({this.collection, this.onCollectionTap});
  
  @override
  _CollectionTileState createState() => _CfluollectionTileState();
}

class _CollectionTileState extends State<CollectionTile> {


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.collection.name),
      onTap: widget.onCollectionTap,
    );
  }
}
