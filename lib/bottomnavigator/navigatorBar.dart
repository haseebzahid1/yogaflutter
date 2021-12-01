import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigatorBottomPage extends StatelessWidget {
  const NavigatorBottomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){},
            child: Column(
              children: [
                SvgPicture.asset("assets/icons/calendar.svg"),
                SizedBox(height: size.height * 0.02,),
                Text("Today"),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Column(

              children: [
                SvgPicture.asset("assets/icons/gym.svg"),
                SizedBox(height: size.height * 0.03,),
                Text("All Exercies"),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Column(
              children: [
                SvgPicture.asset("assets/icons/Settings.svg"),
                SizedBox(height: size.height * 0.02,),
                Text("Setting"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
