import 'package:cats_cats_cats/controller/get_cat_images.dart';
import 'package:flutter/material.dart';

import '../controller/generate_list_of_cat_images.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> _sampleListOfPhotos = List.generate(10, (index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 300,
          height: 300,
          color: Colors.lightBlue,
          child: Center(child: Text(index.toString())),
        ),
      );
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          getCatImage();
        },
      ),
      body: SingleChildScrollView(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return FutureBuilder(
              future: generateListOfCatImages(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data.runtimeType);

                if (snapshot.connectionState == ConnectionState.done) {
                  List<Widget> _listToDisplay = snapshot.data;
                  return Wrap(
                    children: _listToDisplay,
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_filled),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              label: ''),
        ],
      ),
    );
  }
}
