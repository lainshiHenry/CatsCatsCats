import 'package:cats_cats_cats/model/class/cat.dart';
import 'package:flutter/material.dart';

import 'get_cat_images.dart';

Future<List<Widget>> generateListOfCatImages() async {
  List<Widget> _resultList = List.empty(growable: true);

  Cat catImage = await getCatImage();

  _resultList.add(
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          // width: 300,
          // height: 300,
          color: Colors.lightBlue,
          child: Image.network(
            catImage.getCatImageUrl!,
            fit: BoxFit.fill,
          )),
    ),
  );

  return _resultList;
}
