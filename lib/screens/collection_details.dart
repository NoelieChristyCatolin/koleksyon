import 'package:flutter/material.dart';
import 'package:koleksyon/models/splash_collection.dart';
import 'package:koleksyon/models/splash_image_view_model.dart';
import 'package:provider/provider.dart';
import 'add_to_collection_view.dart';

class CollectionDetails extends StatefulWidget {
  static String id = "collectionDetails";
  String title= "koleksyon";
  int splashCollectionIndex;
//  SplashCollection  splashCollection = SplashCollection();

  CollectionDetails({this.splashCollectionIndex});

  @override
  _CollectionDetailsState createState() => _CollectionDetailsState();
}

class _CollectionDetailsState extends State<CollectionDetails> {
  @override
  Widget build(BuildContext context) {
    widget.splashCollectionIndex = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(color: Colors.black,),
            itemBuilder: (context, index){
              SplashCollection collection = Provider.of<SplashImageViewModel>(context, listen: true).collections[widget.splashCollectionIndex];
              return ListTile(
                trailing: IconButton(
                  icon: Icon(Icons.close, color: Colors.red,),
                  onPressed: (){
                    Provider.of<SplashImageViewModel>(context, listen: false).deleteCollectionImage(widget.splashCollectionIndex, index);
                  },
                ),
                title: Image.network(collection.splashImages[index].url),
                onLongPress: (){
                  showDialog(
                      context:  context,
                      builder: (context){
                        return AddToCollectionView(collection.splashImages[index]);
                      }
                  ).then((value) {
                    if (value= true) {
                      Provider.of<SplashImageViewModel>(context, listen: false).deleteCollectionImage(widget.splashCollectionIndex, index);
                    }
                  });
                },
              );
            },
            itemCount: Provider.of<SplashImageViewModel>(context, listen: true).collections[widget.splashCollectionIndex].splashImages.length),
      ),
    );
  }
}
