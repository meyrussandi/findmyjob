import 'package:findmyjob/constants/theme.dart';
import 'package:findmyjob/models/category_model.dart';
import 'package:findmyjob/models/job_model.dart';
import 'package:findmyjob/providers/category_provider.dart';
import 'package:findmyjob/providers/job_provider.dart';
import 'package:findmyjob/providers/user_provider.dart';
import 'package:findmyjob/ui/pages/category_page.dart';
import 'package:findmyjob/ui/widgets/hot_categories_card.dart';
import 'package:findmyjob/ui/widgets/job_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

    return Scaffold(
        body: Container(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: defaultMargin),
                child: Row(
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
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 20,
                    bottom: 30,
                    left: defaultMargin,
                    right: defaultMargin),
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
                  margin: EdgeInsets.only(
                      bottom: 16, left: defaultMargin, right: defaultMargin),
                  child: Text(
                    "Hot Categories",
                    style: blackTextFont.copyWith(fontSize: 16),
                  )),
              Container(
                height: 150,
                child: FutureBuilder<List<CategoryModel>>(
                    future: categoryProvider.getCategories(),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        int index = 0;
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: snapshot.data.map((category) {
                            index++;
                            return Container(
                              margin: EdgeInsets.only(
                                  left: index == 0 ? defaultMargin : 16,
                                  right: index == snapshot.data.length
                                      ? defaultMargin
                                      : 0),
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
              Container(
                  margin: EdgeInsets.only(
                      bottom: 16,
                      left: defaultMargin,
                      right: defaultMargin,
                      top: 20),
                  child: Text(
                    "Job Posted",
                    style: blackTextFont.copyWith(fontSize: 16),
                  )),
              FutureBuilder<List<JobModel>>(
                  future: jobProvider.getJobs(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      int index = 0;
                      return Column(
                        children: snapshot.data.map((e) {
                          index++;
                          return Container(
                            padding: EdgeInsets.only(
                                left: defaultMargin,
                                right: defaultMargin,
                                top: index != 0 ? 16 : 0),
                            child: JobCard(
                              title: e.name,
                              location: e.location,
                              companyLogo: e.companyLogo,
                              companyName: e.companyName,
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
              SizedBox(height: 50,)
            ],
          )
        ],
      ),
    ));
  }
}
