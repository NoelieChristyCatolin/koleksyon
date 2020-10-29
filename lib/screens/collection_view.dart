import 'package:flutter/material.dart';
import 'package:koleksyon/components/collection_list.dart';
import 'add_collection.dart';

class CollectionView extends StatefulWidget {
  @override
  _CollectionViewState createState() => _CollectionViewState();
}

class _CollectionViewState extends State<CollectionView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CollectionList(),
        FlatButton.icon(
            onPressed: (){
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
}
