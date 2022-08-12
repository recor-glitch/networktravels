import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:networktravels/Screens/Auth/Signup/components/custom_textfield.dart';

class PhoneForm extends StatefulWidget {
  const PhoneForm({Key? key}) : super(key: key);

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
            controller: _controller,
            txt: 'Mobile number',
            keyboardtype: TextInputType.number),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/otp');
            },
            child: Text(
              'LOGIN',
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            style:
                ElevatedButton.styleFrom(primary: Color.fromRGBO(0, 0, 0, 1)),
          ),
        ),
      ],
    );
  }
}
