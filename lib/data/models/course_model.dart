import 'package:json_annotation/json_annotation.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel {
  String? id;
  String name;
  String shortDescription;
  String fullDescription;
  int coursesAmount;

  CourseModel(
    this.id, {
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    required this.coursesAmount,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return _$CourseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CourseModelToJson(this);
  }
}
