import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String name;
  final String imageUrl;

  CategoryPage(this.name, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(children: [
          Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                image: DecorationImage(image: NetworkImage(imageUrl))
                ),
              )
            ],
          )
        ],),
      ),
    );
  }
}
