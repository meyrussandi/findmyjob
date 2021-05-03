import 'package:findmyjob/constants/theme.dart';
import 'package:findmyjob/models/job_model.dart';
import 'package:flutter/material.dart';

class JobDetailPage extends StatefulWidget {
  final JobModel jobModel;

  JobDetailPage(this.jobModel);
  @override
  _JobDetailPageState createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  bool isApplied = false;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          children: [
            isApplied
                ? Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 30),
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: Color(0xffECEDF1),
              ),
              child: Text(
                'You have applied this job and the\nrecruiter will contact you',
                textAlign: TextAlign.center,
                style: greyTextFont.copyWith(),
              ),
            )
                : Container(),
            Image.network(
              widget.jobModel.companyLogo,
              width: 60,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.jobModel.name,
              style: blackTextFont.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              '${widget.jobModel.companyName} • ${widget.jobModel.location}',
              style: greyTextFont,
            ),
          ],
        ),
      );
    }

    Widget detailItem(String text) {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 12,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                text,
                style: blackTextFont.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget aboutJob() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About the job',
              style: blackTextFont.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              children: widget.jobModel.about.map((e) => detailItem(e) ).toList())
          ]

        ),
      );
    }

    Widget qualifications() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Qualifications',
              style: blackTextFont.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              children: widget.jobModel.qualifications.map((e) => detailItem(e)).toList()
            ),
          ],
        ),
      );
    }

    Widget responsibilities() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsibilities',
              style: blackTextFont.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              children: widget.jobModel.responsibilities.map((e) => detailItem(e)).toList()
            ),
          ],
        ),
      );
    }

    Widget applyButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 45,
            width: 200,
            child: TextButton(
              onPressed: () {
                setState(() {
                  isApplied = true;
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(66),
                ),
              ),
              child: Text(
                'Apply for Job',
                style: whiteTextFont.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget cancelButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 45,
            width: 200,
            child: TextButton(
              onPressed: () {
                setState(() {
                  isApplied = false;
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(66),
                ),
              ),
              child: Text(
                'Cancel Apply',
                style: whiteTextFont.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget messageButton() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          bottom: 35,
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Message Recruiter',
            style: greyTextFont.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: ()async{
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        body: Center(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 56,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Job Detail",
                        textAlign: TextAlign.center,
                        style: blackTextFont.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              header(),
              aboutJob(),
              qualifications(),
              responsibilities(),
              isApplied ? cancelButton() : applyButton(),
              messageButton(),
            ],
          ),
        ),
      ),
    );
  }
}
