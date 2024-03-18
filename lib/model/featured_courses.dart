class FeaturedCourses{
  String? courseName;
  int? studentsNumber;
  FeaturedCourses({required this.courseName,required this.studentsNumber});

  FeaturedCourses.fromFirestore(Map<String, dynamic> data){
    courseName = data["courseName"];
    studentsNumber = data["studentsNumber"];
  }

  Map<String , dynamic> toFirestore(){
    return {
      "courseName":courseName,
      "studentsNumber":studentsNumber
    };
  }
}