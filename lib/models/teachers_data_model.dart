class TeacherDataModel {
  final String? email;
  final String? name;

  TeacherDataModel({this.email, this.name});

  factory TeacherDataModel.fromMap(Map data) {
    return TeacherDataModel(
      email: data['email'],
      name: data['name'],
    );
  }
}
