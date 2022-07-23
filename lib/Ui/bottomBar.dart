import 'package:flutter/material.dart';
import 'package:testapp/Ui/Search_screen.dart';
import 'package:testapp/Ui/home_page.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black38,
        width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height *.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){
              setState(() {
                index = 0;
              });
            },
                icon: Icon(Icons.home)),
            IconButton(onPressed: (){
              setState(() {
                index = 1;
              });
            }, icon: Icon(Icons.search))
          ],
      ),),
      body: IndexedStack(
        index: index,
        children: [
          HomeScreen(),
          SearchSCreen(),
        ],
      ),
    );
  }
}
