import 'package:findmyjob/constants/theme.dart';
import 'package:findmyjob/ui/pages/category_page.dart';
import 'package:flutter/material.dart';

class HotCategoriesCard extends StatelessWidget {
  final String urlImage;
  final String name;

  HotCategoriesCard({this.name = "nama pekerjaan", this.urlImage});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryPage(name, urlImage)));

      },
      child: Container(
        height: 150,
        width: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage(urlImage), fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 16, bottom: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft
              )
          ),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(name, style: whiteTextFont,)),
        ),
      ),
    );
  }
}
