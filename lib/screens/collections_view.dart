import 'package:flutter/material.dart';
import 'package:koleksyon/models/splash_image.dart';
import 'package:koleksyon/models/splash_collection.dart';
import 'package:koleksyon/models/splash_image_view_model.dart';
import 'package:koleksyon/components/loading.dart';
import 'package:koleksyon/screens/collection_details.dart';
import 'package:provider/provider.dart';
import 'create_collection.dart';

class CollectionsView extends StatefulWidget {
  @override
  _CollectionsViewState createState() => _CollectionsViewState();
}

class _CollectionsViewState extends State<CollectionsView> {
  SplashImageViewModel viewModel = SplashImageViewModel();
  SplashImage splashImage = SplashImage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Container(
          width: double.maxFinite,
            child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(color: Colors.black,),
                itemBuilder: (context, index){
                SplashCollection collection = Provider.of<SplashImageViewModel>(context, listen: true).collections[index];
                  return ListTile(
                    trailing: IconButton(
                      icon: Icon(Icons.close, color: Colors.red,),
                      onPressed: (){
                        Provider.of<SplashImageViewModel>(context, listen: false).deleteCollection(index);
                      },
                    ),
                    title: Text(collection.name),
                    onTap: (){
                      Navigator.pushNamed(context, CollectionDetails.id, arguments: index);
                    },
                    onLongPress: () {
                      print("onLongPress");
                      showDialog(
                        context: context,
                        builder: (context){
                          return CreateCollection(collection.name,index);
                        }
                      );
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
