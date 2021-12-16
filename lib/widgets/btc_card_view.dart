// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BTCCardView extends StatelessWidget {
  const BTCCardView({
    Key? key,
    required this.headerTextOne,
    required this.hedaerTextTwo,
    required this.moneyTextOne,
    required this.moneyTextTwo,
  }) : super(key: key);

  final String headerTextOne;
  final String hedaerTextTwo;
  final String moneyTextOne;
  final String moneyTextTwo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all((5)),
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headerTextOne,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "\$ " +
                        moneyTextOne.replaceAllMapped(
                            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]},'),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hedaerTextTwo,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "\$ " +
                        moneyTextTwo.replaceAllMapped(
                            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]},'),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
