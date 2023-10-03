import 'package:flutter/material.dart';
import 'payment.dart';
import 'promopage.dart';
import 'paymentmethod.dart';
import 'paymentconfirm.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentPage(),
    );
  }
}

class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });

    return Scaffold(
        backgroundColor: Color(0xff7259cb),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img1.png'),
            ],
          ),
        ),
      );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isEmailEmpty = false;
  bool isPasswordEmpty = false;

  void login(BuildContext context) {
    String enteredEmail = emailController.text.trim();
    String enteredPassword = passwordController.text.trim();

    if (enteredEmail == 'keziafoe@gmail.com' && enteredPassword == 'keziafoe') {
      // Login successful
      // For now, navigate back to the WelcomePage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      // Incorrect
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Incorrect email or password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void validateFields() {
    setState(() {
      isEmailEmpty = emailController.text.trim().isEmpty;
      isPasswordEmpty = passwordController.text.trim().isEmpty;
    });

    if (!isEmailEmpty && !isPasswordEmpty) {
      login(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 50.0),
                            child: Image.asset('assets/img2.png'),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto-Regular',
                              ),
                            ),
                          ),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                            ),
                          ),
                          Visibility(
                            visible: isEmailEmpty,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "*Email must be filled.",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto-Regular',
                                ),
                              ),
                            ),
                          ),
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                            obscureText: true,
                          ),
                          Visibility(
                            visible: isPasswordEmpty,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "*Password must be filled.",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto-Regular',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25.0),
                          ElevatedButton(
                            child: Text('Sign In'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
                              backgroundColor: Color(0xff7259cb),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              validateFields();
                            },
                          ),
                          SizedBox(height: 20.0),
                          Align(
                            child: Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto-Regular',
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                child: Row(
                                  children: [
                                    Image.asset('assets/img49.png'),
                                    SizedBox(width: 10),
                                    Text(
                                      "Sign In With Google",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto-Regular',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                      color: Color(0xFF5541D4),
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  // Google API?
                                },
                              ),
                              SizedBox(width: 5),
                              ElevatedButton(
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto-Regular',
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                                  backgroundColor: Color(0xff7259cb),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                      color: Color(0xff7259cb),
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();

  void checkRegisteredPass(BuildContext context) {
    String enteredEmail = emailController.text.trim();
    String enteredPassword = passwordController.text.trim();
    String reenteredPassword = repasswordController.text.trim();

    if (enteredPassword == reenteredPassword) {
      if (enteredPassword.isNotEmpty && reenteredPassword.isNotEmpty) {
        // Login successful
        // For now, navigate back to the WelcomePage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterPageSuccess(),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Create New Account Failed'),
            content: Text('Password and Confirm Password must be filled.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Create New Account Failed'),
          content: Text('Mismatch Password and Confirm Password'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 50.0),
                                  child: Image.asset('assets/img4.png'),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                ),
                                TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                  ),
                                ),
                                TextField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                  ),
                                  obscureText: true,
                                ),
                                TextField(
                                  controller: repasswordController,
                                  decoration: InputDecoration(
                                    labelText: 'Confirm Password',
                                  ),
                                  obscureText: true,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "*Password and Confirm Password must be filled.",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25.0),
                                ElevatedButton(
                                  child: Text('Create Account'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 80.0, vertical: 15.0),
                                    backgroundColor: Color(0xff7259cb),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    checkRegisteredPass(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class RegisterPageSuccess extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),        
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 150.0),
              child: Image.asset('assets/img3.png'),
            ),

            Align(
              child: Text(
                "Congrats!!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),

            Align(
              child: Text(
                "Your account successfully to created",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
            ),

            SizedBox(height: 25.0),

            ElevatedButton(
              child: Text('Sign In'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 140.0, vertical: 15.0),
                backgroundColor: Color(0xff7259cb),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => LoginPage(),
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

class ForgotPass extends StatelessWidget{
  final TextEditingController emailController = TextEditingController();
  
  void emailcheck(BuildContext context){
    String enteredEmail = emailController.text.trim();

    if (enteredEmail == 'keziafoe@gmail.com'){
      //Login successfull
      //For now, go to forgot pass Message
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ForgotPassMessage(),
        ),
      );
    } else{
      //Incorrect
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Request Email Failed'),
          content: Text('Email is not found.'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),        
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.0),        
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 50.0),
                                    child: Image.asset('assets/img4.png'),
                                  ),

                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Forgot Password",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto-Regular',
                                      ),
                                    ),
                                  ),

                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Enter your email and we'll send you a link to change your password.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto-Regular',
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                  ),

                                  TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                    ),
                                  ),

                                  

                                  SizedBox(height: 25.0),
                                  ElevatedButton(
                                    child: Text('Reset My Password'),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
                                      backgroundColor: Color(0xff7259cb),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                      ),
                                    ),
                                    onPressed: () {
                                      emailcheck(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ], 
          ),
        ),
      );
  }
}

class ForgotPassMessage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),        
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 150.0),
              child: Image.asset('assets/img5.png'),
            ),

            Align(
              child: Text(
                "Please check yout email to continue the password change process",
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0),
            ),

            ElevatedButton(
              child: Text('Go to Login Page'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
                backgroundColor: Color(0xff7259cb),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => SetNewPass(),
                  ),
                );
              },
            ),



          ],
        ),
      ),
    );
  }
}


class SetNewPass extends StatelessWidget{
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController rePassController = TextEditingController();

  void checkNewPass(BuildContext context){
    String enteredNewPass = newPassController.text.trim();
    String enteredRePass = rePassController.text.trim();

    if (enteredNewPass == enteredRePass){
      //Login successfull
      //For now, navigate to ChangeSuccess
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeSuccess(),
        ),
      );
      
    } else{
      //Incorrect
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Change Password Failed'),
          content: Text('Mismatch between New Password and Reinput New Password.'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),        
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.0),        
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(16.0),        
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 50.0),
                                          child: Image.asset('assets/img4.png'),
                                        ),

                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Forgot Password",
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Roboto-Regular',
                                            ),
                                          ),
                                        ),

                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Enter your new password.",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Roboto-Regular',
                                            ),
                                          ),
                                        ),

                                        TextField(
                                          controller: newPassController,
                                          decoration: InputDecoration(
                                            labelText: 'New Password',
                                          ),
                                          obscureText: true,
                                        ),

                                        TextField(
                                          controller: rePassController,
                                          decoration: InputDecoration(
                                            labelText: 'Reinput New Password',
                                          ),
                                          obscureText: true,
                                        ),

                                        SizedBox(height: 25.0),

                                        ElevatedButton(
                                          child: Text('Change Password'),
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                                            backgroundColor: Color(0xff7259cb),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                            ),
                                          ),
                                          onPressed: () {
                                            checkNewPass(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ], 
          ),
        ),
    );
  }
}

class ChangeSuccess extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),        
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 150.0),
                child: Image.asset('assets/img3.png'),
              ),

              Align(
                child: Text(
                  "Congrats!!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto-Regular',
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),

              Align(
                child: Text(
                  "Your account successfully to created",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto-Regular',
                  ),
                ),
              ),

              SizedBox(height: 25.0),

              ElevatedButton(
                child: Text('Sign In'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 140.0, vertical: 15.0),
                  backgroundColor: Color(0xff7259cb),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                  
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),

                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              width: 50.0, // Set the width based on the image width
                              height: 50.0, // Set the height based on the image height
                              child: ElevatedButton(
                                child: Image.asset(
                                  'assets/img37.png',
                                  width: 25.0,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white, // Use 'primary' instead of 'backgroundColor' for ElevatedButton
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FeedBackPage(),
                                    ),
                                  );
                                },
                              ),
                            ),

                            Container(
                              width: 225.0,
                              height: 50.0,
                              child: ElevatedButton(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/img38.png',
                                      width: 25.0,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      'WEST JAKARTA',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NearestPage(),
                                    ),
                                  );
                                },
                              ),
                            ),


                            Container(
                              width: 50.0, // Set the width based on the image width
                              height: 50.0, // Set the height based on the image height
                              child: ElevatedButton(
                                child: Image.asset(
                                  'assets/img36.png',
                                  width: 25.0,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white, // Use 'primary' instead of 'backgroundColor' for ElevatedButton
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NotificationPage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),

                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "RATING TERTINGGI",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),
                      
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: ElevatedButton(
                                  child: Image.asset('assets/img29.jpg', width: 250.0),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HighRate(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: ElevatedButton(
                                  child: Image.asset('assets/img32.jpg', width: 250.0),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HighRate(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                        
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "CATEGORY",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // Set the shadow color
                                      spreadRadius: 2, // Set the spread radius of the shadow
                                      blurRadius: 5, // Set the blur radius of the shadow
                                      offset: Offset(0, 3), // Set the offset of the shadow
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  child: Image.asset('assets/img11.png'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BasketCategory(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // Set the shadow color
                                      spreadRadius: 2, // Set the spread radius of the shadow
                                      blurRadius: 5, // Set the blur radius of the shadow
                                      offset: Offset(0, 3), // Set the offset of the shadow
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: 10.0), // Add some horizontal spacing between buttons
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // Set the shadow color
                                      spreadRadius: 2, // Set the spread radius of the shadow
                                      blurRadius: 5, // Set the blur radius of the shadow
                                      offset: Offset(0, 3), // Set the offset of the shadow
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  child: Image.asset('assets/img12.png'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MiniSoccerCategory(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0), // Add some horizontal spacing between buttons
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // Set the shadow color
                                      spreadRadius: 2, // Set the spread radius of the shadow
                                      blurRadius: 5, // Set the blur radius of the shadow
                                      offset: Offset(0, 3), // Set the offset of the shadow
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  child: Image.asset('assets/img13.png'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BadmintonCategory(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            

                            SizedBox(width: 10.0), // Add some horizontal spacing between buttons
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // Set the shadow color
                                      spreadRadius: 2, // Set the spread radius of the shadow
                                      blurRadius: 5, // Set the blur radius of the shadow
                                      offset: Offset(0, 3), // Set the offset of the shadow
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "EVENT",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: ElevatedButton(
                                  child: Image.asset('assets/img9.png'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Minisoe(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: ElevatedButton(
                                  child: Image.asset('assets/img10.png'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Polinema(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ], 
                  ),
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(              
                builder: (context) => ChatListPage(),
              ),
            );
          },
          tooltip: 'Chat',
          backgroundColor: Color(0xff7259cb),          
          child: const Icon(Icons.chat),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('assets/img16.png'),
                  onPressed: () {
                    // Aksi saat tombol home ditekan
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img17.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Promo(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img18.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => History(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img19.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class BasketCategory extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar : AppBar(
        title: Text('Available Fields'),
        backgroundColor: Color(0xff7259cb),
        elevation: 4.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [                                                        
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(              
                                  builder: (context) => CKMSportsCenter(),
                                ),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 5.0),
                          
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/img29.jpg',
                              width: 125.0, // Set the desired image width
                               // Set the desired image height
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CKM Sports Center',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Sport  : Basket, Mini Soccer',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Location  : Karawang',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Open  : 07:00-18:00 WIB',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(194, 194, 194, 0.494),
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      padding: EdgeInsets.only(left: 3.0, right: 3.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(width: 4.0),
                                          Text(
                                            '4.5/5',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: 32.0),
                                    Text(
                                      '50.000/jam',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(              
                                  builder: (context) => RIBENSSportsCenter(),
                                ),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 5.0),
                          
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/img32.jpg',
                              width: 125.0, // Set the desired image width
                               // Set the desired image height
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'RIBENS Sports Center',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Sport  : Basket, Mini Soccer',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Location  : Jakarta Selatan',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Open  : 09:00-21:00 WIB',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(194, 194, 194, 0.494),
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      padding: EdgeInsets.only(left: 3.0, right: 3.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(width: 4.0),
                                          Text(
                                            '5/5',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: 32.0),
                                    Text(
                                      '250.000/jam',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                
                              ],
                            ),
                          ],
                        ),
                      ),
                    ], 
                  ),
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(              
                builder: (context) => ChatListPage(),
              ),
            );
          },
          tooltip: 'Chat',
          backgroundColor: Color(0xff7259cb),          
          child: const Icon(Icons.chat),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('assets/img16.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img17.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Promo(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img18.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => History(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img19.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class HighRate extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('High Rate', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [                                                        
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(              
                                  builder: (context) => CKMSportsCenter(),
                                ),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 5.0),
                          
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/img29.jpg',
                              width: 125.0, // Set the desired image width
                               // Set the desired image height
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CKM Sports Center',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Sport  : Basket, Mini Soccer',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Location  : Karawang',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Open  : 07:00-18:00 WIB',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(194, 194, 194, 0.494),
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      padding: EdgeInsets.only(left: 3.0, right: 3.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(width: 4.0),
                                          Text(
                                            '4.5/5',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: 32.0),
                                    Text(
                                      '50.000/jam',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(              
                                  builder: (context) => RIBENSSportsCenter(),
                                ),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 5.0),
                          
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/img32.jpg',
                              width: 125.0, // Set the desired image width
                               // Set the desired image height
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'RIBENS Sports Center',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Sport  : Basket, Mini Soccer',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Location  : Jakarta Selatan',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Open  : 09:00-21:00 WIB',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(194, 194, 194, 0.494),
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      padding: EdgeInsets.only(left: 3.0, right: 3.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(width: 4.0),
                                          Text(
                                            '5/5',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: 32.0),
                                    Text(
                                      '250.000/jam',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                
                              ],
                            ),
                          ],
                        ),
                      ),
                    ], 
                  ),
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(              
                builder: (context) => ChatListPage(),
              ),
            );
          },
          tooltip: 'Chat',
          backgroundColor: Color(0xff7259cb),          
          child: const Icon(Icons.chat),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('assets/img16.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img17.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Promo(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img18.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => History(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img19.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class Dis70 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('DISC. UP TP 70%', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/img23.png'),
            ),

            Padding(
              padding: EdgeInsets.only(top: 25.0),
            ),

            Container(
              alignment: Alignment.topLeft,
              width: 275.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(225, 225, 225, 0.498),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Term and conditions: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Regular',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    child: Text(
                      "1. Make sure you are a new user",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto-Regular',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      "2. Make sure you use promos with partners who have worked together.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto-Regular',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      "3. This promo cannot be cashed.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto-Regular',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      "4. This promo only applies to purchases via the application.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto-Regular',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      "5. Promo will enter after 4-7 working days from the order is completed.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto-Regular',
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                  ),
                ],
              ),
            ),

            

          ],
        ),
      ),
    );
  }
}

class ChatStevanus extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('MINISOE CUP', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: Image.asset('assets/img42.png'),
        ),
      ),
    );
  }
}

class RIBLap1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('RIBENS SPORTS CENTER', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
            child: Image.asset('assets/img32.jpg'),
          ),
        ),
      ),
    );
  }
}

class RIBLap2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('RIBENS SPORTS CENTER', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
            child: Image.asset('assets/img33.jpg'),
          ),
        ),
      ),
    );
  }
}

class RIBLap3 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('RIBENS SPORTS CENTER', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
            child: Image.asset('assets/img34.jpg'),
          ),
        ),
      ),
    );
  }
}

class AllReviewCKM extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('CKM SPORTS CENTER', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Add 16.0 padding to all sides
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Image.asset(
                    'assets/img25.png',
                    width: 50.0,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Stevanus",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                        Text(
                          "Lapangan bersih, harga rakyat, penjaga ramah",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              width: 320,
              height: 3,
              color: Color.fromRGBO(201, 201, 201, 0.494),
            ),
            SizedBox(height: 5.0),
            Container(
              child: Row(
                children: [
                  Image.asset(
                    'assets/img25.png',
                    width: 50.0,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sam",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                        Text(
                          "Bersih, terawat, tapi lantainya licin banget",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Container(
                        width: 320,
                        height: 3,
                        color: Color.fromRGBO(201, 201, 201, 0.494) 
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),
            SizedBox(height: 20.0),
          ],
        ),

      ),
    );
  }
}

class AllReviewRIB extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('RIBENS SPORTS CENTER', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Add 16.0 padding to all sides
        child: Column(
          children: [
            Container(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.0), // Adjust the value to control the roundness
                              child: Image.asset(
                                'assets/img44.jpg',
                                width: 50.0,
                              ),
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "John",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Fasilitasnya lengkap, mantap.",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Container(
                        width: 320,
                        height: 3,
                        color: Color.fromRGBO(201, 201, 201, 0.494) 
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),


                      Container(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.0), // Adjust the value to control the roundness
                              child: Image.asset(
                                'assets/img43.jpg',
                                width: 50.0,
                              ),
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jane",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Lapangannya bagus, terawat. Sudah langganan disini",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Container(
                        width: 320,
                        height: 3,
                        color: Color.fromRGBO(201, 201, 201, 0.494) 
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),
            SizedBox(height: 20.0),
          ],
        ),

      ),
    );
  }
}

class CKMLap1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('CKM SPORTS CENTER', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
            child: Image.asset('assets/img29.jpg'),
          ),
        ),
      ),
    );
  }
}

class CKMLap2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('CKM SPORTS CENTER', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
            child: Image.asset('assets/img30.jpg'),
          ),
        ),
      ),
    );
  }
}

class CKMLap3 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('CKM SPORTS CENTER', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
            child: Image.asset('assets/img31.jpg'),
          ),
        ),
      ),
    );
  }
}


class Minisoe extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('MINISOE CUP', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: Image.asset('assets/img42.png'),
        ),
      ),
    );
  }
}

class Polinema extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('POLINEMA BASKET', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: Image.asset('assets/img41.png'),
        ),
      ),

      );
  }
}

class CKMSportsCenter extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('CKM SPORTS CENTER', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                          child: Image.asset('assets/img29.jpg'),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 25,
                            color: Color(0xFF5541D4),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Jl. Perum Citra Kebun Mas, Bengle, Kec. Majalaya, Karawang, Jawa Barat 41371",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto-Regular',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            "Rp 50.000 / Jam",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto-Regular',
                            ),
                          ),
                          SizedBox(width: 100),
                          ElevatedButton(
                            child: Image.asset(
                                'assets/img35.png',
                                width: 50.0,
                              ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(              
                                  builder: (context) => MutualFriends2(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Foto Lapangan",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: ElevatedButton(
                                  child: Image.asset('assets/img29.jpg', width: 200.0),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CKMLap1(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: ElevatedButton(
                                  child: Image.asset('assets/img30.jpg', width: 200.0),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CKMLap2(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: ElevatedButton(
                                  child: Image.asset('assets/img31.jpg', width: 200.0),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CKMLap3(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                      

                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Deskripsi",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),
                        
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "CKM Sports Center merupakan fasilitas olahraga multifungsi semi outdoor yang terletak di CKM City, Bengle, Majalaya Kabupaten Karawang. Kami menyediakan lapangan Futsal, Basket dan Voli di CKM Sports Center. Lapangan dilengkapi dengan fasilitas toilet, serta ruang ganti dan ruang bilas yang memadai. Area parkir mobil & motor. No Refund & Reschedule. Penggunaan jam waktu sewa lapangan harus sesuai dengan pemesanan yang telah dilakukan oleh penyewa​​​​​​. Protokol Kesehatan harus dijaga secara baik",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),

                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Ulasan",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto-Regular',
                              ),
                            ),
                          ),
                          SizedBox(width: 143),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllReviewCKM(),
                                ),
                              );
                            },
                            child: Text(
                              "LIHAT SEMUA ULASAN",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto-Regular',
                                color: Color(0xFF5541D4),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(width: 4.0), // Add some space between the icon and text
                          Text(
                            '4.5/5 (2 Ulasan)',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/img25.png',
                              width: 50.0,
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Stevanus",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Lapangan bersih, harga rakyat, penjaga ramah",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Container(
                        width: 320,
                        height: 3,
                        color: Color.fromRGBO(201, 201, 201, 0.494) 
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/img25.png',
                              width: 50.0,
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sam",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Bersih, terawat, tapi lantainya licin banget",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),

                      ElevatedButton(
                        child: Text('Pesan Sekarang'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
                          backgroundColor: Color(0xff7259cb),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(              
                              builder: (context) => PesanLapangan(),
                            ),
                          );
                        },
                      ),
                    ], 
                  ),
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(              
                builder: (context) => ChatListPage(),
              ),
            );
          },
          tooltip: 'Chat',
          backgroundColor: Color(0xff7259cb),          
          child: const Icon(Icons.chat),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('assets/img16.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img17.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Promo(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img18.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => History(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img19.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class RIBENSSportsCenter extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('RIBENS SPORTS CENTER', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                          child: Image.asset('assets/img32.jpg'),
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 25,
                            color: Color(0xFF5541D4),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Jl. RS Fatmawati No. 188 Gandaria Selatan, Cilandak Jakarta Selatan 12420",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto-Regular',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      

                      Row(
                        children: [
                          Text(
                            "Rp 250.000 / Jam",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto-Regular',
                            ),
                          ),
                          SizedBox(width: 90),
                          ElevatedButton(
                            child: Image.asset(
                                'assets/img35.png',
                                width: 50.0,
                              ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(              
                                  builder: (context) => MutualFriends(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Foto Lapangan",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: ElevatedButton(
                                  child: Image.asset('assets/img32.jpg', width: 200.0),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RIBLap1(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: ElevatedButton(
                                  child: Image.asset('assets/img33.jpg', width: 200.0),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RIBLap2(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: ElevatedButton(
                                  child: Image.asset('assets/img34.jpg', width: 200.0),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RIBLap3(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Deskripsi",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),
                        
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "RIBENS Sports Center merupakan fasilitas olahraga multifungsi semi outdoor yang terletak di Fatmawati, Jakarta Selatan. Kami menyediakan lapangan semi outdoor Bulutangkis, Indoor Basket dan Futsal. Lapangan dilengkapi dengan fasilitas toilet, serta ruang ganti, ruang bilas, musholla yang memadai, Coffee Shop. Area parkir mobil & motor luas. No Refund & Reschedule. Penggunaan jam waktu sewa lapangan harus sesuai dengan pemesanan yang telah dilakukan oleh penyewa​​​​​​. Protokol Kesehatan harus dijaga secara baik",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),

                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Ulasan",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto-Regular',
                              ),
                            ),
                          ),
                          SizedBox(width: 143),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllReviewRIB(),
                                ),
                              );
                            },
                            child: Text(
                              "LIHAT SEMUA ULASAN",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto-Regular',
                                color: Color(0xFF5541D4),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(width: 4.0), // Add some space between the icon and text
                          Text(
                            '5/5 (2 Ulasan)',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.0), // Adjust the value to control the roundness
                              child: Image.asset(
                                'assets/img44.jpg',
                                width: 50.0,
                              ),
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "John",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Fasilitasnya lengkap, mantap.",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Container(
                        width: 320,
                        height: 3,
                        color: Color.fromRGBO(201, 201, 201, 0.494) 
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),


                      Container(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.0), // Adjust the value to control the roundness
                              child: Image.asset(
                                'assets/img43.jpg',
                                width: 50.0,
                              ),
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jane",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Lapangannya bagus, terawat. Sudah langganan disini",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),

                      ElevatedButton(
                        child: Text('Pesan Sekarang'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
                          backgroundColor: Color(0xff7259cb),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(              
                              builder: (context) => PesanLapangan(),
                            ),
                          );
                        },
                      ),
                    ], 
                  ),
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(              
                builder: (context) => ChatListPage(),
              ),
            );
          },
          tooltip: 'Chat',
          backgroundColor: Color(0xff7259cb),          
          child: const Icon(Icons.chat),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('assets/img16.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img17.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Promo(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img18.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => History(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img19.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class MutualFriends extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Mutual Friends', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                          child: Image.asset('assets/img32.jpg'),
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "RIBENS SPORTS CENTER",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),

                      Container(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.0), // Adjust the value to control the roundness
                              child: Image.asset(
                                'assets/img44.jpg',
                                width: 50.0,
                              ),
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "John",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        child: Text('Message', style: TextStyle(color: Colors.black),),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(              
                                              builder: (context) => ChatListPage(),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(width: 5),
                                      ElevatedButton(
                                        child: Text('Add Friend'),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
                                          backgroundColor: Color(0xff7259cb),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                          ),
                                        ),
                                        onPressed: () {
                                          
                                        },
                                      ),
                                    ],
                                  ),
                                  
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Container(
                        width: 320,
                        height: 3,
                        color: Color.fromRGBO(201, 201, 201, 0.494)
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Container(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.0), // Adjust the value to control the roundness
                              child: Image.asset(
                                'assets/img43.jpg',
                                width: 50.0,
                              ),
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jane",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        child: Text('Message', style: TextStyle(color: Colors.black),),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(              
                                              builder: (context) => ChatListPage(),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(width: 5),
                                      ElevatedButton(
                                        child: Text('Add Friend'),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
                                          backgroundColor: Color(0xff7259cb),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                          ),
                                        ),
                                        onPressed: () {
                                          
                                        },
                                      ),
                                    ],
                                  ),
                                  
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Container(
                        width: 320,
                        height: 3,
                        color: Color.fromRGBO(201, 201, 201, 0.494)
                      ),
                    
                      
                    ], 
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

class MutualFriends2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Mutual Friends', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                          child: Image.asset('assets/img29.jpg'),
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "CKM SPORTS CENTER",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),

                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/img25.png',
                              width: 50.0,
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Stevanus",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        child: Text('Message', style: TextStyle(color: Colors.black),),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(              
                                              builder: (context) => ChatListPage(),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(width: 5),
                                      ElevatedButton(
                                        child: Text('Add Friend'),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
                                          backgroundColor: Color(0xff7259cb),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                          ),
                                        ),
                                        onPressed: () {
                                          
                                        },
                                      ),
                                    ],
                                  ),
                                  
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Container(
                        width: 320,
                        height: 3,
                        color: Color.fromRGBO(201, 201, 201, 0.494) 
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/img25.png',
                              width: 50.0,
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sam",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        child: Text('Message', style: TextStyle(color: Colors.black),),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(              
                                              builder: (context) => ChatListPage(),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(width: 5),
                                      ElevatedButton(
                                        child: Text('Add Friend'),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
                                          backgroundColor: Color(0xff7259cb),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                          ),
                                        ),
                                        onPressed: () {
                                          
                                        },
                                      ),
                                    ],
                                  ),
                                  
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Container(
                        width: 320,
                        height: 3,
                        color: Color.fromRGBO(201, 201, 201, 0.494) 
                      ),
                      
                    ], 
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}


class PesanLapangan extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Payment', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 150.0),
            ),
            
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "LAPANGAN BASKET",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PilihPromo extends StatefulWidget {
  @override
  _PilihPromoState createState() => _PilihPromoState();
}

class _PilihPromoState extends State<PilihPromo> {
  bool isImage46Button1 = true;
  bool isImage46Button2 = true;

  String get imageAssetButton1 {
    return isImage46Button1 ? 'assets/img46.png' : 'assets/img48.png';
  }

  String get imageAssetButton2 {
    return isImage46Button2 ? 'assets/img46.png' : 'assets/img48.png';
  }

  void toggleImage(int buttonIndex) {
    setState(() {
      if (buttonIndex == 1) {
        isImage46Button1 = !isImage46Button1;
      } else if (buttonIndex == 2) {
        isImage46Button2 = !isImage46Button2;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Promo',
          style: TextStyle(color: Color(0xFF5541D4)),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 25.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => toggleImage(1),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.756),
                        padding: EdgeInsets.all(5.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/img45.png',
                            width: 100.0,
                          ),
                          SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Discount Up To 50%',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF5541D4),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 3.0, horizontal: 5.0),
                                    child: Text(
                                      'E-wallet',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF5541D4),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 3.0, horizontal: 5.0),
                                    child: Text(
                                      'Min. Spending',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 160.0),
                                  Image.asset(
                                    imageAssetButton1,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                              ),
                              Text(
                                '*especially new user',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    ElevatedButton(
                      onPressed: () => toggleImage(2),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.756),
                        padding: EdgeInsets.all(5.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/img45.png',
                            width: 100.0,
                          ),
                          SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Discount 5000 IDR',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF5541D4),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 3.0, horizontal: 5.0),
                                child: Text(
                                  'E-wallet',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Row(
                                children: [
                                  SizedBox(width: 160.0),
                                  Image.asset(
                                    imageAssetButton2,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                              ),
                              Text(
                                '*especially new user',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PilihMetodeBayar extends StatefulWidget {
  @override
  _PilihMetodeBayarState createState() => _PilihMetodeBayarState();
}

class _PilihMetodeBayarState extends State<PilihMetodeBayar> {
  
  bool isImage46 = true;

  String get imageAsset {
    return isImage46 ? 'assets/img46.png' : 'assets/img48.png';
  }

  void toggleImage() {
    setState(() {
      isImage46 = !isImage46;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Payment Method', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0, bottom: 16.0, left: 25.0, right: 25.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: toggleImage,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.756),
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0),
                          
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                              'assets/img47.png',
                              width: 100.0, // Set the desired image width
                               // Set the desired image height
                          ),
                          SizedBox(width: 5.0), // Add some space between the image and text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'DANA',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              
                                Padding(
                                  padding: EdgeInsets.only(top: 3.0),
                                ),

                                Text(
                                  'Phone : 0895********',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color.fromRGBO(144, 144, 144, 1),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'Balance : 38400 IDR',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color.fromRGBO(144, 144, 144, 1),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),

                                Row(
                                  children: [
                                    SizedBox(width: 160.0),
                                    Image.asset(
                                      imageAsset,
                                    ),
                                  ],
                                ),

                                
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                ),

                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF5541D4),
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 3.0, bottom: 3.0),
                                      child: Text(
                                        'Minimum payment : 10.000 IDR',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ]
                                ),
                              ]
                            ),


                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class FeedBackPage extends StatelessWidget {
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Feedback', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
            SizedBox(height: 50.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            'Give a feedback!',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Color(0xFF5541D4),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 9.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            'If you have suggestions and input forms, please let us know via the column below.',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                              child: TextField(
                                controller: _feedbackController,
                                decoration: InputDecoration(
                                  hintText: 'Write Your Topic Here',
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: 1, // ini buat ukuran text area nya
                                maxLength: 50, // maksimal 50 karakter
                                buildCounter: (BuildContext context,
                                    {required int currentLength,
                                    required int? maxLength,
                                    required bool isFocused}) {
                                  return Text(
                                    '$currentLength/$maxLength',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Describe your issue or suggest.',
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: 8,
                                maxLength: 1000,
                                buildCounter: (BuildContext context,
                                    {required int currentLength,
                                    required int? maxLength,
                                    required bool isFocused}) {
                                  return Text(
                                    '$currentLength/$maxLength',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),

                            SizedBox(height: 5.0),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 0.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Terima kasih'),
                                      content: Text('Feedback Anda telah berhasil disimpan.'),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(
                                              Color(0xFF5541D4),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                    Color(0xFF5541D4),
                                  ),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                    Size(300, 50),
                                  ),
                                ),
                                child: Text('Send Feedback'),
                              ),
                            ),

                          ]
                        )
                      )
                    ], 
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

class MiniSoccerCategory extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar : AppBar(
        title: Text('Available Fields'),
        backgroundColor: Color(0xff7259cb),
        elevation: 4.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [                                                        
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(              
                                  builder: (context) => CKMSportsCenter(),
                                ),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 5.0),
                          
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/img29.jpg',
                              width: 125.0, // Set the desired image width
                               // Set the desired image height
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CKM Sports Center',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Sport  : Basket, Mini Soccer',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Location  : Karawang',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Open  : 07:00-18:00 WIB',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(194, 194, 194, 0.494),
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      padding: EdgeInsets.only(left: 3.0, right: 3.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(width: 4.0),
                                          Text(
                                            '4.5/5',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: 32.0),
                                    Text(
                                      '50.000/jam',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(              
                                  builder: (context) => RIBENSSportsCenter(),
                                ),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 5.0),
                          
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/img32.jpg',
                              width: 125.0, // Set the desired image width
                               // Set the desired image height
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'RIBENS Sports Center',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Sport  : Basket, Mini Soccer',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Location  : Jakarta Selatan',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Open  : 09:00-21:00 WIB',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(194, 194, 194, 0.494),
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      padding: EdgeInsets.only(left: 3.0, right: 3.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(width: 4.0),
                                          Text(
                                            '5/5',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: 32.0),
                                    Text(
                                      '250.000/jam',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                
                              ],
                            ),
                          ],
                        ),
                      ),
                    ], 
                  ),
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(              
                builder: (context) => ChatListPage(),
              ),
            );
          },
          tooltip: 'Chat',
          backgroundColor: Color(0xff7259cb),          
          child: const Icon(Icons.chat),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('assets/img16.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img17.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Promo(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img18.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => History(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img19.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class BadmintonCategory extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar : AppBar(
        title: Text('Available Fields'),
        backgroundColor: Color(0xff7259cb),
        elevation: 4.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NearestPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Find Nearest Field', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Notification', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/img40.png',
                              width: 100.0,
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ORDER",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),

                                  Text(
                                    "Your order received!",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),

                                  Text(
                                    "30/05/2023 20:07",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),

                                  
                                  
                                  
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Container(
                        width: 320,
                        height: 3,
                        color: Color.fromRGBO(153, 153, 153, 0.498)
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      
                    
                      
                    ], 
                  ),
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(              
                builder: (context) => ChatListPage(),
              ),
            );
          },
          tooltip: 'Chat',
          backgroundColor: Color(0xff7259cb),          
          child: const Icon(Icons.chat),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('assets/img16.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img17.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Promo(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img18.png'),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img19.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final List<ChatItem> _chats = [
    ChatItem(
      name: "John",
      lastMessage: "",
      time: "10:30",
      avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
      messages: [],
    ),
    ChatItem(
      name: "Jane",
      lastMessage: "",
      time: "10:00",
      avatarUrl: "https://randomuser.me/api/portraits/women/1.jpg",
      messages: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF5541D4),
      ),
      body: ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (BuildContext context, int index) {
          final chat = _chats[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatPage(
                    chats: _chats,
                    name: chat.name,
                    avatarUrl: chat.avatarUrl,
                    lastMessage: chat.lastMessage,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: ChatListItem(
                name: chat.name,
                lastMessage: chat.lastMessage,
                time: chat.time,
                avatarUrl: chat.avatarUrl,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
    required this.chats,
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
  }) : super(key: key);

  final List<ChatItem> chats;
  final String name;
  final String avatarUrl;
  final String lastMessage;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messages.addAll(
        widget.chats.firstWhere((chat) => chat.name == widget.name).messages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.avatarUrl),
            ),
            const SizedBox(width: 10),
            Text(widget.name),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF5541D4),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = _messages[index];
                return ChatBubble(
                  message: message.message,
                  isMe: message.isMe,
                  time: message.time,
                );
              },
            ),
          ),
          Divider(height: 1),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration.collapsed(
                      hintText: "Type a message",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final String message = _textController.text.trim();
                    if (message.isNotEmpty) {
                      _addMessage(message);
                    }
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addMessage(String message) {
    final currentTime = "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}";
    final newMessage = ChatMessage(
      message: message,
      isMe: true,
      time: currentTime,
    );
    final ChatItem chat = widget.chats.firstWhere(
      (chat) => chat.name == widget.name,
    );
    setState(() {
      _messages.add(newMessage);
      _textController.clear();
      chat.lastMessage = newMessage.message;
      chat.time = currentTime;
      chat.messages.add(newMessage);
    });
  }
}

class ChatMessage {
  final String message;
  final bool isMe;
  final String time;

  ChatMessage({
    required this.message,
    required this.isMe,
    required this.time,
  });
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String time;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isMe,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe)
            CircleAvatar(
              radius: 18,
              backgroundImage:
                  NetworkImage("https://i.pravatar.cc/150?img=1"),
            ),
          const SizedBox(width: 10),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue : Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft:
                      isMe ? Radius.circular(20) : Radius.circular(0),
                  bottomRight:
                      isMe ? Radius.circular(0) : Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 16,
                      color: isMe ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: isMe ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final String avatarUrl;

  const ChatListItem({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                lastMessage,
                style: TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Text(
          time,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}

class ChatItem {
  String name;
  String lastMessage;
  String time;
  String avatarUrl;
  List<ChatMessage> messages;

  ChatItem({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarUrl,
    required this.messages,
  });
}

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int selectedStarIndex = -1;
  List<bool> starSelected = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'WRITE YOUR REVIEW',
          style: TextStyle(
            color: Color(0xFF5541D4),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/img32.jpg',
                          width: 200.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "RIBENS SPORTS CENTER",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto-Regular',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 5; i++)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedStarIndex = i;
                                  for (int j = 0; j <= i; j++) {
                                    starSelected[j] = true;
                                  }
                                  for (int j = i + 1; j < 5; j++) {
                                    starSelected[j] = false;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.star,
                                color: starSelected[i]
                                    ? Colors.yellow
                                    : Color.fromRGBO(152, 152, 152, 0.498),
                                size: 40.0,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "*Choose your review",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto-Regular',
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Good and correct review will help others to find out the quality of the available fields.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto-Regular',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "REVIEW DESCRIPTION:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto-Regular',
                          color: Color(0xFF5541D4),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Describe your review here.',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 8,
                        maxLength: 1000,
                        buildCounter: (BuildContext context,
                            {required int currentLength,
                            required int? maxLength,
                            required bool isFocused}) {
                          return Text(
                            '$currentLength/$maxLength',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedStarIndex == -1) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Error'),
                                content: Text('Please choose your review.'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Terima kasih'),
                                content: Text('Review anda berhasil disimpan.'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Color(0xFF5541D4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(
                            Color(0xFF5541D4),
                          ),
                          minimumSize:
                              MaterialStateProperty.all<Size>(
                            Size(300, 50),
                          ),
                        ),
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Promo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                      ),
                  
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Promo & Cashback",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),
                      
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: ElevatedButton(
                                  child: Image.asset('assets/img23.png'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Dis70(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: ElevatedButton(
                                  child: Image.asset('assets/img22.png'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                        
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Reservation Promo",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: ElevatedButton(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/img29.jpg', width: 200.0),
                                      Text(
                                        'CKM Sports Center',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Karawang, Jawa Barat',
                                        style: TextStyle(
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CKMSportsCenter(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: ElevatedButton(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/img32.jpg', width: 200.0),
                                      Text(
                                        'RIBENS Sports Center',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Cilandak, Jakarta Selatan',
                                        style: TextStyle(
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CKMSportsCenter(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ], 
                  ),
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(              
                builder: (context) => ChatListPage(),
              ),
            );
          },
          tooltip: 'Chat',
          backgroundColor: Color(0xff7259cb),          
          child: const Icon(Icons.chat),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('assets/img16.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img17.png'),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img18.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => History(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img19.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class History extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('HistoryOrder', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/img32.jpg',
                              width: 150.0,
                            ),
                            SizedBox(width: 8.0), // Add some space between the image and text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "RIBENS SPORTS CENTER",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),

                                  Text(
                                    "Play: 1 hour(s)",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),

                                  Text(
                                    "Date Play: 31 May 2023 16:00",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  ),

                                  ElevatedButton(
                                    child: Text('REVIEW'),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
                                      backgroundColor: Colors.lightGreen,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0), // Set rounded corner radius
                                      ),
                                    ),
                                    onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(              
                                              builder: (context) => ReviewPage(),
                                            ),
                                          );
                                      },
                                  ),

                                  Text(
                                    "250.000 IDR",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular',
                                    ),
                                  )
                                  
                                  
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      Container(
                        width: 320,
                        height: 3,
                        color: Color.fromRGBO(201, 201, 201, 0.494) 
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),

                      
                    
                      
                    ], 
                  ),
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(              
                builder: (context) => ChatListPage(),
              ),
            );
          },
          tooltip: 'Chat',
          backgroundColor: Color(0xff7259cb),          
          child: const Icon(Icons.chat),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('assets/img16.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img17.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Promo(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img18.png'),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img19.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [                                    
                      Padding(
                        padding: EdgeInsets.only(top: 100.0),
                      ),
                      
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/img25.png'),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "KEZIA FOE",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 7.0),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "+62 XXX - XXXX - 8993",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 7.0),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "West Jakarta, Indonesia",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset('assets/img26.png'),
                          ),
                          ElevatedButton(
                            child: Text('EDIT PROFILE'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 15.0),
                              backgroundColor: Color.fromARGB(255, 218, 218, 218),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(              
                                  builder: (context) => EditProfile(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset('assets/img27.png'),
                          ),
                          ElevatedButton(
                            child: Text('LOG OUT'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 105.0, vertical: 15.0),
                              backgroundColor: Color.fromARGB(255, 218, 218, 218),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(              
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ], 
                  ),
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(              
                builder: (context) => ChatListPage(),
              ),
            );
          },
          tooltip: 'Chat',
          backgroundColor: Color(0xff7259cb),          
          child: const Icon(Icons.chat),
        ),

        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('assets/img16.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img17.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => Promo(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img18.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(              
                        builder: (context) => History(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/img19.png'),
                  onPressed: () {
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class EditProfile extends StatelessWidget{
  @override
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController domicileController = TextEditingController();

  void checkEditProfile(BuildContext context){
    String enteredFirst = firstNameController.text.trim();
    String enteredLast = lastNameController.text.trim();
    String enterenPhone = phoneController.text.trim();
    String enteredDomicile = domicileController.text.trim();

    if (enteredFirst.length<3){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Save Profile Failed.'),
          content: Text('First Name must be more than 3 characters.'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else if (enteredLast.length<3){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Save Profile Failed.'),
          content: Text('Last Name must be more than 3 characters.'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else{
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Save Profile Success.'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      
      
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Set the color of the icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Edit Profile', style: TextStyle(color: Color(0xFF5541D4),),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),        
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 50.0),
                            ),

                            

                            Padding(
                              padding: EdgeInsets.only(top: 50.0),
                            ),

                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset('assets/img25.png'),
                                ElevatedButton(
                                  onPressed: () {
                                      // Logic ganti foto profil nya
                                  },
                                  child: Image.asset('assets/img28.png'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                    ),
                                  ),
                                ),
                              ]
                            ),
                            
                            TextField(
                              controller: firstNameController,
                              decoration: InputDecoration(
                                labelText: 'First Name',
                              ),
                            ),

                            TextField(
                              controller: lastNameController,
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                              ),
                            ),

                            TextField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                              ),
                            ),

                            TextField(
                              controller: domicileController,
                              decoration: InputDecoration(
                                labelText: 'Domicile',
                              ),
                            ),

                            SizedBox(height: 25.0),
                            ElevatedButton(
                              child: Text('Simpan'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
                                backgroundColor: Color(0xff7259cb),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0), // Set rounded corner radius
                                ),
                              ),
                              onPressed: () {
                                checkEditProfile(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ], 
          ),
        ),
    );
  }
}
