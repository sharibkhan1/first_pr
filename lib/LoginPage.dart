import 'package:flutter/material.dart';
import 'main.dart';
import 'welcome.dart';
import 'signup_screen.dart';
import 'forget_password_model_bottom_sheet.dart';

// Define DefaultSize as a constant double value
const double DefaultSize = 16.0;

const String tWelcomeScreenImage = 'assets/images/luffy.png'; // Replace with your image path
const String tLoginTitle = 'Login Title'; // Replace with your login title
const String tLoginSubTitle = 'Login Subtitle'; // Replace with your login subtitle

const double tFormHeight = 60.0; // Replace with your desired form height
const String tEmail = 'Email'; // Replace with your email label
const String tPassword = 'Password'; // Replace with your password label
const String tForgetPassword = 'Forgot Password?'; // Replace with your forgot password label
const String tLogin = 'Login'; // Replace with your login button label
const double tDefaultSize = 16.0; // You can adjust the value as needed

const String tGoogleLogoImage = 'assets/images/q8-vPggS_400x400-removebg-preview.png'; // Replace with your Google logo image path
const String tSignInWithGoogle = 'Sign in with Google'; // Replace with your Google sign-in text
const String tDontHaveAnAccount = "Don't have an account?"; // Replace with your text
const String tSignup = 'Sign Up'; // Replace with your sign-up text

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  void _showForgetPasswordBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => ForgetPasswordBottomSheet(), // Use the new widget here
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the size in LoginHeaderWidget()
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(DefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage(tWelcomeScreenImage),
                      height: size.height * 0.2,
                    ),
                    Text(tLoginTitle, style: Theme.of(context).textTheme.headline1),
                    Text(tLoginSubTitle, style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
                Form(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              labelText: tEmail,
                              hintText: tEmail,
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: tFormHeight - 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint),
                            labelText: tPassword,
                            hintText: tPassword,
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: null,
                              icon: Icon(Icons.remove_red_eye_sharp),
                            ),
                          ),
                        ),
                        const SizedBox(height: tFormHeight - 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              _showForgetPasswordBottomSheet(context); // Call the function to show the bottom sheet
                            },
                            child: Text("Forget password".toUpperCase()),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage(), // Replace with the name of your MyApp class
                                ),
                              );
                            },
                            child: Text(tLogin.toUpperCase()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("OR"),
                    const SizedBox(height: tFormHeight - 20),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        icon: const Image(image: AssetImage(tGoogleLogoImage), width: 20.0),
                        onPressed: () {
                          // Handle Google Sign-in
                        },
                        label: const Text(tSignInWithGoogle),
                      ),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupScreen()), // Navigate to SignupPage
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                            text: tDontHaveAnAccount,
                            style: Theme.of(context).textTheme.bodyText1,
                            children: const [
                              TextSpan(text: tSignup, style: TextStyle(color: Colors.blue))
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
