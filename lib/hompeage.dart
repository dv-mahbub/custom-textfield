import 'dart:async';

import 'package:custom_textfield/custom_text_field.dart';
import 'package:flutter/material.dart';

class Hompeage extends StatefulWidget {
  const Hompeage({super.key});

  @override
  State<Hompeage> createState() => _HompeageState();
}

class _HompeageState extends State<Hompeage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom TextField'),
      ),
      // backgroundColor: Colors.green,
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid string';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // If the form is valid, show a snackbar or perform any action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form is valid!')),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
