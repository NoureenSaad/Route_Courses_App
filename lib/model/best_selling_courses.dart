class BestSellingCourses{
  String? courseName;
  int? studentsNumber;
  BestSellingCourses({required this.courseName,required this.studentsNumber});

  BestSellingCourses.fromFirestore(Map<String, dynamic> data){
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