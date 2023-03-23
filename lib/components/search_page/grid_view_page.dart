import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
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
    return Container(
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
                      child: Image.network(Faker().image.image(random: true)),
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
                        height: ConstVariable(context).screenHeight * 0.04,
                        width: ConstVariable(context).screenWidth * 0.1,
                        color: Colors.purple,
                        child: TextButton(
                            onPressed: () {
                              context.read<SearchViewModel>().addFood("onion");
                            },
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
    );
  }
}
