import 'package:flutter/material.dart';

import '../constants.dart';

class TyrePsiTile extends StatelessWidget {
  const TyrePsiTile({super.key, required this.constraints , required this.list});
  final BoxConstraints constraints;
  final List<Animation<double>> list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          childAspectRatio: constraints.maxWidth / constraints.maxHeight,
          crossAxisSpacing: 20),
      itemBuilder: (context, itemIndex) => ScaleTransition(
        scale: list[itemIndex],

        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color:
                  itemIndex == 0 ? Colors.red.withOpacity(0.1) : Colors.white10,
              border: Border.all(
                  color: itemIndex == 0 ? redColor : primaryColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(TextSpan(
                  text: itemIndex == 0 ? "23.6" : "${itemIndex + 29.6} ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: "psi",
                        style: TextStyle(
                          fontSize: 18,
                        ))
                  ])),
              SizedBox(
                height: 10,
              ),
              Text(
                "24" + "\u2103",
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Text(
                "LOW",
                style: TextStyle(fontSize: 50),
              ),
              Text(
                "PRESSURE",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
