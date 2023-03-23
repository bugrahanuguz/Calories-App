import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/views/search_page.dart';

import '../../viewmodel/homepage_view_model.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key});

  @override
  Widget build(BuildContext context) {
    List meal = context.watch<HomepageViewModel>().meals;
    List calories = context.watch<HomepageViewModel>().calories;

    return Container(
      margin: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        itemCount: meal.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => showDialog(
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(meal[index]),
                  content: Text('Onion'),
                  actions: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
              context: context,
            ),
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
                            Text(
                              meal[index],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(calories[index]),
                          ],
                        ),
                      ),
                      _addButton(context)
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _addButton(BuildContext context) => ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchPage()));
      },
      child: const Icon(Icons.add, color: Colors.purple),
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(side: BorderSide(color: Colors.purple)),
          padding: const EdgeInsets.all(5),
          backgroundColor: Colors.grey.shade300),
    );
