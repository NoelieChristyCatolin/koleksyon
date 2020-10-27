import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Something exciting is about to come!'),
          SizedBox(height: 10),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}