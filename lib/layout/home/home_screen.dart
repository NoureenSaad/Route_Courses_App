import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:route_courses_app/layout/home/widgets/featured_courses_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String route = "HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(image: AssetImage("assets/images/light_route_logo.png"),width: 100,),
                      SizedBox(width: 10,),
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
                        icon: Icon(Icons.dark_mode,color: Theme.of(context).colorScheme.primary,)
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

            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Featured ",style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontSize: 25
                ),),
                Text("Courses",style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 25
                ),)
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FeaturedCoursesWidget(courseName: "Flutter Diploma", studentsNumber: "50"),
                  SizedBox(width: 15,),
                  FeaturedCoursesWidget(courseName: "Android Diploma", studentsNumber: "15"),
                  SizedBox(width: 15,),
                  FeaturedCoursesWidget(courseName: "Frontend Diploma", studentsNumber: "20"),
                ],
              ),
            ),
            SizedBox(height: 25,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Best Selling ",style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: 25
                ),),
                Text("Courses",style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 25
                ),)
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView(
                children: [

                ],
              ))
          ],
        ),
      ),
    );
  }
}
