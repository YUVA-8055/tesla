import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/HomeScreen/Home_controller.dart';
import 'TempBtn.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    super.key,
    required HomeController controller,
  }) : _controller = controller;

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 110,
            child: Row(
              children: [
                TempBtn(
                    isActive: _controller.isCoolSelected,
                    svgSrc: "assets/icons/coolShape.svg",
                    title: "cool",
                    activeColor: primaryColor,
                    press: _controller.updateCoolSelectedTab),
                SizedBox(
                  width: 10,
                ),
                TempBtn(
                    isActive: !_controller.isCoolSelected,
                    svgSrc: "assets/icons/heatShape.svg",
                    title: "heat",
                    activeColor: redColor,
                    press: _controller.updateCoolSelectedTab)
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_drop_up_rounded,
                    size: 48,
                  )),
              Text(
                "24" + "\u2103",
                style: TextStyle(fontSize: 86),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 48,
                  )),
            ],
          ),
          Spacer(),
          Text("CURRENT TEMPERATURE"),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("INSIDE"),
                  Text(
                    "24" + "\u2103",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OUTSIDE",
                    style: TextStyle(color: Colors.white54),
                  ),
                  Text(
                    "30" + "\u2103",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white54),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}