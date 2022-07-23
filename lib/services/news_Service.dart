import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/model/newsModel.dart';

class NewsService {
  Future newsApi({value}) async {
    String uri =
        'https://newsapi.org/v2/everything?q=${value}&from=2022-07-22&sortBy=popularity&apiKey=60ae73abeef14295a633045b346521f7';
    try {
      final response = await http.get(Uri.parse(uri));
      var jsonResponse = json.decode(response.body);
      log('data from jsonresponse ==> $jsonResponse');
      if (response.statusCode == 200) {
        var data = NewsModel.fromJson(jsonResponse);
        log('data from service ==>  $data');
        return data;
      }
      log('data from response ==>  $response');
    } catch (e) {
      log('error occur in service page ==>  $e');
    }
  }
}
