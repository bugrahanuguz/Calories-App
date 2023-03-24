import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text("HomePage"),
        backgroundColor: Colors.purple,
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Icon(Icons.power_settings_new)),
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
            const HomePageButtons(),
            const MealCard(),
          ],
        ),
      ),
    );
  }
}
