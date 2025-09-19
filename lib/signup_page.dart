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
  final isCompleted = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Create your new account", style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),

        body: Center(
          child: Card(
            elevation: 24,
            color: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  child: SizedBox(width: Get.width * 0.7, height: 400,
                    child: Column(
                      spacing: 8,
                      children: [
                        buildTextField(nameController, "Enter your name..."),
                        buildTextField(emailController, "Enter your email..."),
                        buildTextField(phoneController, "Enter your phone..."),
                        buildPassTextField(),
                        Obx(() {
                          return ElevatedButton(onPressed: () {
                            if (isCompleted.value) {
                              //insert in database
                              //Get.to(login)
                            }
                            else {
                              Get.snackbar("empty information",
                                  "Please, fill information",
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  isDismissible: true);
                            }
                          },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: isCompleted.value ? Colors
                                      .orangeAccent : Colors.grey
                              ),
                              child: Text("Submit", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),));
                        })
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
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        controller: controller,
        onChanged: (a) {
          completed();
        },
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
            onChanged: (a) {
              completed();
            },
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
                    icon: Icon(
                      obscured.value ? Icons.visibility_off : Icons.visibility,
                      color: Colors.orange,))
            ),
            obscureText: obscured.value,
          );
        }
        )
    );
  }

  void completed() {
    isCompleted.value =
        passwordController.text.isNotEmpty && emailController.text.isNotEmpty &&
            nameController.text.isNotEmpty && phoneController.text.isNotEmpty;
  }
}
