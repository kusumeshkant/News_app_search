import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:testapp/model/newsModel.dart';
import 'package:testapp/services/news_Service.dart';

class NewsController extends GetxController {
  var newsData = <Articles>[].obs;
  var isLoading = true.obs;

  Future featchData({value}) async {
    try {
      var response = await NewsService().newsApi(value: value);
      log('response data coming form ==>' + response.toString());
      if (response != null) {
        newsData.value = response.articles!;
        isLoading(false);
        update();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
