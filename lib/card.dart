import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Card extends StatelessWidget {
  const Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),

      ),
      child: Column(
        children: <Widget>[
          SvgPicture.asset("assets/icons/Hamburger.svg"),
          const Spacer(),
          const Text("Diet Recommendation",
            textAlign: TextAlign.center,
            style:TextStyle(fontSize: 15) ,
          ),
        ],
      ),
    );
  }
}
