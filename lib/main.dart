import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/konstant/Constant.dart';
import 'package:meditation_app/screens/search.dart';

import 'bottomnavigator/navigatorBar.dart';
import 'medition/madition_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: NavigatorBottomPage(),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: size.height * .45,
              decoration: const BoxDecoration(
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  const Text(
                    "Good Mornign \nShishir",
                    style: TextStyle(fontSize: 32,fontWeight: FontWeight.w900),
                  ),
                  Container(
                    child: const Search(),
                  ),//Search
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .90,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        const CardWidget(imgPath: "assets/icons/Hamburger.svg", imgTitle: "Diet Recommendation",),
                        const CardWidget(imgPath: "assets/icons/Excrecises.svg", imgTitle: "Kegel Exercises",),
                        GestureDetector(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const MeditionScreen();
                              }));
                            },
                            child: const CardWidget(imgPath: "assets/icons/Meditation.svg", imgTitle: "Meditation",)),
                        Material(
                          color: Colors.red,
                          child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return const MeditionScreen();
                                }));
                              },
                              child: const CardWidget(imgPath: "assets/icons/yoga.svg", imgTitle: "Yoga",)),
                        ),

                      ],
                    ),
                  ),//Grid Add
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.imgPath, required this.imgTitle}) : super(key: key);
  final String imgPath;
  final String imgTitle;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                offset:Offset(0,17),
                blurRadius: 17,
                spreadRadius: -23,
                color: kShadowColor,
              ),
            ],
          ),
          child: Padding(
            padding:const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                SvgPicture.asset(imgPath),
                const Spacer(),
                Text(imgTitle,
                  textAlign: TextAlign.center,
                  style:TextStyle(fontSize: 15) ,
                ),
              ],
            ),
          ),
        ),

    );
  }
}
