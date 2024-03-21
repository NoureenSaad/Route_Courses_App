import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:route_courses_app/layout/home/widgets/best_selling_courses_widget.dart';
import 'package:route_courses_app/layout/home/widgets/featured_courses_widget.dart';
import 'package:route_courses_app/layout/login/login_screen.dart';
import 'package:route_courses_app/model/best_selling_courses.dart';
import 'package:route_courses_app/shared/firebase/firestore_helper.dart';
import 'package:route_courses_app/shared/providers/auth_data_provider.dart';

import '../../model/featured_courses.dart';
import '../../shared/providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AuthDataProvider authDataProvider = Provider.of<AuthDataProvider>(context);
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
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
                      Image(image: AssetImage(provider.theme == ThemeMode.dark?"assets/images/dark_route_logo.png":"assets/images/light_route_logo.png"),width: 80,),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome To Route",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 16
                          )),
                          Text("Enjoy Our Courses!",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 14
                          )),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          provider.changeTheme(provider.theme == ThemeMode.dark?ThemeMode.light:ThemeMode.dark);
                        },
                        icon: Icon(provider.theme == ThemeMode.dark?Icons.light_mode:Icons.dark_mode,color: Theme.of(context).colorScheme.primary,)
                      ),
                      IconButton(
                          onPressed: ()async{
                            await authDataProvider.signOut();
                            Navigator.pushNamedAndRemoveUntil(context, LoginScreen.route, (route) => false);
                          },
                          icon: Icon(Icons.logout,color: Theme.of(context).colorScheme.primary)
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
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
            SizedBox(height: 15,),
            Expanded(
              child: StreamBuilder(
                stream: FirestoreHelper.getAllFeaturedCourses(),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasError){
                    return Column(
                      children: [
                        Text("There Is An Error!!"),
                        ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text("Try Again"))
                      ],
                    );
                  }
                  List<FeaturedCourses> featuredCourses = snapshot.data??[];
                  return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 10,),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>FeaturedCoursesWidget(featuredCourses: featuredCourses[index]),
                    itemCount: featuredCourses.length,
                  );
                },
              ),
            ),
            SizedBox(height: 20,),
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
            Expanded(
              child: StreamBuilder(
                stream: FirestoreHelper.getAllBestSellingCourses(),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasError){
                    return Column(
                      children: [
                        Text("There Is An Error!!"),
                        ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text("Try Again"))
                      ],
                    );
                  }
                  List<BestSellingCourses> bestSellingCourses = snapshot.data??[];
                  return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10,),
                    itemBuilder: (context,index)=>BestSellingCoursesWidget(bestSellingCourses: bestSellingCourses[index]),
                    itemCount: bestSellingCourses.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
