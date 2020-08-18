import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  final String photoURL;
  PhotoScreen(this.photoURL);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.black,
            ),
          ),
          Center(child: Image.network(photoURL),),
        ],
      );
  }
}
