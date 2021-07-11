import "package:flutter/material.dart";

class MainMenuCard extends StatelessWidget {
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
                      SizedBox(width: MediaQuery.of(context).size.width * .005),
                      IconButton(
                        icon: Image.asset('assets/1.png'),
                        iconSize: 95,
                        onPressed: () {},
                      )
                    ],
                  ),
                  Text(
                    'Notifications',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
      
    );
  }
}