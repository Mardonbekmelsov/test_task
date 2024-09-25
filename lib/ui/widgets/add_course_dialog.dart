import 'package:flutter/material.dart';
import 'package:test_task/blocs/courses_bloc/courses_bloc.dart';
import 'package:test_task/utils/app_constants.dart'; // Assuming this contains `spaceBox`
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCourseDialog extends StatefulWidget {
  const AddCourseDialog({super.key});

  @override
  State<AddCourseDialog> createState() => _AddCourseDialogState();
}

class _AddCourseDialogState extends State<AddCourseDialog> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final shortDescriptionController = TextEditingController();
  final fullDescriptionController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    shortDescriptionController.dispose();
    fullDescriptionController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<CoursesBloc>().add(
            AddCourseEvent(
              name: nameController.text,
              shortDescription: shortDescriptionController.text,
              fullDescription: fullDescriptionController.text,
              coursesAmount: int.parse(amountController.text),
            ),
          );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
        title: const Text("Add Course"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Course Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "You should enter the course name.";
                  }
                  return null;
                },
              ),
              spaceBox,
              TextFormField(
                controller: shortDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Short Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "You should enter a short description.";
                  }
                  return null;
                },
              ),
              spaceBox,
              TextFormField(
                controller: fullDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Full Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "You should enter a full description.";
                  }
                  return null;
                },
              ),
              spaceBox,
              TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Courses Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "You should enter the number of courses.";
                  }
                  if (int.parse(value) <= 0) {
                    return "Enter a positive number.";
                  }
                  return null;
                },
              ),
              spaceBox,
              ElevatedButton(
                onPressed: () {
                  _submit(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text("Add Course"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
