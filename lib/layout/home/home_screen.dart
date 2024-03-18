import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String route = "HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(image: AssetImage("assets/images/light_route_logo.png")),
                    Column(
                      children: [
                        Text("Welcome To Route"),
                        Text("Enjoy Our Courses"),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.dark_mode)
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.logout)
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Featured ",style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: 25
                  ),),
                  Text("Courses",style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 25
                  ),)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
