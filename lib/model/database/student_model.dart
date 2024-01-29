class StudentModel {
  int? id;
  String? name;
  String? phoneNumber;
  String? department;

  StudentModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.department,
  });

  factory StudentModel.fromMap(Map<dynamic, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      department: json['department'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'department': department,
    };
  }
}
