import 'package:flutter/material.dart';
import 'package:koleksyon/components/loading.dart';
import 'package:koleksyon/models/splash_collection.dart';
import 'package:koleksyon/models/collection_view_model.dart';
import 'package:koleksyon/models/splash_image_view_model.dart';
import 'package:koleksyon/models/splash_image.dart';
import 'package:koleksyon/components/splash_image_tile.dart';
import '../components/collection_list.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SplashImageViewModel splashImageViewModel = SplashImageViewModel();

  String searchKey = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value){
            setState(() {
              searchKey = value;
            });
          },
        ),
        FutureBuilder<List<SplashImage>>(
          future: splashImageViewModel.searchImage(searchKey),
          builder: ( context, snapshot) {
            return snapshot.hasData ? Flexible(
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(color: Colors.black,),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    return SplashImageTile(snapshot.data[index]);
                  }),
            ) : Loading();
          },)
      ],
    );
  }
}
