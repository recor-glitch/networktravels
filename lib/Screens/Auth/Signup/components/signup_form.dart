import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Screens/Auth/Signup/components/custom_textfield.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late TextEditingController name, mobile, email;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    mobile = TextEditingController();
    email = TextEditingController();
  }

  @override
  void dispose() {
    name.dispose();
    mobile.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 46),
      child: Form(
          child: Column(
        children: [
          CustomTextField(
              controller: name,
              txt: 'Full name',
              keyboardtype: TextInputType.name),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          CustomTextField(
              controller: mobile,
              txt: 'Mobile number',
              keyboardtype: TextInputType.number),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          CustomTextField(
              controller: email,
              txt: 'Email(optional)',
              keyboardtype: TextInputType.emailAddress),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/phn');
              },
              child: Text(
                'REGISTER',
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style:
                  ElevatedButton.styleFrom(primary: Color.fromRGBO(0, 0, 0, 1)),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text.rich(TextSpan(
              text: 'Already have an account?',
              style: GoogleFonts.montserrat(fontSize: 12),
              children: [
                TextSpan(
                    text: 'LOGIN',
                    style: GoogleFonts.montserrat(
                        fontSize: 12, fontWeight: FontWeight.bold))
              ]))
        ],
      )),
    );
  }
}
