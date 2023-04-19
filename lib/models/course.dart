class Course {
  final String name;
  final String imageUrl;
  final String about;

  Course(this.name, this.imageUrl, this.about);

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      json['name'] as String,
      json['course_image'] as String,
      json['about'] as String,
    );
  }
}
