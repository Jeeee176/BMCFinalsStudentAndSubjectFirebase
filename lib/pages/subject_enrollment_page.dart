import 'package:flutter/material.dart';

import 'verification_page.dart';

class SubjectEnrollmentPage extends StatefulWidget {
  final String name;
  final String section;
  final String course;

  const SubjectEnrollmentPage({
    super.key,
    required this.name,
    required this.section,
    required this.course,
  });

  @override
  State<SubjectEnrollmentPage> createState() =>
      _SubjectEnrollmentPageState();
}

class _SubjectEnrollmentPageState extends State<SubjectEnrollmentPage> {
  final _formKey = GlobalKey<FormState>();

  final _subject1Controller = TextEditingController();
  final _time1Controller = TextEditingController();

  final _subject2Controller = TextEditingController();
  final _time2Controller = TextEditingController();

  @override
  void dispose() {
    _subject1Controller.dispose();
    _time1Controller.dispose();
    _subject2Controller.dispose();
    _time2Controller.dispose();
    super.dispose();
  }

  void _goToVerification() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerificationPage(
          name: widget.name,
          section: widget.section,
          course: widget.course,
          subject1: _subject1Controller.text.trim(),
          time1: _time1Controller.text.trim(),
          subject2: _subject2Controller.text.trim(),
          time2: _time2Controller.text.trim(),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subject Enrollment'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Subject Enrollment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '${widget.name} • ${widget.section}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 32),

                  const Text(
                    'Subject 1',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextFormField(
                    controller: _subject1Controller,
                    decoration: _inputDecoration(
                      'Subject',
                      'Example: Database Management',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter Subject 1.';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _time1Controller,
                    decoration: _inputDecoration(
                      'Time',
                      'Example: 8:00 AM - 10:00 AM',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter the time for Subject 1.';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    'Subject 2',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextFormField(
                    controller: _subject2Controller,
                    decoration: _inputDecoration(
                      'Subject',
                      'Example: System Integration',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter Subject 2.';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _time2Controller,
                    decoration: _inputDecoration(
                      'Time',
                      'Example: 10:00 AM - 12:00 PM',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter the time for Subject 2.';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _goToVerification,
                      child: const Text(
                        'NEXT',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}