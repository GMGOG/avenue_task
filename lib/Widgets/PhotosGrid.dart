import 'package:flutter/material.dart';
import 'package:avenue_task/screens/PopUp.dart';

class PhotosGrid extends StatelessWidget {
  PhotosGrid(this.snapshot);
  final snapshot;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhotoScreen(
                          snapshot.data.photos[index].src.medium)));
            },
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              snapshot.data.photos[index].src.medium),
                          fit: BoxFit.cover,
                        ),),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_enhance),
                        SizedBox(width: 10,),
                        Text('@${snapshot.data.photos[index].photographer}', style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: snapshot.data.photos.length,
      ),
    );
  }
}