import 'package:coffeeshop/shared/componenets/components.dart';
import 'package:coffeeshop/views/Authentification/cubit/auth_cubit.dart';
import 'package:coffeeshop/views/Authentification/cubit/auth_states.dart';
import 'package:coffeeshop/views/Authentification/forget_password/forgot_password_screen.dart';
import 'package:coffeeshop/views/Authentification/register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubit,AuthStates>(builder: (context,state){
      return Scaffold(
        appBar: AppBar(

        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultText(mainText: 'Sign in', secondText: 'Welcome back'),
                    const SizedBox(
                      height: 40,
                    ),
                    defaultFormField(
                        context: context,
                        asset: 'assets/images/email.jpg',
                        hint: 'Email address',
                        controller: emailController, validator: (String? value){
                          if(value!.isEmpty){
                            return 'Email field is Empty';
                          }
                    }, textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 30,
                    ),
                    defaultFormField(
                      obsText: AuthCubit.get(context).isPasswordShown?false:true,
                        context: context,
                        asset: 'assets/images/lock.jpg',
                        hint: 'Password',
                        controller: passwordController, validator: (String? value){
                      if(value!.isEmpty){
                        return 'Password field is Empty';
                      }
                    }, textInputType: TextInputType.text,
                    icon: AuthCubit.get(context).suffix,
                      onTap: (){
                        AuthCubit.get(context).changeVisibility();
                      }
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: ()=>navigateAndReplace(context, ForgotPasswordScreen()),
                      child: const Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(50, 74, 89, 1),
                                decoration: TextDecoration.underline),
                          )),
                    ),
                    const SizedBox(
                      height: 90.0,
                    ),
                    defaultButton(() {
                      if(formKey.currentState!.validate()){
                        AuthCubit.get(context).login(context,email: emailController.text, password: passwordController.text);
                      }
                    }),
                    const SizedBox(height: 70,),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Row(
                        children:  [
                          const Text(
                            'New member?',
                            style: TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: ()=>navigateAndReplace(context, RegisterScreen()),
                            child: const Text(
                              ' Sign up',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(50, 74, 89, 1)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },listener:(context,state){

    },);

  }
}
