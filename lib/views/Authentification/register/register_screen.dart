import 'package:coffeeshop/shared/componenets/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';
import '../cubit/auth_states.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthStates>(builder: (context,state){
      return Scaffold(
        appBar: AppBar(

        ),
        body: SingleChildScrollView(

          child: SizedBox(

            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultText(mainText: 'Sign up', secondText: 'Create an account here'),
                    const SizedBox(
                      height: 40,
                    ),
                    defaultFormField(
                        context: context,
                        asset: 'assets/images/user.jpg',
                        hint: 'Username',
                        controller: nameController, textInputType: TextInputType.name, validator: (String? value){
                      if(value!.isEmpty){
                        return 'Username field is Empty';
                      }
                    }),
                    const SizedBox(
                      height: 30,
                    ),
                    defaultFormField(
                        context: context,
                        asset: 'assets/images/phone_num.jpg',
                        hint: 'Mobile number',
                        controller: phoneController, validator: (String? value){
                      if(value!.isEmpty){
                        return 'Phone field is Empty';
                      }
                    }, textInputType: TextInputType.phone),
                    const SizedBox(
                      height: 30,
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
                      height: 90.0,
                    ),
                    defaultButton(() {
                      if(formKey.currentState!.validate()){
                        AuthCubit.get(context).register(context, name: nameController.text, email: emailController.text, password: passwordController.text, phone:int.parse(phoneController.text) );
                      }
                    }),

                    const SizedBox(height: 40,),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Row(
                        children:  [
                          const Text(
                            'Already a member?',
                            style: TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: ()=>navigateAndReplace(context, LoginScreen()),

                            child:const Text(
                              ' Sign in',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(50, 74, 89, 1)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },listener:(context,state){
      if(state is RegisterLoadingState){
       const CircularProgressIndicator();
      }
    },);

  }
}
