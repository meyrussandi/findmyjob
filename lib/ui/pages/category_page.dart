import 'package:findmyjob/constants/theme.dart';
import 'package:findmyjob/models/category_model.dart';
import 'package:findmyjob/models/job_model.dart';
import 'package:findmyjob/providers/job_provider.dart';
import 'package:findmyjob/ui/widgets/job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final CategoryModel categoryModel;

  CategoryPage(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      image: DecorationImage(
                          image: NetworkImage(categoryModel.imageUrl),
                          fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      // NOTE : BACK ICON
                      Container(
                        margin: EdgeInsets.only(top: 20, left: defaultMargin),
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black.withOpacity(0.04)),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        bottom: 16,
                        left: defaultMargin,
                        right: defaultMargin,
                        top: 20),
                    child: Text(
                      "Hot Categories",
                      style: blackTextFont.copyWith(fontSize: 16),
                    )),
                FutureBuilder<List<JobModel>>(
                    future: jobProvider.getJobsByCategory(categoryModel.name),
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
                              child: JobCard(e),
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
                Container(
                    margin: EdgeInsets.only(
                        bottom: 16,
                        left: defaultMargin,
                        right: defaultMargin,
                        top: 20),
                    child: Text(
                      "New Startups",
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
                              child: JobCard(e),
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
                SizedBox(
                  height: 50,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
