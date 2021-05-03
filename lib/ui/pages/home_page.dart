import 'package:findmyjob/constants/theme.dart';
import 'package:findmyjob/models/category_model.dart';
import 'package:findmyjob/providers/category_provider.dart';
import 'package:findmyjob/providers/user_provider.dart';
import 'package:findmyjob/ui/widgets/hot_categories_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discover the\nperfect job",
                    style: blackTextFont.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: blackColor),
                            color: Colors.blueGrey,
                            image: DecorationImage(
                                image: AssetImage("assets/icon_user.png"))),
                      ),
                      SizedBox(
                        width: 80,
                        child: Text(
                          userProvider.user.name,
                          style: blackTextFont,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 30),
                height: 50,
                child: TextField(
                  cursorColor: mainColor,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 28, bottom: 20, top: 20),
                    fillColor: Color(0xffF1F0F5),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: blackColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Search',
                  ),
                  style: blackTextFont,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Text("Hot Categories")),
              Container(
                height: 150,
                child: FutureBuilder<List<CategoryModel>>(
                    future: categoryProvider.getCategories(),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: snapshot.data.map((category) {
                            return Container(
                              margin: EdgeInsets.only(right: 16),
                              child: HotCategoriesCard(
                                name: category.name,
                                urlImage: category.imageUrl,
                              ),
                            );
                          }).toList(),
                        );
                      } else {
                        return SpinKitWave(
                          size: 50,
                          color: mainColor,
                        );
                      }
                    }),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
