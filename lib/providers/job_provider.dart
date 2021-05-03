import 'dart:convert';

import 'package:findmyjob/constants/value.dart';
import 'package:findmyjob/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JobProvider with ChangeNotifier {
  Future<List<JobModel>> getJobs() async {
    try {
      var response = await http.get(Uri.parse(baseUrl + "jobs"));
      print("response status : " + response.statusCode.toString());
      print("response body : " + response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);
        parsedJson.forEach((element) {
          jobs.add(JobModel.fromJson(element));
        });

        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<JobModel>> getJobsByCategory(String category) async {
    try {
      var response = await http.get(Uri.parse(baseUrl + "jobs?category=$category"));
      print("response status : " + response.statusCode.toString());
      print("response body : " + response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);
        parsedJson.forEach((element) {
          jobs.add(JobModel.fromJson(element));
        });

        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
