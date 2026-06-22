class Course {
  String label;
  List<double> notes;

  Course({required this.label, required this.notes});

  double getAverage() {
    double average = notes.reduce((a, b) => a + b) / notes.length;
    print("La moyenne en $label est de $average");
    return average;
  }
}

void main() {
  List<Course> courses = [
    Course(label: "Maths", notes: [1, 3, 5, 18]),
    Course(label: "Informatique", notes: [13, 19, 16.5, 18]),
    Course(label: "Français", notes: [11, 13, 15, 8]),
  ];

  double average = getGlobalAverage(courses);

  print("La moyenne globale est $average");
}

double getGlobalAverage(List<Course> courses) {
  double globalAverage = 0;

  for (Course c in courses) {
    globalAverage += c.getAverage() / courses.length;
  }
  return globalAverage;
}
