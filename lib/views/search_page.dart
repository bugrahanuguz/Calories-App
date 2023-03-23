import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/components/search_page/grid_view_page.dart';
import 'package:softito_final_project/components/search_page/meal_name_change.dart';
import 'package:softito_final_project/components/search_page/serach_bar.dart';
import 'package:softito_final_project/const_files/const_variable.dart';
import 'package:softito_final_project/viewmodel/search_view_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    List food = context.watch<SearchViewModel>().food;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
              ),
              searchBar(),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: food.length == 0 ? false : true,
                child: Container(
                  height: ConstVariable(context).screenHeight * 0.05,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: food.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage: NetworkImage(
                                      Faker().image.image(random: true)),
                                  backgroundColor: Colors.transparent,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey[200],
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(food[index]),
                                      CloseButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          context
                                              .read<SearchViewModel>()
                                              .removeFood(index);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(
                height: 10,
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
              ChangeMealName(),
              GridViewPage(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        onPressed: () {},
        icon: Icon(
          Icons.save,
        ),
        label: Text("Save"),
      ),
    );
  }
}
