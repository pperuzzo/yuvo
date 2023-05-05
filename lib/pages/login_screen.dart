import 'package:another_flushbar/flushbar.dart';
import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuvo/providers/authentication_provider.dart';
import 'package:velocity_x/velocity_x.dart';

enum MobileVerificationState {
  showFormState,
  showOptFormState,
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState = MobileVerificationState.showFormState;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = "";
  bool showLoading = false;

  Widget getCorrectScreen(context) {
    switch (currentState) {
      case MobileVerificationState.showFormState:
        return getMobileFormWidget(context);
      case MobileVerificationState.showOptFormState:
        return getOptFormWidget(context);
    }
  }

  Widget getMobileFormWidget(context) {
    return Column(children: [
      const Spacer(),
      CupertinoTextField(
        controller: phoneController,
        keyboardType: TextInputType.phone,
        placeholder: "Phone Number",
      ).pOnly(left: 32, right: 32, bottom: 24),
      CupertinoButton(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: const Text("Next"),
          onPressed: () async {
            setState(() {
              showLoading = true;
            });
            await _auth.verifyPhoneNumber(
                phoneNumber: phoneController.text,
                verificationCompleted: (phoneAuthCredential) async {
                  setState(() {
                    showLoading = false;
                  });
                  //signInWithPhoneAuthCredential(phoneAuthCredential);
                },
                verificationFailed: (verificationFailed) async {
                  setState(() {
                    showLoading = false;
                  });
                  displayErrorMessage(verificationFailed.message);
                },
                codeSent: (verificationId, resendingToken) async {
                  setState(() {
                    showLoading = false;
                    currentState = MobileVerificationState.showOptFormState;
                    this.verificationId = verificationId;
                  });
                },
                codeAutoRetrievalTimeout: (verificationId) async {});
          },
          color: CupertinoColors.activeBlue),
      const Spacer()
    ]);
  }

  Widget getOptFormWidget(context) {
    return Column(children: [
      const Spacer(),
      CupertinoTextField(
        controller: otpController,
        keyboardType: TextInputType.number,
        placeholder: "Verification Code",
      ).pOnly(left: 32, right: 32, bottom: 24),
      CupertinoButton(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: const Text("Next"),
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);
            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          color: CupertinoColors.activeBlue),
      const Spacer()
    ]);
  }

  displayErrorMessage(messagge) {
    return Flushbar(
      title: "Error",
      message: messagge,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
    ).show(context);
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        context.beamToNamed('/activities');
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      displayErrorMessage(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isAuthenticated =
        Provider.of<AuthenticationNotifier>(context).isAuthenticated;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: showLoading
          ? const Center(child: CupertinoActivityIndicator())
          : getCorrectScreen(context),
    );
  }
}


      // Center(
      //   child: isAuthenticated
      //       ? Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             const Text('Successfully logged in.'),
      //             const SizedBox(height: 15),
      //             ElevatedButton(
      //               onPressed: () => context.beamToNamed('/activities'),
      //               child: Text('Beam to books location $isAuthenticated'),
      //             ),
      //           ],
      //         )
      //       : ElevatedButton(
      //           onPressed: () =>
      //               Provider.of<AuthenticationNotifier>(context, listen: false)
      //                   .login(),
      //           child: Text('Login $isAuthenticated'),
      //         ),
      // ),