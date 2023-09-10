import 'package:flutter/material.dart';
import 'forget_password_mail.dart';
class ForgetPasswordBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ForgetPassword", style: Theme.of(context).textTheme.headline2),
          Text("ForgetPasswordSub", style: Theme.of(context).textTheme.bodyText2),
          const SizedBox(height: 30.0),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgetPasswordMail(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey.shade200,
              ),
              child: Row(
                children: [
                  Icon(Icons.mail_outline_rounded, size: 60),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email", style: Theme.of(context).textTheme.headline6),
                      Text("Reset Email", style: Theme.of(context).textTheme.bodyText2),
                    ],
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
