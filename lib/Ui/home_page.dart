import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/Ui/widgets/data_card.dart';
import 'package:testapp/controller/news_Controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsController newsController = Get.put(NewsController());
  @override
  void initState() {
    // TODO: implement initState
    newsController.featchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Breaking News'),
        ),
        body: Obx(
          () => newsController.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.blueGrey,
                  child: ListView.builder(
                      itemCount: newsController.newsData.length,
                      itemBuilder: (context, index) {
                        return DataCard(
                          image: newsController.newsData[index].urlToImage
                              .toString(),
                          author:
                              newsController.newsData[index].author.toString(),
                          title:
                              newsController.newsData[index].title.toString(),
                          description: newsController
                              .newsData[index].description
                              .toString(),
                          publishedAt: newsController
                              .newsData[index].publishedAt
                              .toString(),
                          content:
                              newsController.newsData[index].content.toString(),
                        );
                      }),
                ),
        ));
  }
}
