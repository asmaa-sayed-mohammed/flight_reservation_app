import 'package:flutter/material.dart';


class HomePage extends StatelessWidget
{
    HomePage({super.key});

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
                children: [
                    Image.asset("assets/images/Travel_focus.png", fit: BoxFit.cover, width: double.infinity, height: 300,),
                    Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                    Colors.black, // أسود غامق تحت
                                    Colors.transparent,           // شفاف فوق
                                ],
                            ),
                        ),
                    ),
                    Center(
                        child: Text("Book  your  ticket  now!", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold, fontFamily: "Times New Roman"),)
                    ),
                    Positioned(
                        width: 500,
                        height: 900,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                              ElevatedButton(onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orangeAccent
                                  ),
                                  child: Text("Sign up",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)),
                              ElevatedButton(onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orangeAccent
                                  ),
                                  child: Text("Login",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)),
                          ],
                      ),
                    )
                ],
            ),
        );
    }
}
