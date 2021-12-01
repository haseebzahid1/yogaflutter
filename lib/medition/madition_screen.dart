import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app/bottomnavigator/navigatorBar.dart';
import 'package:meditation_app/konstant/Constant.dart';
import 'package:meditation_app/screens/search.dart';

class MeditionScreen extends StatelessWidget {
  const MeditionScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: NavigatorBottomPage(),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      const Text(
                        "Meditation",
                        style: TextStyle(fontSize: 32,fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 10),
                      const Text(
                        "3-10 MIN Course",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: size.width * .6, // it just take 60% of total width
                        child: Text(
                          "Live happier and healthier by learning the fundamentals of meditation and mindfulness",
                        ),
                      ),
                      SizedBox(
                        width: size.width * .5,
                        child: Container(
                          child: const Search(),
                        ),
                      ),
                      Wrap(
                        spacing: 20,
                        runSpacing:15,
                        children: [
                          SessionCard(icon:Icons.play_arrow, cardTitle: "Session 01",cardBgColor: Colors.blue,),
                          SessionCard(icon:Icons.play_arrow, cardTitle: "Session 02"),
                          SessionCard(icon:Icons.play_arrow, cardTitle: "Session 03",),
                          SessionCard(icon:Icons.play_arrow, cardTitle: "Session 04",),
                          SessionCard(icon:Icons.play_arrow, cardTitle: "Session 05",),
                          SessionCard(icon:Icons.play_arrow, cardTitle: "Session 06",),
                          SessionCard(icon:Icons.play_arrow, cardTitle: "Session 07",),
                          SessionCard(icon:Icons.play_arrow, cardTitle: "Session 08",),
                          SizedBox(height: 10,),
                          Text(
                            "Meditation",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.all(10),
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 17),
                                  blurRadius: 23,
                                  spreadRadius: -13,
                                  color: kShadowColor,
                                ),
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  "assets/icons/Meditation_women_small.svg",
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Basic 2",
                                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                                      ),
                                      Text("Start your deepen you practice")
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: SvgPicture.asset("assets/icons/Lock.svg"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}


class SessionCard extends StatelessWidget {
   const SessionCard({
    required this.cardTitle,
    required this.icon,
     this.cardBgColor,
  });

  final IconData icon;
  final String cardTitle;
  final Color? cardBgColor;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context , constrains) {
          return ClipRRect(
            borderRadius: BorderRadius.all(const Radius.circular(13)),
            child: Container(
              width: constrains.maxWidth / 2 -10,
              // margin: EdgeInsets.symmetric(vertical: 20),
              // padding: EdgeInsets.all(10),
              // height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 17),
                    blurRadius: 23,
                    spreadRadius: -13,
                    color: kShadowColor,
                  ),
                ],
                color: Colors.white,
              ),
              child: Material(
                color:Colors.transparent,
                child: InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 42,
                          width: 43,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              color: cardBgColor ?? Colors.white,
                              shape: BoxShape.circle
                          ),
                          child:  Icon(icon,
                              color: cardBgColor!=null ?  Colors.white : Colors.blue,
                          ),
                        ),
                        const SizedBox(
                          width: 10,),
                        Text(cardTitle,
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
