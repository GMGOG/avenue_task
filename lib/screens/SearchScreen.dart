import 'package:avenue_task/BLoC/SearchBLoC.dart';
import 'package:avenue_task/Widgets/PhotosGrid.dart';
import 'package:avenue_task/models/SearchModelResponse.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
          TextField(
            autofocus: true,
            onChanged: (value){
                text = value;
                setState(() {

                });
              if(value.length > 2){
                searchPhotosBloc.fetchSearchPhotos(1, value);
              }
            },
          ),
            Expanded(
              child: StreamBuilder<SearchModel>(
                stream: searchPhotosBloc.photos,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if(text.length < 3){
                      return Center(child: Text('Input must be more than 2 characters'));
                    }
                    else if(snapshot.data.photos.length == 0){
                      return Center(child: Text('No Images found with your query'));
                    }
                    else{
                      return CustomScrollView(
                        slivers: [
                          PhotosGrid(snapshot),
                        ],
                      );
                    }
                  } else {
                    return Center(child: Text('Search for your desired pictures'),);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
