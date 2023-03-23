import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:softito_final_project/const_files/const_variable.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(50),
                ),
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image.asset(
                          "assets/images/search.png",
                          scale: 3,
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Foods",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.only(left: 10),
                    width: ConstVariable(context).screenWidth * 0.6,
                    child: TextField(
                        controller: TextEditingController(text: "Other"),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Image.asset(
                              "assets/images/pen.png",
                              scale: 3,
                            ),
                          ),
                        )),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: ConstVariable(context).screenHeight * 0.7,
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 4 / 5, crossAxisCount: 2),
                  itemBuilder: (_, index) => Container(
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shadowColor: Colors.black,
                      color: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                    Faker().image.image(random: true)),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Onion"),
                            Text("Claroies"),
                            Text("Onion"),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                  height: ConstVariable(context).screenHeight *
                                      0.04,
                                  width:
                                      ConstVariable(context).screenWidth * 0.1,
                                  color: Colors.purple,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
