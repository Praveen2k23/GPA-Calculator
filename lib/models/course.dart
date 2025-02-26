class Course {
  String name;
  int credits;
  String grade;

  Course({
    required this.name,
    required this.credits,
    required this.grade,
  });

  double get gradePoint {
    switch (grade.toUpperCase()) {
      case 'A+':
      case 'A':
        return 4;
      case 'A-':
        return 3.7;
      case 'B+':
        return 3.3;
      case 'B':
        return 3;
      case 'B-':
        return 2.7;
      case 'C+':
        return 2.3;
      case 'C':
        return 2;
      case 'C-':
        return 1.7;
      case 'D+':
        return 1.3;
      case 'D':
        return 1;
      case 'E':
        return 0;
      default:
        return 0;
    }
  }
}