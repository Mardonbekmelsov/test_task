import 'package:flutter/material.dart';
import 'package:test_task/data/models/course_model.dart';
import 'package:test_task/utils/app_constants.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Course Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Course name: ${course.name}",
              style: detailStyle,
            ),
            spaceBox,
            Text(
              "Short Description: ${course.shortDescription}",
              style: detailStyle,
            ),
            spaceBox,
            Text(
              "Full Description: ${course.fullDescription}",
              style: detailStyle,
            ),
            spaceBox,
            Text(
              "Amount of Courses: ${course.coursesAmount}",
              style: detailStyle,
            ),
          ],
        ),
      ),
    );
  }
}
