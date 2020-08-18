import 'package:avenue_task/BLoC/TrendingBloC.dart';
import 'package:avenue_task/Widgets/PhotosGrid.dart';
import 'package:avenue_task/models/TrendingPictures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<TrendingPhotos>(
          stream: trendingImagesBloc.photos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text('Avenue Task'),
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'search');
                      },
                      child: Icon(Icons.search),
                    ),
                  ),
                  PhotosGrid(snapshot),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

