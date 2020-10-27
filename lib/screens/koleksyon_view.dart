
import 'package:flutter/material.dart';
import 'package:koleksyon/components/loading.dart';
import 'package:koleksyon/models/splash_image_view_model.dart';
import 'package:koleksyon/models/splash_image.dart';

class KoleksyonView extends StatefulWidget {
  String title;

  KoleksyonView(this.title);

  @override
  _KoleksyonViewState createState() => _KoleksyonViewState();
}

class _KoleksyonViewState extends State<KoleksyonView> {
  SplashImageViewModel splashImageViewModel = SplashImageViewModel();
  String searchKey = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              onChanged: (value){
                setState(() {
                  searchKey = value;
                });
              },
            ),
            Expanded(
                child: FutureBuilder<List<SplashImage>>(
                  future: splashImageViewModel.searchImage(searchKey),
                  builder: ( context, snapshot) {
                    return snapshot.hasData ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index){
                          return ListTile(
                            leading: Text(snapshot.data[index].description),
                            title: Image.network(
                                snapshot.data[index].url,
                              width: 200,
                              height: 200,
                            ),
                          );
                        }) : Loading();
                  },)
            )
          ],
        ),
      ),
    );
  }
}
