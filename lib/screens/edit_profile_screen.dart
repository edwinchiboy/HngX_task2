import 'package:flutter/material.dart';

import 'package:hng_stage2_task/models/CvModel.dart';
import 'package:hng_stage2_task/widgets/text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode nameFieldNode = FocusNode();
  FocusNode slackNameFieldNode = FocusNode();
  FocusNode gitNameFieldNode = FocusNode();
  FocusNode personalBioNameFieldNode = FocusNode();
  CvModel userCv = CvModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Edit profile screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SharedTextInput(
                        title: "Name",
                        hintText: "Chiboy Edeh",
                        focusNode: nameFieldNode,
                        onEditingComplete: () =>
                            slackNameFieldNode.requestFocus(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Please fill the textfield");
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        onChanged: (final String text) {
                          userCv.setName = text;
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    SharedTextInput(
                        title: "Slack Name ",
                        hintText: "Flutter_Chiboy",
                        focusNode: slackNameFieldNode,
                        onEditingComplete: () =>
                            gitNameFieldNode.requestFocus(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Please fill the textfield");
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        onChanged: (final String text) {
                          userCv.setSlackName = text;
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    SharedTextInput(
                        title: "GitHub URL ",
                        hintText: "Github.com/chiboy",
                        focusNode: gitNameFieldNode,
                        onEditingComplete: () =>
                            personalBioNameFieldNode.requestFocus(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Please fill the textfield");
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        onChanged: (final String text) {
                          userCv.setGithubUrl = text;
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    SharedTextInput(
                        title: "Personal Bio",
                        hintText: "Personal bio",
                        maxLine: 8,
                        focusNode: personalBioNameFieldNode,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Please fill the textfield");
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        onChanged: (final String text) {
                          userCv.setPersonalBio = text;
                        })
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () {
                      _proceedWithUpdatingHomeScreen();
                    },
                    child: const Text("Save Profile")))
          ],
        ),
      ),
    );
  }

  void _proceedWithUpdatingHomeScreen() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.pop(context, userCv.toJson());
    }
  }
}
