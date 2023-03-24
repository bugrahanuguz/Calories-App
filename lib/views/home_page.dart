import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/viewmodel/foods_view_model.dart';
import 'package:softito_final_project/viewmodel/search_view_model.dart';
import 'package:softito_final_project/views/login_page.dart';
import '../components/home_page/buttons.dart';
import '../components/home_page/calories_widget.dart';
import '../components/home_page/circular_progress.dart';
import '../components/home_page/meal_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //UserModel user = context.watch<UserViewModel>().user;
    return Scaffold(
      backgroundColor: Color(0xffFFEAEA),
      appBar: AppBar(
        title: Text(
          "HomePage",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xff609EA2),
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Icon(
              Icons.power_settings_new,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              "Today",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            const CircularProgress(),
            const CaloriesWidget(),
            //const HomePageButtons(),
            const MealCard(),
          ],
        ),
      ),
    );
  }
}
