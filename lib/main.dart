import 'package:coffeeshop/views/Authentification/cubit/auth_cubit.dart';
import 'package:coffeeshop/views/Authentification/cubit/auth_states.dart';
import 'package:coffeeshop/views/Authentification/forget_password/forgot_password_screen.dart';
import 'package:coffeeshop/views/Authentification/login/login_screen.dart';
import 'package:coffeeshop/views/Authentification/register/register_screen.dart';
import 'package:coffeeshop/views/splash/splash_screeb.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>AuthCubit(),child: BlocConsumer<AuthCubit,AuthStates>(builder: (context,state){
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme:const AppBarTheme(
                  foregroundColor: Colors.black,
                  color: Colors.white,
                  elevation: 0.0
              )
          ),
          home:OnBoardingScreen()
      );
    },listener:(context,state){} ,),)
     ;
  }
}

