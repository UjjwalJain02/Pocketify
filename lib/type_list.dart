import 'package:flutter/material.dart';

class TypeItem {
  String title = "";
  Image image = Image.asset('assets/images/food');
  bool isSelected = false;

  TypeItem(
      {Key? key, required String title, required image, required isSelected});
}

class TypeList {
  List<TypeItem> list = [
    TypeItem(
        title: "title",
        image: Image.asset('assets/images/food'),
        isSelected: false)
  ];
}
