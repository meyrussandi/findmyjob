import 'package:findmyjob/constants/theme.dart';
import 'package:findmyjob/models/job_model.dart';
import 'package:findmyjob/ui/pages/job_detail_page.dart';
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final JobModel jobModel;

  JobCard(this.jobModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => JobDetailPage(jobModel)));

      },
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                jobModel.companyLogo,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          70 -
                          16,
                      child: Text(
                        jobModel.name,
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    jobModel.companyName,
                    style: greyTextFont.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    jobModel.location,
                    style: greyTextFont.copyWith(fontSize: 14),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider()
        ],
      ),
    );
  }
}
