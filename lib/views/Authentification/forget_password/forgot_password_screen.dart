import 'package:coffeeshop/shared/componenets/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        physics:const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15.0,
              ),
              defaultText(mainText: 'Forgot Password', secondText: 'Enter your email address'),
                const SizedBox(
                height: 40,
              ),
              Form(
                key:formKey,
                child: defaultFormField(
                    context: context,
                    asset: 'assets/images/email.jpg',
                    hint: 'Email address',
                    controller: emailController,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Email field is null!';
                      }
                    },
                    textInputType: TextInputType.emailAddress),
              ),
              const SizedBox(
                height: 30,
              ),

              const SizedBox(
                height: 30,
              ),

              const SizedBox(
                height: 90.0,
              ),
              defaultButton((){
                if(formKey.currentState!.validate()) {
                  FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value) =>flutterToast(state: toastStates.success, msg: 'Reset password has been sent to ${emailController.text}'));
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
