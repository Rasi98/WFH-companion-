import 'dart:developer';

import "package:flutter/material.dart";

class MainMenuCard extends StatelessWidget {
  final String asset;
  final String text;
  final Function onClick;

  MainMenuCard({this.asset, this.text, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .3,
      height: MediaQuery.of(context).size.height * .2,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * .03),
              IconButton(
                icon: Image.asset(asset),
                iconSize: 85,
                onPressed: onClick,
              )
            ],
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          )
        ],
      ),
    );
  }
}
