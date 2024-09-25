import 'package:bloc/bloc.dart';
import 'package:test_task/data/models/course_model.dart';
import 'package:test_task/data/services/course_services.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  CoursesBloc() : super(CoursesInitialState()) {
    on<GetCoursesEvent>(_onGetCourses);
    on<AddCourseEvent>(_onAddCourse);
  }

  final courseServices = CourseServices();

  Future<void> _onGetCourses(GetCoursesEvent event, emit) async {
    emit(CoursesLoadingState());

    try {
      final courses = await courseServices.getCourses();

      if (courses.isEmpty) {
        emit(CoursesErrorState(errorMessage: "No courses found"));
      } else {
        emit(CoursesLoadedState(courses: courses));
      }
    } catch (error) {
      emit(CoursesErrorState(errorMessage: error.toString()));
    }
  }

  Future<void> _onAddCourse(AddCourseEvent event, emit) async {
    emit(CoursesLoadingState());

    try {
      await courseServices.addCourse(
        event.name,
        event.shortDescription,
        event.fullDescription,
        event.coursesAmount,
      );

      add(GetCoursesEvent());
    } catch (error) {
      emit(CoursesErrorState(errorMessage: error.toString()));
    }
  }
}
