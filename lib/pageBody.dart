import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget pageBody(String imgUrl, String title, String Description) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
      children: [
        Image.network(imgUrl),
        Text(
          title,
          style: TextStyle(
            fontSize: 40,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(Description,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black26,
            ))
      ],
    ),
  );
}
