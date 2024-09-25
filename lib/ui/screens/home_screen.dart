import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/blocs/courses_bloc/courses_bloc.dart';
import 'package:test_task/ui/screens/course_detail_screen.dart';
import 'package:test_task/ui/widgets/add_course_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CoursesBloc>().add(GetCoursesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Courses"),
      ),
      body: BlocBuilder<CoursesBloc, CoursesState>(
        builder: (context, state) {
          if (state is CoursesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CoursesErrorState) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                ),
              ),
            );
          }
          if (state is CoursesLoadedState) {
            final courses = state.courses;
            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (contexxt, index) {
                final course = courses[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CourseDetailScreen(course: course),
                      ),
                    );
                  },
                  title: Text(
                    course.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  subtitle: Text(
                    course.shortDescription,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text("Data is not Loaded yet :("),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const AddCourseDialog();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
