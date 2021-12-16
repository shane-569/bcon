// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AskBidCardView extends StatelessWidget {
  const AskBidCardView({
    Key? key,
    required this.bidPrice,
    required this.bidQTY,
    required this.askPrice,
    required this.askQTY,
  }) : super(key: key);

  final String bidPrice;
  final String bidQTY;
  final String askPrice;
  final String askQTY;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all((5)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 30,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                bidPrice,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                bidQTY,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                askPrice,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                askQTY,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
