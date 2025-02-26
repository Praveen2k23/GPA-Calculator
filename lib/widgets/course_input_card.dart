import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseInputCard extends StatefulWidget {
  final int index;
  final Course course;
  final Function(Course) onSaved;
  final VoidCallback onRemove;

  const CourseInputCard({
    super.key,
    required this.index,
    required this.course,
    required this.onSaved,
    required this.onRemove,
  });

  @override
  State<CourseInputCard> createState() => _CourseInputCardState();
}

class _CourseInputCardState extends State<CourseInputCard> {
  String selectedGrade = 'A';
  final List<String> gradeOptions = [
    'A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'E'
  ];

  @override
  void initState() {
    super.initState();
    selectedGrade = widget.course.grade;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Course ${widget.index + 1}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.highlight_remove_sharp, color: Colors.red),
                  onPressed: widget.onRemove,
                  tooltip: 'Remove course',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: widget.course.name,
              decoration: const InputDecoration(
                labelText: 'Course Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                filled: true,
                fillColor: Color(0xFFF7F7F7),
              ),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter course name' : null,
              onSaved: (value) {
                widget.course.name = value ?? '';
                widget.onSaved(widget.course);
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Credit',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      TextFormField(
                        initialValue: widget.course.credits > 0 ? widget.course.credits.toString() : '',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF7F7F7),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          final credits = int.tryParse(value);
                          if (credits == null || credits <= 0) {
                            return 'Invalid';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          widget.course.credits = int.tryParse(value ?? '0') ?? 0;
                          widget.onSaved(widget.course);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Grade',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8.0),
                          color: const Color(0xFFF7F7F7),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: selectedGrade,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 12),
                            border: InputBorder.none,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedGrade = newValue!;
                              widget.course.grade = newValue;
                              widget.onSaved(widget.course);
                            });
                          },
                          items: gradeOptions.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onSaved: (value) {
                            widget.course.grade = value ?? 'A';
                            widget.onSaved(widget.course);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}