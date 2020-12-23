import 'package:flutter/material.dart';
import 'package:money_lab/constants.dart';

class RemaningBudget extends StatelessWidget {
  const RemaningBudget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(KdefaultPaddin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/money-bag.png",
              cacheHeight: 80,
              cacheWidth: 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Remaining Budget",
                  style: TextStyle(
                    color: kOptionalColor,
                    fontSize: kTextSize,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "\$ 32432",
                      style: TextStyle(
                        color: kGreenLightColor,
                        fontSize: kTitleSize,
                      ),
                    ),
                    Text(
                      " / ",
                      style: TextStyle(
                        color: kOptionalColor,
                        fontSize: kTitleSize,
                      ),
                    ),
                    Text(
                      "\$ 32432",
                      style: TextStyle(
                        color: kRedLightColor,
                        fontSize: kTitleSize,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
