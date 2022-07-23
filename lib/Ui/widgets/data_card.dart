import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  DataCard(
      {Key? key,
      required this.image,
      required this.author,
      required this.title,
      required this.description,
      required this.publishedAt,
      required this.content})
      : super(key: key);
  String image;
  String author;
  String title;
  String description;
  String publishedAt;
  String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.grey[400],
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .45,
                    // color: Colors.deepOrange,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width * .4,
                          // color: Colors.black,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                image,
                                fit: BoxFit.fill,
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          author,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(publishedAt,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 1,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(
                            description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                width: MediaQuery.of(context).size.width,
                height: 85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Text(
                  content,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
