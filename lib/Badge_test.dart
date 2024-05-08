import 'package:flutter/material.dart';
import 'package:badges/badges.dart'as badges;

class BadgeTest extends StatefulWidget {
  const BadgeTest({super.key});

  @override
  State<BadgeTest> createState() => _BadgeTestState();
}

class _BadgeTestState extends State<BadgeTest> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {


    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed:  () {

              setState(() {
                counter++;
              });
            }, child: Text('click'),),
            badges.Badge(
              badgeContent: Text(
                counter.toString()
              ),
              child: Icon(Icons.shopping_cart),
            )
          ],
        ),
      ),
    ));
  }
}
