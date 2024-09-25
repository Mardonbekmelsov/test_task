part of "courses_bloc.dart";

sealed class CoursesEvent {}

class GetCoursesEvent extends CoursesEvent {}

class AddCourseEvent extends CoursesEvent {
  String name;
  String shortDescription;
  String fullDescription;
  int coursesAmount;

  AddCourseEvent({
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    required this.coursesAmount,
  });
}
