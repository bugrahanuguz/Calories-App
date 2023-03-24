import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/const_files/const_variable.dart';
import 'package:softito_final_project/models/nutritions_model.dart';
import 'package:softito_final_project/viewmodel/foods_view_model.dart';
import 'package:softito_final_project/viewmodel/search_view_model.dart';
import 'package:softito_final_project/views/search_page.dart';

import '../../viewmodel/homepage_view_model.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key});

  @override
  Widget build(BuildContext context) {
    List meal = context.watch<HomepageViewModel>().meals;
    List<IconData?> mealIcon = context.watch<HomepageViewModel>().mealsIcon;
    List calories = context.watch<HomepageViewModel>().calories;
    List<Nutritions> breakfast = context.watch<FoodViewModel>().breakfast;
    List<Nutritions> launch = context.watch<FoodViewModel>().lunch;
    List<Nutritions> dinner = context.watch<FoodViewModel>().dinner;
    List<List<Nutritions>> meal_names = [breakfast, launch, dinner];

    var p = Provider.of<SearchViewModel>(context, listen: false);
    
    // p.clearCal();
    // p.getBreakfastCall(breakfast, launch, dinner);
    // List<double> cal_meal = [p.breakFastCal, p.lunchCal, p.dinnerCal];

    return Container(
      margin: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        itemCount: meal.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              p.sendButtonName(index);
              showDialog(
                barrierColor: Color(0xffFFEAEA),
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(meal[index]),
                    content: Container(
                      height: 300,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Food",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                              Text(
                                "Serve Size",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                              Text(
                                "Calories",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                          Container(
                            height: ConstVariable(context).screenHeight * 0.3,
                            child: Column(
                              children: [
                                Container(
                                  width: 250,
                                  height: 150,
                                  child: ListView.builder(
                                    shrinkWrap: false,
                                    itemCount: meal_names[index].length == 0
                                        ? 0
                                        : meal_names[index].length,
                                    itemBuilder:
                                        (BuildContext context, index2) {
                                      return Column(
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(meal_names[index][index2]
                                                  .name
                                                  .toString()),
                                              Text(meal_names[index][index2]
                                                      .servingSizeG
                                                      .toString() +
                                                  " g"),
                                              Text(meal_names[index][index2]
                                                      .calories
                                                      .toString() +
                                                  " kcal"),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Text("Total: " +
                                    p.cal_meal[index]
                                        .toStringAsFixed(1)
                                        .toString() +
                                    " kcal"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('Close'),
                        onPressed: () {
                          p.clearCal();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
                context: context,
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Card(
                color: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  meal[index],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  mealIcon[index],
                                  size: 20,
                                )
                              ],
                            ),
                            Text(calories[index] +
                                "/" +
                                p.cal_meal[index].toInt().toString() +
                                "kcal"),
                          ],
                        ),
                      ),
                      _addButton(context, index)
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _addButton(BuildContext context, int index) => ElevatedButton(
      onPressed: () {
        var provider = Provider.of<SearchViewModel>(context, listen: false);
        provider.sendButtonName(index);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchPage()));
      },
      child: const Icon(Icons.add, color: Color(0xffC92C6D)),
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(side: BorderSide(color: Color(0xffC92C6D))),
          padding: const EdgeInsets.all(5),
          backgroundColor: Colors.grey.shade300),
    );
