import 'package:flutter/material.dart';

import '../../../style/app_colors.dart';

class BestSellingCourses extends StatelessWidget {
  String courseName;
  String studentsNumber;
  BestSellingCourses({super.key,required this.courseName,required this.studentsNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.smallLabelColor.withOpacity(0.1)
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(image: AssetImage("assets/images/bestSelling.png"),
            width: 50,),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(courseName,style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 15
                ),),
                Text("${studentsNumber} Students Enrolled",style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 12
                ),),
              ],
            ),
            SizedBox(width: 20,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                fixedSize: MaterialStateProperty.all(Size.infinite)
              ),
              onPressed: (){},
              child: Text("Join Now",style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 14
              ),)
            ),
          ],
        ),
      ),
    );
  }
}
