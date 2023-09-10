import 'package:flutter/material.dart';
import 'LoginPage.dart';

// Define DefaultSize as a constant double value
const double DefaultSize = 16.0;
const double FormHeight = 60.0;

class SignupScreen extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignupScreen({Key? key}) : super(key: key);

  void _handleSignUp(BuildContext context) {
    // Implement your signup logic here
    final String fullName = fullNameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (fullName.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      // Here, you can use a user authentication service to sign up the user.
      // If signup is successful, navigate to the welcome page.
      // For example, you can use Firebase Authentication or your custom logic.
      // After successful signup, navigate to the welcome page.
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(DefaultSize),
            child: Column(
              children: [
                FormHeaderWidget(
                  image: 'assets/images/luffy.png',
                  title: "Get on Board!",
                  subTitle: "Create your profile to start your journey with us..",
                  imageHeight: 0.4,
                ),
                SignUpFormWidget(
                  fullNameController: fullNameController,
                  emailController: emailController,
                  phoneNumberController: phoneNumberController,
                  passwordController: passwordController,
                ),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormHeaderWidget extends StatelessWidget {
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  const FormHeaderWidget({
    Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.2,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(image: AssetImage(image), color: imageColor, height: size.height * imageHeight),
        SizedBox(height: heightBetween),
        Text(title, style: Theme.of(context).textTheme.headline1),
        Text(subTitle, textAlign: textAlign, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}

class SignUpFormWidget extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;

  const SignUpFormWidget({
    Key? key,
    required this.fullNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.passwordController,
  }) : super(key: key);

  bool _validateForm(BuildContext context) {
    final String fullName = fullNameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String phoneNumber = phoneNumberController.text.trim();

    if (fullName.isEmpty || email.isEmpty || password.isEmpty || phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all required fields.'),
        ),
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: FormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: fullNameController,
              decoration: InputDecoration(
                label: Text("FullName"),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: FormHeight - 20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text("Email"),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: FormHeight - 20),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                label: Text("PhoneNo"),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: FormHeight - 20),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                label: Text("Password"),
                prefixIcon: Icon(Icons.fingerprint),
              ),
            ),
            const SizedBox(height: FormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_validateForm(context)) {
                    // Proceed with the signup process
                    // You can call your signup logic here
                    // If signup is successful, navigate to the welcome page.
                    // For example, you can use Firebase Authentication or your custom logic.
                    // After successful signup, navigate to the welcome page.
                    Navigator.pushReplacementNamed(context, '/');
                  } else {
                    // Show an error message on the signup page
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please fill in all required fields.'),
                      ),
                    );
                  }
                },
                child: Text("Signup".toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage('assets/images/1689022856-home-player-prime-lifestyle-hero-bg-2xl-removebg-preview (1).png'),
              width: 20.0,
            ),
            label: Text("SignInWithGoogle".toUpperCase()),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginPage
            );
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: "Already have an account?", // Use the variable here
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextSpan(text: "login".toUpperCase()), // Use the variable here
          ])),
        ),
      ],
    );
  }
}
