import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 21,
        height: 1,
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Color.fromRGBO(137, 146, 160, 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    final defaultPinTheme = PinTheme(
      width: MediaQuery.of(context).size.height * 0.05,
      height: MediaQuery.of(context).size.height * 0.05,
      textStyle: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 46),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Pinput(
            pinContentAlignment: Alignment.center,
            autofocus: true,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme,
            submittedPinTheme: submittedPinTheme,
            androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
            length: 4,
            onChanged: (value) {},
            controller: controller,
            focusNode: focusNode,
            separator: SizedBox(width: 16),
            showCursor: true,
            cursor: cursor,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text(
                'VERIFY',
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style:
                  ElevatedButton.styleFrom(primary: Color.fromRGBO(0, 0, 0, 1)),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text.rich(TextSpan(
              text: "'Didn't receive OTP?",
              style: GoogleFonts.montserrat(fontSize: 12),
              children: [
                TextSpan(
                    text: 'RESEND',
                    style: GoogleFonts.montserrat(
                        fontSize: 12, fontWeight: FontWeight.bold))
              ]))
        ],
      ),
    );
  }
}
