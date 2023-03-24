import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/viewmodel/nutritions_view_model.dart';
import 'package:softito_final_project/viewmodel/search_view_model.dart';

import '../../const_files/const_variable.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({super.key});

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
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
              padding: EdgeInsets.all(8),
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
                          text: list[index].calories.toString(),
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
                          text: list[index].servingSizeG.toString(),
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
                          text: list[index].proteinG.toString(),
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
                          text: list[index].carbohydratesTotalG.toString(),
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
                          text: list[index].fatTotalG.toString(),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.purple,
                      ),
                      height: ConstVariable(context).screenHeight * 0.06,
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
