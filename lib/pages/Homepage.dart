import 'package:coffeeapp/utils/coffeetile.dart';
import 'package:coffeeapp/utils/coffeetype.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

Future<String> getImageURL(String imageName) async {
  final storageReference = FirebaseStorage.instance.ref().child(imageName);
  var url = await storageReference.getDownloadURL();
  return url;
}

class _HomepageState extends State<Homepage> {
  final List coffeetype1 = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
    [
      'Brownies',
      false,
    ],
    [
      'Cake',
      false,
    ],
  ];
  void Coffetypeselected(int index) {
    setState(() {
      for (int i = 0; i < coffeetype1.length; i++) {
        coffeetype1[i][1] = false;
      }
      ;
      coffeetype1[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text("Find the best coffee for you",
                  style: GoogleFonts.sairaCondensed(fontSize: 40))),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: ("Find your coffee.."),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
              height: 50,
              child: ListView.builder(
                  itemCount: coffeetype1.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((BuildContext, index) {
                    return coffeetype(
                      coffee_type: coffeetype1[index][0],
                      isselected: coffeetype1[index][1],
                      ontap: () {
                        Coffetypeselected(index);
                      },
                    );
                  }))),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              coffeetile(
                  coffeeimg: 'lib/images/waffle.jpg',
                  coffeename: 'Pancake',
                  descp: 'with honey, nutella and ice cream',
                  price: '4.00'),
              coffeetile(
                  coffeeimg: 'lib/images/waffle.jpg',
                  coffeename: 'Pancake',
                  descp: 'with honey, nutella and ice cream',
                  price: '4.00'),
              coffeetile(
                  coffeeimg: 'lib/images/cookies.jpg',
                  coffeename: 'Cookies',
                  descp: "Salted chip cookie",
                  price: '4.00'),
              coffeetile(
                  coffeeimg: 'lib/images/donut.jpg',
                  coffeename: 'Donut',
                  descp: "Chocolate donut",
                  price: '4.00'),
              coffeetile(
                  coffeeimg: 'lib/images/cakez.jpg',
                  coffeename: 'Chocolate',
                  descp: "Brownie,Sweet,Desert",
                  price: '4.00'),
            ],
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
      ]),
    );
  }
}
