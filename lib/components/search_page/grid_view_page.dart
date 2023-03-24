import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/viewmodel/nutritions_view_model.dart';
import 'package:softito_final_project/viewmodel/search_view_model.dart';

import '../../const_files/const_variable.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    List food = context.watch<SearchViewModel>().food;
    var list = context.watch<NutritionViewModel>().nutrition_list;

    for (var i = 0; i < list.length; i++) {
      String string = list[i].name.toString();
      string = string[0].toUpperCase() + string.substring(1);
      list[i].name = string;
    }

    return Container(
      margin: EdgeInsets.all(15),
      height: ConstVariable(context).screenHeight * 0.7,
      child: GridView.builder(
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .9, crossAxisCount: 2),
        itemBuilder: (_, index) => Container(
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shadowColor: Colors.black,
            color: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'FOOD: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: list[index].name.toString(),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'CALORIES: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: (list[index].calories.toString() + " kcal"),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'SERVING SIZE: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: (list[index].servingSizeG.toString() + " g"),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'PROTEIN: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: (list[index].proteinG.toString() + " g"),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'CARBS: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: (list[index].carbohydratesTotalG.toString() +
                              " g"),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'FAT: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: (list[index].fatTotalG.toString() + " g"),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffC92C6D),
                      ),
                      height: ConstVariable(context).screenHeight * 0.055,
                      width: ConstVariable(context).screenWidth * 0.12,
                      child: TextButton(
                          onPressed: () {
                            context
                                .read<SearchViewModel>()
                                .addFoodList(list[index], index);
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
