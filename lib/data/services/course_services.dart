// import 'package:dio/dio.dart';
// import 'package:test_task/data/models/course_model.dart';

// class CourseServices {
//   final dio = Dio();

//   Future<List<CourseModel>> getCourses() async {
//     try {
//       print("getting courses");
//       final response = await dio.get(
//         "https://course-test-project-456b7-default-rtdb.firebaseio.com/courses.json",
//       );
//       print(response);
//       if (response.statusCode == 200) {
//         List<CourseModel> loadedCourses = [];

//         response.data.forEach((key, value) {
//           value['id'] = key;
//           loadedCourses.add(CourseModel.fromJson(value));
//         });

//         return loadedCourses;
//       } else {
//         throw "Failed to load courses";
//       }
//     } on DioException catch (error) {
//       throw error.message.toString();
//     } catch (error) {
//       rethrow;
//     }
//   }

//   Future<void> addCourse(String name, String shortDescription,
//       String fullDescription, int coursesAmount) async {
//     try {
//       final response = await dio.post(
//         "https://course-test-project-456b7-default-rtdb.firebaseio.com/courses.json",
//         data: {
//           'name': name,
//           'shortDescription': shortDescription,
//           'fullDescription': fullDescription,
//           'courseAmount': coursesAmount
//         },
//       );

//       if (response.statusCode != 200 && response.statusCode != 201) {
//         throw "Failed to add course";
//       }
//     } on DioException catch (error) {
//       throw error.message.toString();
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:test_task/data/models/course_model.dart';

class CourseServices {
  final dio = Dio();

  Future<List<CourseModel>> getCourses() async {
    try {
      final response = await dio.get(
        "https://course-test-project-456b7-default-rtdb.firebaseio.com/courses.json",
      );

      if (response.statusCode == 200 && response.data != null) {
        List<CourseModel> loadedCourses = [];

        // Firebase typically returns a map, ensure correct handling of the data
        final data = response.data as Map<String, dynamic>;
        data.forEach((key, value) {
          value['id'] = key; // Assign Firebase key as the course ID
          loadedCourses.add(CourseModel.fromJson(value));
        });

        return loadedCourses;
      } else {
        throw "Failed to load courses";
      }
    } on DioException catch (error) {
      throw error.message.toString();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addCourse(String name, String shortDescription,
      String fullDescription, int coursesAmount) async {
    try {
      final response = await dio.post(
        "https://course-test-project-456b7-default-rtdb.firebaseio.com/courses.json",
        data: {
          'name': name,
          'shortDescription': shortDescription,
          'fullDescription': fullDescription,
          'coursesAmount': coursesAmount
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {
        throw "Failed to add course";
      }
    } on DioException catch (error) {
      throw error.message.toString();
    } catch (e) {
      rethrow;
    }
  }
}
