import 'package:flutter/material.dart';
import 'package:koleksyon/models/splash_image_view_model.dart';
import 'package:provider/provider.dart';
import 'screens/koleksyon.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => SplashImageViewModel(),
      child: MaterialApp(
        title: 'Koleksyon',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: Koleksyon.id,
        routes: {
          Koleksyon.id : (context) => Koleksyon()
        },
      ),
    );
  }
}
