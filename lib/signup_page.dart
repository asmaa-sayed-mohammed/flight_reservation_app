import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  //name,phone,email,password
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final obscured = true.obs;
  var passObs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Create your new account", style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        ),
        body: Center(
          child: Card(
            elevation: 24,
            color: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                  child: SizedBox(width: Get.width * 0.7, height: 400,
                    child: Column(
                      spacing: 8,
                      children: [
                        buildTextField(nameController, "Enter your name..."),
                        buildTextField(emailController, "Enter your email..."),
                        buildTextField(phoneController, "Enter your phone..."),
                        buildPassTextField(),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: ElevatedButton(onPressed: () {
                            //insert in database
                            //Get.to(login)
                          },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orangeAccent
                              ),
                              child: Text("Submit", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),)),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        )

    );
  }

  Widget buildTextField(TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color: Colors.orange, width: 2),
          ),
        ),
      ),
    );
  }

  Widget buildPassTextField() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return TextField(
            controller: passwordController,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Enter your password",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                ),
                suffixIcon: IconButton(onPressed: () {
                  obscured.toggle();
                },
                    icon: Icon(obscured.value ? Icons.visibility_off : Icons.visibility, color: Colors.orange,))
            ),
            obscureText: obscured.value,
          );
        })
    );
  }
}
