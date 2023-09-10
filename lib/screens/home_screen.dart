import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String fullName = "Chibueze Edeh";
  String slackUserName = "Flutter_chiboy";
  String gitHubUrl = "https://github.com/edwinchiboy";
  String personalBio =
      "I am a passionate flutter developer With over 2 years experience. i joined HNG internship just to try out new stuff, make new friends, show my skill and get to stage 10. I hope that I will fufil my reasons of joining HNG";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("HNG Second task "),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Text("Name : $fullName"),
                  const SizedBox(height: 20),
                  Text("Slack User Name : $slackUserName"),
                  const SizedBox(height: 20),
                  Text("Git Hub URL : $gitHubUrl"),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text("Personal Bio",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  Text(personalBio),
                ],
              ),
            ),
            const SizedBox(height: 80),
            Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EditProfileScreen())).then((value) {
                        if (value != null) {
                          final data = value;
                          setState(() {
                            fullName = data['name'] ?? "";
                            slackUserName = data['slackName'] ?? "";
                            gitHubUrl = data['githubUrl'] ?? "";
                            personalBio = data['personalBio'] ?? "";
                          });
                        }
                      });
                    },
                    child: const Text("Edit Profile")))
          ],
        ),
      ),
    );
  }
}
