import 'package:findmyjob/constants/theme.dart';
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String location;
  final String companyLogo;
  final String companyName;
  final Function onTap;

  JobCard(
      {Key key,
      this.title = "title",
      this.location = "location",
      this.companyLogo,
      this.companyName,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTap != null){
          onTap();
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                companyLogo,
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
                        title,
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )),
                  SizedBox(height: 8,),
                  Text(
                    companyName,
                    style: greyTextFont.copyWith(fontSize: 14),
                  ),  SizedBox(height: 8,),
                  Text(
                    location,
                    style: greyTextFont.copyWith(fontSize: 14),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 8,),
          Divider()
        ],
      ),
    );
  }
}
