import 'dart:convert';

import 'package:findmyjob/constants/value.dart';
import 'package:findmyjob/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier {
  Future<List<CategoryModel>> getCategories() async {
    try {
      var response = await http.get(Uri.parse(baseUrl + "categories"));

      print("response status : " + response.statusCode.toString());
      print("response body : " + response.body);

      if (response.statusCode == 200) {
        List<CategoryModel> categories = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((element) {
          categories.add(CategoryModel.fromJson(element));
        });

        return categories;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
