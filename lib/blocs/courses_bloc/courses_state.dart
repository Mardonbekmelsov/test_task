part of 'courses_bloc.dart';

sealed class CoursesState {}

class CoursesInitialState extends CoursesState {}

class CoursesLoadingState extends CoursesState {}

class CoursesLoadedState extends CoursesState {
  List<CourseModel> courses;

  CoursesLoadedState({required this.courses});
}

class CoursesErrorState extends CoursesState {
  String errorMessage;
  CoursesErrorState({required this.errorMessage});
}
