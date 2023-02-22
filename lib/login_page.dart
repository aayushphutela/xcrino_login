import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final deviceHieght = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Flexible(
                child: Container(
                  height: 400,
                  child: Image.asset(
                    'assets/images/xcrino.png',
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40,top: 15),
                      child: Text(
                        "Login",
                        style: GoogleFonts.akshar(
                            textStyle: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        )),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(

                              contentPadding: EdgeInsets.fromLTRB(30, 15, 20, 15),
                              hintText: "Username",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(22))),
                          autofocus: false,

                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Username Is Required");
                            }
                          },
                          // onSaved: (value) {
                          //   collegeEditingcontroller.text = value!;
                          // },
                          // textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22,right: 22),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(

                              contentPadding: EdgeInsets.fromLTRB(30, 15, 20, 15),
                              hintText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(22))),
                          autofocus: false,

                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Password Is Required");
                            }
                          },
                          // onSaved: (value) {
                          //   collegeEditingcontroller.text = value!;
                          // },
                          // textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(22),
            color: Colors.deepPurpleAccent,
            child: MaterialButton(
              onPressed: () {
                // signIn(emailController.text, passwordController.text);
              },
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              minWidth: MediaQuery.of(context).size.width,
              child: Text(
                'Sign In',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
                  // Container(
                  //   alignment: Alignment.bottomCenter,
                  //   height:140 ,
                  //   child: Image.asset(
                  //     'assets/images/line.png',
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
