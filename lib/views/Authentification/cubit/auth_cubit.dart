import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../models/user_model/userModel.dart';
import '../../../shared/componenets/components.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(InitialApp());

  static AuthCubit get(context) => BlocProvider.of(context);

  IconData suffix= Icons.visibility_outlined;
  bool isPasswordShown=true;

  void changeVisibility(){
    isPasswordShown=!isPasswordShown;
    suffix=isPasswordShown==true?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

// user login
  login(context,{required email, required password}) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      flutterToast(msg: 'Logged in successfully!', state: toastStates.success);
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((onError) {
      flutterToast(msg: 'Something went wrong, try again!', state: toastStates.error,);
      print(onError.toString());
        emit(LoginErrorState(onError.toString()));
    });
  }

  // user register
  void register(context,
      {required String name,
      required String email,
      required String password,
      required int phone}) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {

      print('user uid is ${value.user!.uid}');
      userCreate(context,
          phone: phone, name: name, email: email, userId: value.user!.uid);
      emit(RegisterSuccessState(value.user!.uid));
      flutterToast(msg: 'Account created successfully!', state: toastStates.success);

    }).catchError((onError) {
      flutterToast( msg: 'Something went wrong, try again!', state: toastStates.error);
      print(onError.toString());
       emit(RegisterErrorState(onError.toString()));
    });
  }

// user add to fire store
  void userCreate(context,
      {required String name,
      required String email,
      required userId,
      required phone}) {
    UserModel userModel = UserModel(
      name,
      email,
      phone,
      userId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set(userModel.toMap())
        .then((value) {
      emit(CreateUserSuccessState(userId));
    }).catchError((onError) {
      emit(CreateUserErrorState(onError.toString()));
    });
  }
}
