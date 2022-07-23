import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/Ui/widgets/data_card.dart';
import 'package:testapp/controller/news_Controller.dart';

class SearchSCreen extends StatefulWidget {
  const SearchSCreen({Key? key}) : super(key: key);

  @override
  State<SearchSCreen> createState() => _SearchSCreenState();
}

class _SearchSCreenState extends State<SearchSCreen> {
  NewsController newsController = Get.put(NewsController());

  TextEditingController searchController = TextEditingController();

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
          title: const Text('Search News'),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  onChanged: (Value) {
                    newsController.featchData(value: Value);
                  },
                  controller: searchController,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'eg... artical search',
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => newsController.isLoading == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: newsController.newsData.value.length,
                            itemBuilder: (context, index) {
                              return DataCard(
                                image: newsController
                                    .newsData.value[index].urlToImage
                                    .toString(),
                                author: newsController
                                    .newsData.value[index].author
                                    .toString(),
                                title: newsController
                                    .newsData.value[index].title
                                    .toString(),
                                description: newsController
                                    .newsData.value[index].description
                                    .toString(),
                                publishedAt: newsController
                                    .newsData.value[index].publishedAt
                                    .toString(),
                                content: newsController
                                    .newsData.value[index].content
                                    .toString(),
                              );
                            }),
                      ),
              )
            ],
          ),
        ));
  }
}
