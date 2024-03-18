import 'package:flutter/material.dart';
import 'package:route_courses_app/style/app_colors.dart';

class FeaturedCoursesWidget extends StatelessWidget {
  String courseName;
  String studentsNumber;
  FeaturedCoursesWidget({super.key,required this.courseName,required this.studentsNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.smallLabelColor.withOpacity(0.1)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image(image: AssetImage("assets/images/featured.png"),fit: BoxFit.cover,)
            ),
            SizedBox(height: 10,),
            Text(courseName,style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 20
            ),),
            Text("${studentsNumber} Students Enrolled",style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: 14
            ),),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
              ),
              onPressed: (){},
              child: Text("Enroll Now",style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 18
              ),)
            )

          ],
        ),
      ),
    );
  }
}
